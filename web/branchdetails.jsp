<%-- 
    Document   : brachdetails
    Created on : Aug 23, 2017, 8:51:29 AM
    Author     : lakmal_j
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Branch Details</title>
    </head>
    <body>
       
        <div>
            <form class="form-horizontal" action="" method="post">
                 <%  String  b_id  = (String) session.getAttribute("b_id");
            String  b_name  = (String) session.getAttribute("b_name");
            String  b_address1  = (String) session.getAttribute("b_address1");
            String  b_address2  = (String) session.getAttribute("b_address2");
            String  b_address3  = (String) session.getAttribute("b_address3");
            String  b_manager  = (String) session.getAttribute("b_manager");
            String b_tel1  = (String) session.getAttribute("b_tel1");
            String  b_tel2  = (String) session.getAttribute("b_tel2");
            String  b_fax  = (String) session.getAttribute("b_fax");
            String  b_email  = (String) session.getAttribute("b_email");
            String  weekdays  = (String) session.getAttribute("weekdays");
            String  saturday  = (String) session.getAttribute("saturday");
            String  sunday  = (String) session.getAttribute("sunday");

        %>
                
            <div class=" row col-lg-12 Bold" id="name"><h1><%= b_name %></h1></div>
            
            <table class="table table-user-information">
                <tr >
                    <td><lable>Branch ID:</lable></td>
                <td id="b_id"><%= b_id %></td>    

                </tr>

                
                <tr >
                    <td><lable>Address :</lable></td>
                <td id="b_address1"><%= b_address1 %>, <%= b_address2 %>, <%= b_address3 %></td>    

                </tr>
                
                <tr >
                    <td><lable>Branch manager:</lable></td>
                <td id="b_manager"><%= b_manager %></td> <br><br>
                </tr>
                <tr >
                    <td><lable>Tel1 :</lable></td>
                <td id="b_tel1"><%= b_tel1 %></td>    

                </tr>
                <tr >
                    <td><lable>Tel2 :</lable></td>
                <td id="b_tel2"><%= b_tel2 %></td>    

                </tr>
                <tr >
                    <td><lable>Fax :</lable></td>
                <td id="b_fax"><%= b_fax %></td>    

                </tr>

                <tr >
                    <td><lable>E-mail :</lable></td>
                <td id="b_email"><%= b_email %></td>    

                </tr>
                <tr >
                    <td><lable>Open Hours :</lable></td>
                <td id="openhours">From :<%= weekdays %></td>    

                </tr>
    

            </table>
            </form>
        </div>

       
    </body>
</html>