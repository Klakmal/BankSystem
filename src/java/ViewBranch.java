/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lakmal_j
 */
public class ViewBranch extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter out =response.getWriter();
        String search = request.getParameter("search");
        
        
        
       try
    {
      // create our mysql database connection
      String myDriver = "org.gjt.mm.mysql.Driver";
      String myUrl = "jdbc:mysql://localhost/banksystem_db";
      Class.forName(myDriver);
      Connection conn = DriverManager.getConnection(myUrl, "root", "");
        
      // our SQL SELECT query. 
      // if you only need a few columns, specify them by name instead of using "*"
      String query = "SELECT * FROM branch WHERE b_name ='"+search+"'";
      

      Statement st;
            st = conn.createStatement();
      
      // execute the query, and get a java resultset
      ResultSet rs = st.executeQuery(query);
      
      
     
     if(rs.next()){
     //rs.next();
          
        String b_id = rs.getString("b_id");
        String b_name = rs.getString("b_name");
        String b_address1 = rs.getString("b_address1");
        String b_address2 = rs.getString("b_address2");
        String b_address3 = rs.getString("b_address3");
        String b_manager = rs.getString("b_manager");
        String b_tel1 = rs.getString("b_tel1");
        String b_tel2 = rs.getString("b_tel2");
        String b_fax = rs.getString("b_fax");
        String b_email = rs.getString("b_email");
        
        // print the results
        //System.out.format("%s, %s, %s, %s, %s, %s, %s, %s, %s, %s\n", b_id, b_name, b_address1, b_address2, b_address3, b_manager, b_tel1, b_tel2, b_fax, b_email);
      
      request.getSession().setAttribute("b_id", b_id);
      request.getSession().setAttribute("b_name", b_name);
      request.getSession().setAttribute("b_address1", b_address1+"");
      request.getSession().setAttribute("b_address2", " "+b_address2+"");
      request.getSession().setAttribute("b_address3", " "+b_address3);
      request.getSession().setAttribute("b_manager", b_manager);
      request.getSession().setAttribute("b_tel1", b_tel1);
      request.getSession().setAttribute("b_tel2", b_tel2);
      request.getSession().setAttribute("b_fax", b_fax);
      request.getSession().setAttribute("b_email", b_email);
      
      //request.getRequestDispatcher("./viewbranch.jsp").forward(request, response);
       
      
      
      
      
      String query2 = "SELECT * FROM openhours WHERE b_id ='"+b_id+"'";
      Statement st2;
      st2 = conn.createStatement();
      
      // execute the query, and get a java resultset
      ResultSet rs2 = st2.executeQuery(query2);
      
      rs2.next();
      String weekdays = rs2.getString("weekdays");
      String saturday = rs2.getString("saturday");
      String sunday = rs2.getString("sunday");
      
      String[] resultw = weekdays.split("\\-");
      String weekdays_f = resultw[0];
      String weekdays_t = resultw[1];
      request.getSession().setAttribute("weekdays", weekdays);
      request.getSession().setAttribute("weekdays_f", weekdays_f);
      request.getSession().setAttribute("weekdays_t", weekdays_t);
       
      String[] resultsa = saturday.split("\\-");
      String saturday_f = resultsa[0];
      String saturday_t = resultsa[1]; 
      request.getSession().setAttribute("saturday", saturday);
      request.getSession().setAttribute("saturday_f", saturday_f);
      request.getSession().setAttribute("saturday_t", saturday_t);
      
      String[] resultsu = sunday.split("\\-");
      String sunday_f = resultsu[0];
      String sunday_t = resultsu[1]; 
      request.getSession().setAttribute("sunday", sunday);
      request.getSession().setAttribute("sunday_f", sunday_f);
      request.getSession().setAttribute("sunday_t", sunday_t);
      
      
      request.getRequestDispatcher("./viewbranch.jsp").forward(request, response);
      st.close();
      st2.close();
      //request.getSession().removeAttribute("b_email");
     }
     else{
         out.println("Incorrect login credentials");
                //response.sendRedirect("./error.jsp");
         out.println("<html><script type=\"text/javascript\">alert('You requested Branch is already deleted or not in system !');window.location='./viewbranch.jsp'</script></html>");
     }
    }
    catch (Exception e)
    {
      System.err.println("Got an exception! ");
      System.err.println(e.getMessage());
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
