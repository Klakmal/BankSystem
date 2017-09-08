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
public class ViewATM extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter out =response.getWriter();
        String search_atm = request.getParameter("search_atm");
        
        
        
       try
    {
      // create our mysql database connection
      String myDriver = "org.gjt.mm.mysql.Driver";
      String myUrl = "jdbc:mysql://localhost/banksystem_db";
      Class.forName(myDriver);
      Connection conn = DriverManager.getConnection(myUrl, "root", "");
        
      // our SQL SELECT query. 
      // if you only need a few columns, specify them by name instead of using "*"
      String query = "SELECT * FROM atm WHERE a_name ='"+search_atm+"'";
      

      Statement sta;
            sta = conn.createStatement();
      
      // execute the query, and get a java resultset
      ResultSet rs = sta.executeQuery(query);
      
      
     
     if(rs.next()){
     //rs.next();
          
        String b_ida = rs.getString("b_id");
        String a_name = rs.getString("a_name");
        String a_address1 = rs.getString("a_address1");
        String a_address2 = rs.getString("a_address2");
        String a_address3 = rs.getString("a_address3");
        
        
        // print the results
        //System.out.format("%s, %s, %s, %s, %s, %s, %s, %s, %s, %s\n", b_id, b_name, b_address1, b_address2, b_address3, b_manager, b_tel1, b_tel2, b_fax, b_email);
      
      request.getSession().setAttribute("b_ida", b_ida);
      request.getSession().setAttribute("a_name", a_name);
      request.getSession().setAttribute("a_address1", a_address1+" ");
      request.getSession().setAttribute("a_address2", " "+a_address2+" ");
      request.getSession().setAttribute("a_address3", " "+a_address3);
   
      
      //request.getRequestDispatcher("./viewbranch.jsp").forward(request, response);
       

      request.getRequestDispatcher("./viewbranch.jsp").forward(request, response);
      sta.close();
      
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
