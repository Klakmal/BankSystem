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
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lakmal_j
 */
public class DeleteATM extends HttpServlet {
    String confirmpassword, param1, param2, checkpassword ; 
 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        confirmpassword = request.getParameter("confirmpassword");
        param1= (String)request.getSession().getAttribute("user");
        param2= (String)request.getSession().getAttribute("pass");
        String  b_id1  = (String) request.getSession().getAttribute("b_ida");
        
        try{
             Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/banksystem_db", "root", "");
            
         if(!" ".equals(b_id1)){   
//---------------------------------------------------------------------------------------------------------------           
            PreparedStatement pst4 = conn.prepareStatement("Select * from user where username=? and password=?");
            pst4.setString(1, param1);
            pst4.setString(2, param2);
            //System.out.println(param2);
            ResultSet rs = pst4.executeQuery();
            //System.out.println(rs);
 
            if (rs.next()) {
                checkpassword = rs.getString("password");
                
                System.out.printf("%s \n",confirmpassword);
                System.out.printf("%s \n",checkpassword);
                if(confirmpassword == null ? checkpassword != null : !confirmpassword.equals(checkpassword)) {
                    System.out.println("Unauthorized");
                    //error ="Password is wrong !";
                   out.println("<html><script type=\"text/javascript\">alert('"+ param1 +" your password is not right !');window.location='./viewbranch.jsp'</script></html>");
                    //request.getRequestDispatcher("./addbranch.jsp").forward(request, response);
                }
                else{
                    System.out.println(b_id1);
                    
                    //------------- select deleting branch name (for log) ------------------------------
                                String q1 = "SELECT a_name FROM atm WHERE b_id ='"+b_id1+"'";
                                Statement st1;
                                st1 = conn.createStatement();
                                ResultSet rs8 = st1.executeQuery(q1);
                                rs8.next();
                                String a_name1 = rs8.getString("a_name");
                    //-------------------------------------------------------------------------  
                    
 //---------------------------------------------------------------------------------------------------------------           
            
                        PreparedStatement pst5 =conn.prepareStatement(" DELETE FROM atm WHERE b_id = ? ");
                        pst5.setString(1, b_id1);

                        int b1s= pst5.executeUpdate();
                        if(b1s >0){
                            out.println("Correct delete ATM");
                            
                            //------------------------------ log -------------  
                                String action = "Delete_ATM";
                                String user_name  = (String) request.getSession().getAttribute("user");
                                String timeStamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new java.util.Date());
                                
                                
                                
                                     PreparedStatement pst8 =conn.prepareStatement(" insert into action_log (action, branch_id, branch_name, username, timestamp)"
                        + " values (?, ?, ?, ?, ?)");
                                    pst8.setString(1, action);
                                    pst8.setString(2, b_id1);
                                    pst8.setString(3, a_name1);
                                    pst8.setString(4, user_name);
                                    pst8.setString(5, timeStamp);

                                    int b1s3= pst8.executeUpdate();
                            //------------------------------------------------- 
                            
                            out.println("<html><script type=\"text/javascript\">alert(' You successfully delete ATM ');window.location='./viewbranch.jsp'</script></html>");
                                //response.sendRedirect("./viewbranch.jsp");
                        }else{
                            out.println("<html><script type=\"text/javascript\">alert('You requested Branch is already deleted or not in system !');window.location='./viewbranch.jsp'</script></html>");}
   
                        }     
                        
            }
//-------------------------------------------------------------------------------------------------------------------- 
         }else{
            out.println("awaaaa");
            out.println("<html><script type=\"text/javascript\">alert('Please select an ATM !');window.location='./viewbranch.jsp'</script></html>");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(DeleteBranch.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DeleteBranch.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(DeleteBranch.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DeleteBranch.class.getName()).log(Level.SEVERE, null, ex);
        }
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
