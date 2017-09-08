import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;
import java.io.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 * Servlet implementation class MySQLConnect
 */

public class AddATM extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
        
        PrintWriter out = response.getWriter();
        String b_id = request.getParameter("b_id");
        String a_name = request.getParameter("a_name");
        String a_address1 = request.getParameter("a_address1");
        String a_address2 = request.getParameter("a_address2");
        String a_address3 = request.getParameter("a_address3");
        
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/banksystem_db", "root", "");
            
          try{  
            PreparedStatement pst1 =conn.prepareStatement(" insert into atm (b_id, a_name, a_address1, a_address2, a_address3)"
        + " values (?, ?, ?, ?, ?)"); 
            
          
            pst1.setString(1, b_id);
            pst1.setString(2, a_name);
            pst1.setString(3, a_address1);
            pst1.setString(4, a_address2);
            pst1.setString(5, a_address3);
          
            
            
            int st= pst1.executeUpdate();
            //ResultSet rs2 = pst2.executeQuery();
            if ( st > 0) {
                
                //------------------------------ log -------------  
                String action = "Add_ATM";
                String user_name  = (String) request.getSession().getAttribute("user");
                String timeStamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new java.util.Date());
                   
                     PreparedStatement pst4 =conn.prepareStatement(" insert into action_log (action, branch_id, branch_name, username, timestamp)"
        + " values (?, ?, ?, ?, ?)");
                    pst4.setString(1, action);
                    pst4.setString(2, b_id);
                    pst4.setString(3, a_name);
                    pst4.setString(4, user_name);
                    pst4.setString(5, timeStamp);
                    
                    int b1s3= pst4.executeUpdate();
            //------------------------------------------------- 
                out.println("Correct login credentials");
                //response.sendRedirect("./viewbranch.jsp");
                out.println("<html><script type=\"text/javascript\">alert('Successfully added a new ATM!');window.location='./viewbranch.jsp'</script></html>");
            } 
            else {
                out.println("Incorrect login credentials");
                response.sendRedirect("./error.jsp");
            }
            
          }catch(MySQLIntegrityConstraintViolationException ec){
              out.println("<html><script type=\"text/javascript\">alert('ID is alredy assign for an ATM !');window.location='./addbranch.jsp'</script></html>");
          } 
           
        } 
        catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            
        }
    }
}