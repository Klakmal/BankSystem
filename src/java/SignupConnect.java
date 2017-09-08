import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;

/**
 * Servlet implementation class MySQLConnect
 */

public class SignupConnect extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
       
        
        PrintWriter out = response.getWriter();
        String user0 = request.getParameter("user0");
        String pass0 = request.getParameter("pass0");
        String pos0 = request.getParameter("pos0");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_db", "root", "");
            
            
            PreparedStatement pst2 =conn.prepareStatement(" insert into login (username, password, position)"
        + " values (?, ?, ?)"); 
            
            
            pst2.setString(1, user0);
            pst2.setString(2, pass0);
            pst2.setString(3, pos0);
            
            
            int ss= pst2.executeUpdate();
            //ResultSet rs2 = pst2.executeQuery();
            if ( ss > 0) {
                out.println("Correct login credentials");
                response.sendRedirect("./home.jsp");
            } 
            else {
                out.println("Incorrect login credentials");
                response.sendRedirect("./error.jsp");
            }
            
        } 
        catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}