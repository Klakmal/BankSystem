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

/**
 * Servlet implementation class MySQLConnect
 */

public class UpdateATM extends HttpServlet {
    String confirmpassword2, passupdate, userupdate;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
        
        PrintWriter outt = response.getWriter();
        String b_ida = request.getParameter("b_ida");
        String a_name = request.getParameter("a_name");
        String a_address1 = request.getParameter("a_address1");
        String a_address2 = request.getParameter("a_address2");
        String a_address3 = request.getParameter("a_address3");
       
        confirmpassword2 = request.getParameter("confirmpassword2");
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/banksystem_db", "root", "");
            
          if(!" ".equals(b_ida)){
                 
             
            outt.println(a_name);
            outt.println(a_address1);
            PreparedStatement psta2 =conn.prepareStatement(" UPDATE atm SET a_name = ?, a_address1 = ?, a_address2 = ?, a_address3 = ? WHERE b_id = ? "); 
            
            
            
           
            psta2.setString(1, a_name);
            psta2.setString(2, a_address1);
            psta2.setString(3, a_address2);
            psta2.setString(4, a_address3);
            
            psta2.setString(5, b_ida);
            
            
           
            
            userupdate  = (String) request.getSession().getAttribute("user");
            passupdate  = (String) request.getSession().getAttribute("pass");
            
            if(confirmpassword2 == null ? passupdate != null : !confirmpassword2.equals(passupdate)) {
                    System.out.println("Unauthorized");
                    //error ="Password is wrong !";
                   outt.println("<html><script type=\"text/javascript\">alert('"+ userupdate +" your password is not right !');window.location='./viewbranch.jsp'</script></html>");
                    //request.getRequestDispatcher("./addbranch.jsp").forward(request, response);
                }
                else{
            
            int b1sa= psta2.executeUpdate();
            
            //ResultSet rs2 = pst2.executeQuery();
            
            
            
            
            
            if ( b1sa > 0) {
                outt.println("Correct update ATM");
                
                 //------------------------------ log -------------  
                String action = "Update_ATM";
                String user_name  = (String) request.getSession().getAttribute("user");
                String timeStamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new java.util.Date());
                   
                     PreparedStatement pst4 =conn.prepareStatement(" insert into action_log (action, branch_id, branch_name, username, timestamp)"
        + " values (?, ?, ?, ?, ?)");
                    pst4.setString(1, action);
                    pst4.setString(2, b_ida);
                    pst4.setString(3, a_name);
                    pst4.setString(4, user_name);
                    pst4.setString(5, timeStamp);
                    
                    int b1s3= pst4.executeUpdate();
            //------------------------------------------------- 
                    outt.println("<html><script type=\"text/javascript\">alert('Successfully Updated ATM "+ a_name +" !');window.location='./viewbranch.jsp'</script></html>");
                
            } 
            else {
                outt.println(b_ida);
                outt.println("Incorrect login credentials");
                //response.sendRedirect("./error.jsp");
            }
            
        }
          }else{
              outt.println("<html><script type=\"text/javascript\">alert('Please select an ATM !');window.location='./viewbranch.jsp'</script></html>");
          }
        }
        catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    
     
}