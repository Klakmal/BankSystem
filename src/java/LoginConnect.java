/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author lakmal_j
 */
public class LoginConnect extends HttpServlet {

    String user, pass, b_id, b_name, b_address1, b_address2, b_address3, b_manager, b_tel1, b_tel2, b_fax, b_email, weekdays, saturday, sunday, b_ida, a_name, a_address1, a_address2, a_address3;  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
       
        
        PrintWriter out = response.getWriter();
        
        
        HttpSession session =request.getSession();
        user = request.getParameter("user");
        pass = request.getParameter("pass");
        
         request.getSession().setAttribute("b_id", " ");
        request.getSession().setAttribute("b_name", " ");
        request.getSession().setAttribute("b_address1", " ");
        request.getSession().setAttribute("b_address2", " ");
        request.getSession().setAttribute("b_address3", " ");
        request.getSession().setAttribute("b_manager", " ");
        request.getSession().setAttribute("b_tel1", " ");
        request.getSession().setAttribute("b_tel2", " ");
        request.getSession().setAttribute("b_fax", " ");
        request.getSession().setAttribute("b_email", " ");
        request.getSession().setAttribute("weekdays", " ");
        request.getSession().setAttribute("weekdays_f", " ");
        request.getSession().setAttribute("weekdays_t", " ");
        request.getSession().setAttribute("saturday", " ");
        request.getSession().setAttribute("saturday_f", " ");
        request.getSession().setAttribute("saturday_t", " ");
        request.getSession().setAttribute("sunday", " ");
        request.getSession().setAttribute("sunday_f", " ");
        request.getSession().setAttribute("sunday_t", " ");
        
         request.getSession().setAttribute("b_ida", " ");
        request.getSession().setAttribute("a_name", " ");
        request.getSession().setAttribute("a_address1", " ");
        request.getSession().setAttribute("a_address2", " ");
        request.getSession().setAttribute("a_address3", " ");
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/banksystem_db", "root", "");
            PreparedStatement pst = conn.prepareStatement("Select username,password from user where username=? and password=?");
            pst.setString(1, user);
            pst.setString(2, pass);
            ResultSet rs = pst.executeQuery();
            System.out.println("Success login!");
            
            try {
               FileWriter fstream = new FileWriter("./out.txt");
                try (BufferedWriter write = new BufferedWriter(fstream)) {
                    write.write("test");
                }
                System.out.println("log");
            } catch (IOException ex) {
                 System.out.println(ex);
            }
           
            
            if (rs.next()) {
                out.println("Correct login credentials");
                if((user !=null && pass != null)&& (user !=""&& pass !="")) {
                    session.setAttribute("user", user);
                    session.setAttribute("pass", pass);
                }
                
                response.sendRedirect("./index.jsp");
            } 
            else {
                out.println("Incorrect login credentials");
                response.sendRedirect("./logininvalid.jsp");
            }
            
            //setting session parameters
            
        } 
        catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        
        
    }
    
}


