/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
public class Confirm extends HttpServlet {

    String confirmpassword, param1, param2, checkpassword, error;

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        //System.out.println("confirm eke1");
        HttpSession session = request.getSession();
        confirmpassword = request.getParameter("confirmpassword");
        param1 = (String) session.getAttribute("user");
        param2 = (String) session.getAttribute("pass");
        //System.out.println("confirm eke2");
        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/banksystem_db", "root", "");
            PreparedStatement pst4 = conn.prepareStatement("Select * from user where username=? and password=?");
            pst4.setString(1, param1);
            pst4.setString(2, param2);
            //System.out.println(param2);
            ResultSet rs = pst4.executeQuery();
            //System.out.println(rs);

            if (rs.next()) {
                checkpassword = rs.getString("password");

                System.out.printf("%s \n", confirmpassword);
                System.out.printf("%s \n", checkpassword);
                if (confirmpassword == null ? checkpassword != null : !confirmpassword.equals(checkpassword)) {
                    System.out.println("Unauthorized");
                    error = "Password is wrong !";
                    session.setAttribute("error", error);

                  //String jspName = request.getParameter("jspName");
                    request.getRequestDispatcher("./addbranch.jsp").forward(request, response);
                } else {
                    System.out.println("Correct login credentials");
                    response.sendRedirect("./index.jsp");
                }
            } else {
                out.println("Incorrect login credentials");
                response.sendRedirect("./error.jsp");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
