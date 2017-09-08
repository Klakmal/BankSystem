import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class UpdateBranch extends HttpServlet {
    String confirmpassword2, passupdate, userupdate;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
        
        PrintWriter outt = response.getWriter();
        String b_id = request.getParameter("b_id");
        String b_name = request.getParameter("b_name");
        String b_address1 = request.getParameter("b_address1");
        String b_address2 = request.getParameter("b_address2");
        String b_address3 = request.getParameter("b_address3");
        String b_manager = request.getParameter("b_manager");
        String b_tel1 = request.getParameter("b_tel1");
        String b_tel2 = request.getParameter("b_tel2");
        String b_fax = request.getParameter("b_fax");
        String b_email = request.getParameter("b_email");
        String weekdays_f = request.getParameter("weekdays_f");
        String weekdays_t = request.getParameter("weekdays_t");
        String weekdays;
        String saturday_f = request.getParameter("saturday_f");
        String saturday_t = request.getParameter("saturday_t");
        String saturday;
        String sunday_f = request.getParameter("sunday_f");
        String sunday_t = request.getParameter("sunday_t");
        String sunday;
        confirmpassword2 = request.getParameter("confirmpassword2");
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/banksystem_db", "root", "");
         
         if(!" ".equals(b_id)){ 
             
           
            outt.println(b_name);
            PreparedStatement pst2 =conn.prepareStatement(" UPDATE branch SET b_name = ?, b_address1 = ?, b_address2 = ?, b_address3 = ?, b_manager = ?, b_tel1 = ?, b_tel2 = ?, b_fax = ?, b_email = ? WHERE b_id = ? "); 
            
            
            
           
            pst2.setString(1, b_name);
            pst2.setString(2, b_address1);
            pst2.setString(3, b_address2);
            pst2.setString(4, b_address3);
            pst2.setString(5, b_manager);
            pst2.setString(6, b_tel1);
            pst2.setString(7, b_tel2);
            pst2.setString(8, b_fax);
            pst2.setString(9, b_email);
            pst2.setString(10, b_id);
            
            weekdays= weekdays_f + " - " + weekdays_t;
            saturday= saturday_f + " - " + saturday_t;
            sunday= sunday_f + " - " + sunday_t;
            
            PreparedStatement pst3 =conn.prepareStatement(" UPDATE openhours SET  weekdays = ?, saturday = ?, sunday = ? WHERE b_id = ? ");
            
            
            pst3.setString(1, weekdays);
            pst3.setString(2, saturday);
            pst3.setString(3, sunday);
            pst3.setString(4, b_id);
            
            userupdate  = (String) request.getSession().getAttribute("user");
            passupdate  = (String) request.getSession().getAttribute("pass");
            
            if(confirmpassword2 == null ? passupdate != null : !confirmpassword2.equals(passupdate)) {
                    System.out.println("Unauthorized");
                   
                   outt.println("<html><script type=\"text/javascript\">alert('"+ userupdate +" your password is not right !');window.location='./viewbranch.jsp'</script></html>");
                    
                }
                else{
            
            int b1s= pst2.executeUpdate();
            int b2s= pst3.executeUpdate();
            //ResultSet rs2 = pst2.executeQuery();
            
            
            
            
            
            if ( b1s > 0) {
                outt.println("Correct update");
                
                if( b2s > 0){
                    
                    //------------------------------ log -------------  
                String action = "Update_Branch";
                String user_name  = (String) request.getSession().getAttribute("user");
                String timeStamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new java.util.Date());
                   
                     PreparedStatement pst4 =conn.prepareStatement(" insert into action_log (action, branch_id, branch_name, username, timestamp)"
        + " values (?, ?, ?, ?, ?)");
                    pst4.setString(1, action);
                    pst4.setString(2, b_id);
                    pst4.setString(3, b_name);
                    pst4.setString(4, user_name);
                    pst4.setString(5, timeStamp);
                    
                    int b1s3= pst4.executeUpdate();
            //------------------------------------------------- 
                    
                    outt.println("<html><script type=\"text/javascript\">alert('Successfully Updated Branch "+ b_name +" !');window.location='./viewbranch.jsp'</script></html>");
                }
            } 
            else {
                outt.println("Incorrect login credentials");
                response.sendRedirect("./error.jsp");
            }
            
        }
         }else{
              outt.println("<html><script type=\"text/javascript\">alert('Please select a Branch !');window.location='./viewbranch.jsp'</script></html>");
         }
        }
        catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    
     
}