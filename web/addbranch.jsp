<%-- 
    Document   : addbranch
    Created on : Aug 21, 2017, 8:25:33 AM
    Author     : lakmal_j
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%      
        String username = (String)session.getAttribute("user");
        String password = (String)session.getAttribute("pass");
    if(username == null || password == null){
    response.sendRedirect("./login.jsp");}
    response.setHeader("Cache-Control","no-cache");
 response.setHeader("Cache-Control","no-store");
 response.setHeader("Pragma","no-cache");
 response.setDateHeader ("Expires", 0);
%>

<!DOCTYPE HTML>
<html>
<head>
<title>Bank Administrative System</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Modern Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/font-awesome.css" rel="stylesheet"> 
<link href="css/custom.css" rel="stylesheet">
<link href="css/clockface.css" rel='stylesheet' type='text/css' />

<!-- jQuery -->
<script src="js/jquery.min.js"></script>
<!----webfonts--->
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
<!---//webfonts--->  
</head>
<body>
<div id="wrapper">
     <!-- Navigation -->
        <nav class="top1 navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">Bank Administrative System</a>
            </div>
            <!-- /.navbar-header -->
            <ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
	        		<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-comments-o"></i><span class="badge">4</span></a>
	        		<ul class="dropdown-menu">
						<li class="dropdown-menu-header">
							<strong>Messages</strong>
							<div class="progress thin">
							  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
							    <span class="sr-only">40% Complete (success)</span>
							  </div>
							</div>
						</li>
						<li class="avatar">
							<a href="#">
								<img src="images/1.png" alt=""/>
								<div>New message</div>
								<small>1 minute ago</small>
								<span class="label label-info">NEW</span>
							</a>
						</li>
						<li class="avatar">
							<a href="#">
								<img src="images/2.png" alt=""/>
								<div>New message</div>
								<small>1 minute ago</small>
								<span class="label label-info">NEW</span>
							</a>
						</li>
						<li class="avatar">
							<a href="#">
								<img src="images/3.png" alt=""/>
								<div>New message</div>
								<small>1 minute ago</small>
							</a>
						</li>
						<li class="avatar">
							<a href="#">
								<img src="images/4.png" alt=""/>
								<div>New message</div>
								<small>1 minute ago</small>
							</a>
						</li>
						<li class="avatar">
							<a href="#">
								<img src="images/5.png" alt=""/>
								<div>New message</div>
								<small>1 minute ago</small>
							</a>
						</li>
						<li class="avatar">
							<a href="#">
								<img src="images/pic1.png" alt=""/>
								<div>New message</div>
								<small>1 minute ago</small>
							</a>
						</li>
						<li class="dropdown-menu-footer text-center">
							<a href="#">View all messages</a>
						</li>	
	        		</ul>
	      		</li>
			    <li class="dropdown">
	        		<a href="#" class="dropdown-toggle avatar" data-toggle="dropdown"><img src="images/kasun.jpg" alt=""/><span class="badge">9</span></a>
	        		<ul class="dropdown-menu">
						<li class="dropdown-menu-header text-center">
							<strong>Account</strong>
						</li>
						<li class="m_2"><a href="#"><i class="fa fa-bell-o"></i> Updates <span class="label label-info">42</span></a></li>
						<li class="m_2"><a href="#"><i class="fa fa-envelope-o"></i> Messages <span class="label label-success">42</span></a></li>
						<li class="m_2"><a href="#"><i class="fa fa-tasks"></i> Tasks <span class="label label-danger">42</span></a></li>
						<li><a href="#"><i class="fa fa-comments"></i> Comments <span class="label label-warning">42</span></a></li>
						<li class="dropdown-menu-header text-center">
							<strong>Settings</strong>
						</li>
						<li class="m_2"><a href="#"><i class="fa fa-user"></i> Profile</a></li>
						<li class="m_2"><a href="#"><i class="fa fa-wrench"></i> Settings</a></li>
						<li class="m_2"><a href="#"><i class="fa fa-usd"></i> Payments <span class="label label-default">42</span></a></li>
						<li class="m_2"><a href="#"><i class="fa fa-file"></i> Projects <span class="label label-primary">42</span></a></li>
						<li class="divider"></li>
						<li class="m_2"><a href="#"><i class="fa fa-shield"></i> Lock Profile</a></li>
						<li class="m_2">
                                                    <form action="DistroySession" method="get">
                                                        <span class="m_2" ><i class="fa fa-lock"><input type="submit" value="Logout"></i></span>
                                                    </form>
                                                </li>	
	        		</ul>
	      		</li>
			</ul>
			<form class="navbar-form navbar-right">
                            <%  String  user  = (String) session.getAttribute("user");%>
                            <label><b>Hi,  <%= user %> <i class="fa fa-user nav_icon"></i> </b></label>
              <input type="text" class="form-control" value="Search..." onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search...';}">
            </form>
            
            
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="index.jsp"><i class="fa fa-dashboard fa-fw nav_icon"></i>Dashboard</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-user nav_icon"></i>User Management<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">User</a>
                                </li>
                                <li>
                                    <a href="#">Role</a>
                                </li>
                                <li>
                                    <a href="#">Task</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-usd nav_icon"></i>Fee Management<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">Services</a>
                                </li>
                                <li>
                                    <a href="#">Bank Details</a>
                                </li>
                                <li>
                                    <a href="#">Other Banks</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
                        
                         <li>
                            <a href="#"><i class="fa fa-indent nav_icon"></i>Bank Management<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="forms.html">Basic Forms</a>
                                </li>
                                <li>
                                    <a href="validation.html">Validation</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
                        <li>
                            <a href="#"><i class="fa fa-sitemap fa-fw nav_icon"></i>Branch Management<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="addbranch.jsp">Add New Branch/ ATM</a>
                                </li>
                                <li>
                                    <a href="viewbranch.jsp">Branch/ ATM Details</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-shield nav_icon"></i>Password Policy<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            
        </nav>
        <div id="page-wrapper">
        <div class="graphs">
	   <div class="md">
		<h3>Add New Branch</h3>
                <div class="form-group">
                    <label for="focusedinput" class="col-sm-2 control-label">Select the Type</label>
                    <select class="div-toggle" data-target=".my-info-1">
                    <option value="Branch" data-show=".branch">Branch</option>
                    <option value="ATM" data-show=".atm">ATM</option>  
                    </select>
                </div>

                <div class="my-info-1">
                  <div class="branch hide">

                      <div class="tab-pane active" id="horizontal-form">
                          <form class="form-horizontal" action="AddBranch" method="post">
                              
                              
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-2 control-label">Branch ID </label>
                                    <div class="col-sm-8">
                                          <input type="text" name="b_id" class="form-control1" id="focusedinput" placeholder="Branch ID" onkeypress="return IsNumeric1(event);" ondrop="return false;" onpaste="return false;" maxlength="10" required="required">
                                          <span id="error1" style="color: Green; display: none">* Input digits (0 - 9)</span>
                                    </div> 
                                  </div>
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-2 control-label">Branch Name </label>
                                    <div class="col-sm-8">
                                          <input type="text" name="b_name" class="form-control1" id="b_name" placeholder="Branch Name" maxlength="100" required="required">
                                          
                                    </div> 
                                  </div>
                              
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-2 control-label">Branch Address</label>
                                  </div>
                              
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-3 control-label">No</label>
                                    <div class="col-sm-3">
                                          <input type="text" name="b_address1" class="form-control1" id="focusedinput" placeholder="No" maxlength="50">
                                    </div>
                                  </div>
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-3 control-label">Street</label>
                                    <div class="col-sm-3">
                                          <input type="text" name="b_address2" class="form-control1" id="focusedinput" placeholder="Street" maxlength="100">
                                    </div>
                                  </div>
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-3 control-label">City</label>
                                    <div class="col-sm-3">
                                          <input type="text" name="b_address3" class="form-control1" id="focusedinput" placeholder="City" required="required" maxlength="100">
                                    </div>
                                  </div>
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-2 control-label">Branch Manager</label>
                                    <div class="col-sm-8">
                                          <input type="text" name="b_manager" class="form-control1" id="focusedinput" placeholder="Branch Manager" maxlength="100" required="required">
                                    </div>
                                    
                                  </div>
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-2 control-label">Contact Details</label>
                                  </div>
                              
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-3 control-label">Email Address</label>
                                    <div class="col-sm-3">
                                          <input type="text" onchange="validate()" name="b_email" class="form-control1" id="b_email" placeholder="Email Address" required="required" maxlength="100">
                                          <span id="resultmail"></span>
                                    </div>
                                  </div>
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-3 control-label">Tel1 : +94</label>
                                    <div class="col-sm-3">
                                        
                                          <input type="text" name="b_tel1" class="form-control1" id="focusedinput" placeholder="Telephone1" onkeypress="return IsNumeric2(event);" ondrop="return false;" onpaste="return false;" maxlength="10">
                                          <span id="error2" style="color: Green; display: none">* Input digits (0 - 9)</span>
                                    </div>
                                  </div>
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-3 control-label">Tel2 : +94</label>
                                    <div class="col-sm-3">
                                          <input type="text" name="b_tel2" class="form-control1" id="focusedinput" placeholder="Telephone2" onkeypress="return IsNumeric3(event);" ondrop="return false;" onpaste="return false;" maxlength="10">
                                          <span id="error3" style="color: Green; display: none">* Input digits (0 - 9)</span>
                                    </div>
                                  </div>
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-3 control-label">FAX :+94</label>
                                    <div class="col-sm-3">
                                          <input type="text" name="b_fax" class="form-control1" id="focusedinput" placeholder="FAX" onkeypress="return IsNumeric4(event);" ondrop="return false;" onpaste="return false;" maxlength="10">
                                          <span id="error4" style="color: Green; display: none">* Input digits (0 - 9)</span>
                                    </div>
                                  </div>
                                  
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-2 control-label">Open Hours</label>
                                  </div>
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-3 control-label">Week Days</label>
                                    
                                    <div class="col-sm-3 input-append">
                                        <label for="focusedinput" class="col-sm-3 control-label">From</label>
                                        <input type="text" name="weekdays_f" id="t11" value="" class="input-small" readonly="">
                                        <button class="btn" type="button" id="toggle-btn1">
                                            <i class="glyphicon glyphicon-time"></i>
                                        </button>
                                    </div>
                                    <div class="col-sm-3 input-append">
                                        <label for="focusedinput" class="col-sm-3 control-label">To</label>
                                        <input type="text" name="weekdays_t" id="t12" value="" class="input-small" readonly="">
                                        <button class="btn" type="button" id="toggle-btn2">
                                            <i class="glyphicon glyphicon-time"></i>
                                        </button>
                                    </div>
                                    <script>
                                              $(function(){
                                                $('#t11').clockface({
                                                    format: 'HH:mm',
                                                    trigger: 'manual'
                                                });   

                                                $('#toggle-btn1').click(function(e){   
                                                    e.stopPropagation();
                                                    $('#t11').clockface('toggle');
                                                });
                                            });
                                    </script>
                                    <script>
                                              $(function(){
                                                $('#t12').clockface({
                                                    format: 'HH:mm',
                                                    trigger: 'manual'
                                                });   

                                                $('#toggle-btn2').click(function(e){   
                                                    e.stopPropagation();
                                                    $('#t12').clockface('toggle');
                                                });
                                            });
                                    </script>
                                  </div>
                                    
                                                
                              
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-3 control-label">Saturday</label>
                                    
                                                <div class="col-sm-3 input-append">
                                                    <label for="focusedinput" class="col-sm-3 control-label">From</label>
                                                    <input type="text" name="saturday_f" id="t21" value="" class="input-small" readonly="">
                                                    <button class="btn" type="button" id="toggle-btn3">
                                                        <i class="glyphicon glyphicon-time"></i>
                                                    </button>
                                                </div>
                                                <div class="col-sm-3 input-append">
                                                    <label for="focusedinput" class="col-sm-3 control-label">To</label>
                                                    <input type="text" name="saturday_t" id="t22" value="" class="input-small" readonly="">
                                                    <button class="btn" type="button" id="toggle-btn4">
                                                        <i class="glyphicon glyphicon-time"></i>
                                                    </button>
                                                </div>
                                                <script>
                                                            $(function(){
                                                              $('#t21').clockface({
                                                                  format: 'HH:mm',
                                                                  trigger: 'manual'
                                                              });   

                                                              $('#toggle-btn3').click(function(e){   
                                                                  e.stopPropagation();
                                                                  $('#t21').clockface('toggle');
                                                              });
                                                          });
                                                  </script>
                                                  <script>
                                                            $(function(){
                                                              $('#t22').clockface({
                                                                  format: 'HH:mm',
                                                                  trigger: 'manual'
                                                              });   

                                                              $('#toggle-btn4').click(function(e){   
                                                                  e.stopPropagation();
                                                                  $('#t22').clockface('toggle');
                                                              });
                                                          });
                                                  </script>
                                  </div>
                              
                                                
                              
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-3 control-label">Sunday</label>
                                    
                                                <div class="col-sm-3 input-append">
                                                    <label for="focusedinput" class="col-sm-3 control-label">From</label>
                                                    <input type="text" name="sunday_f" id="t31" value="" class="input-small" readonly="">
                                                    <button class="btn" type="button" id="toggle-btn5">
                                                        <i class="glyphicon glyphicon-time"></i>
                                                    </button>
                                                </div>
                                                <div class="col-sm-3 input-append">
                                                    <label for="focusedinput" class="col-sm-3 control-label">To</label>
                                                    <input type="text" name="sunday_t" id="t32" value="" class="input-small" readonly="">
                                                    <button class="btn" type="button" id="toggle-btn6">
                                                        <i class="glyphicon glyphicon-time"></i>
                                                    </button>
                                                </div>
                                                <script>
                                                        $(function(){
                                                          $('#t31').clockface({
                                                              format: 'HH:mm',
                                                              trigger: 'manual'
                                                          });   

                                                          $('#toggle-btn5').click(function(e){   
                                                              e.stopPropagation();
                                                              $('#t31').clockface('toggle');
                                                          });
                                                      });
                                              </script>
                                              <script>
                                                        $(function(){
                                                          $('#t32').clockface({
                                                              format: 'HH:mm',
                                                              trigger: 'manual'
                                                          });   

                                                          $('#toggle-btn6').click(function(e){   
                                                              e.stopPropagation();
                                                              $('#t32').clockface('toggle');
                                                          });
                                                      });
                                              </script>
                                  </div>
                                  <div class="form-group">
                                    <div class="submitbtn">
                                    <button type="submit" class="btn btn-primary">Add</button>
                                    
                                    <button type="reset" class="btn btn-default">Reset</button>
                                    </div>
                                  </div>
                          </form>
                          
                      <div class="modal fade" id="Confirm_branch" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
			<div class="modal-dialog">
                            <div class="modal-content">
				<div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                    <h2 class="modal-title">Edit Branch/ATM Details</h2>
				</div>
				<div class="modal-body">
                                                            
                                
                                </div> 
                            </div>
                        </div>
                        </div>
                          
                          
                      </div>

                  </div>
                    

                  <div class="atm hide">
                      <div class="tab-pane active" id="horizontal-form">
                          <form class="form-horizontal" action="AddATM" method="post">
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-2 control-label">ATM ID </label>
                                    <div class="col-sm-8">
                                          <input type="text" name="b_id" class="form-control1" id="focusedinput" placeholder="ATM ID" onkeypress="return IsNumeric0(event);" ondrop="return false;" onpaste="return false;" maxlength="10" required="required">
                                          <span id="error0" style="color: green; display: none">* Input digits (0 - 9)</span>
                                    </div> 
                                  </div>
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-2 control-label">ATM Name </label>
                                    <div class="col-sm-8">
                                          <input type="text" name="a_name" class="form-control1" id="focusedinput" placeholder="Branch Name" maxlength="100" required="required">
                                    </div> 
                                  </div>
                              
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-2 control-label">ATM Address</label>
                                  </div>
                              
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-3 control-label">No</label>
                                    <div class="col-sm-3">
                                          <input type="text" name="a_address1" class="form-control1" id="focusedinput" placeholder="No" maxlength="10">
                                    </div>
                                  </div>
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-3 control-label">Street</label>
                                    <div class="col-sm-3">
                                          <input type="text" name="a_address2" class="form-control1" id="focusedinput" placeholder="Street" maxlength="100">
                                    </div>
                                  </div>
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-3 control-label">City</label>
                                    <div class="col-sm-3">
                                          <input type="text" name="a_address3" class="form-control1" id="focusedinput" placeholder="City" maxlength="50" required="required">
                                    </div>
                                  </div>
      
                                  <div class="form-group">
                                    <div class="submitbtn">
                                    
                                    <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#Confirm_atm">Add</button>
                                    <button type="reset" class="btn btn-default">Reset</button>
                                    
                                    </div>
                                  </div>
                              
                                 
                          </form>
                          
                      </div>
                  </div>
                    
                </div>
                 
                 

                 
                 
            </div>	
        <div class="copy_layout">
         <p>Copyright © 2015 Modern. All Rights Reserved | Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
        </div>					
       </div>
      </div>
      <!-- /#page-wrapper -->
   </div>
    <!-- /#wrapper -->
    <!-- Nav CSS -->
    
    <script type="text/javascript">
        var specialKeys = new Array();
        specialKeys.push(8); //Backspace
        function IsNumeric0(e) {
            var keyCode = e.which ? e.which : e.keyCode
            var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
            document.getElementById("error0").style.display = ret ? "none" : "inline";
            
            return ret;
        }
        function IsNumeric1(e) {
            var keyCode = e.which ? e.which : e.keyCode
            var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
            document.getElementById("error1").style.display = ret ? "none" : "inline";
            
            return ret;
        }
        function IsNumeric2(e) {
            var keyCode = e.which ? e.which : e.keyCode
            var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
            document.getElementById("error2").style.display = ret ? "none" : "inline";
            
            return ret;
        }
        function IsNumeric3(e) {
            var keyCode = e.which ? e.which : e.keyCode
            var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
            document.getElementById("error3").style.display = ret ? "none" : "inline";
            
            return ret;
        }
        function IsNumeric4(e) {
            var keyCode = e.which ? e.which : e.keyCode
            var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
            document.getElementById("error4").style.display = ret ? "none" : "inline";
            
            return ret;
        }
        

    </script>
    <script type="text/javascript">
       var min = 15;
        document.querySelector('#b_nam').onkeyup = function(e){
         document.querySelector('#counter').innerHTML = 
                       this.value.length < min 
                       ? (min - this.value.length)+' to go...'
                       : '';
        }
    </script>
    <script type="text/javascript">
        function validateEmail(email) {
            var re = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            return re.test(email);
          }

          function validate() {
            $("#resultmail").text("");
            var email = $("#b_email").val();
            if (validateEmail(email)) {
              $("#resultmail").text(email + " is valid.");
              $("#resultmail").css("color", "green");
            } else {
              $("#resultmail").text(email + " is not valid !");
              $("#resultmail").css("color", "red");
            }
            return false;
          }

          $("#validate").bind("click", validate);
    </script>
    
<link href="css/custom.css" rel="stylesheet">
<!-- Metis Menu Plugin JavaScript -->
<script src="js/metisMenu.min.js"></script>
<script src="js/section.js"></script>
<script src="js/clockface.js"></script>
<script src="js/custom.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>

