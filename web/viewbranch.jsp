 <%-- 
    Document   : addbranch
    Created on : Aug 21, 2017, 8:25:33 AM
    Author     : lakmal_j
--%>

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
              <input type="text" class="form-control" value="Search..." onfocus="this.value = '';" list="dn2">
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
                                    <a href="graphs.html">Graphs</a>
                                </li>
                                <li>
                                    <a href="typography.html">Typography</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
                        
                         <li>
                            <a href="#"><i class="fa fa-indent nav_icon"></i>Bank Management<span class="fa arrow"></span></a>
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
               
		 <h3>Branch/ ATM Details</h3>
                 <div class="form-group">
                    <label for="focusedinput" class="col-sm-2 control-label">Select the Type</label>
                    <select class="div-toggle" data-target=".my-info-1">
                    <option value="Branch" data-show=".branch">Branch</option>
                    <option value="ATM" data-show=".atm">ATM</option>  
                    </select>
                </div>
                <div class="my-info-1">
                    
                <div class="branch hide">   
		<form action="ViewBranch" method="post">
                    <div class="input-group">
                        
                        <input type="text" name="search" class="col-sm-6 form-control1 input-search" placeholder="Branch/ ATM Name..." id="branch" onkeyup="showData(this.value);" >
                        <div style="position: absolute; z-index: 2; list-style: none; background-color: #F0F8FF; width: 92%;" id="autocomplete" ></div>
                        <span class="input-group-btn">
                            <button class="btn btn-success" type="submit" id="submit1"><i class="fa fa-search"></i></button>
                        </span>
                    </div><!-- Input Group -->
                </form>
                 
                 <div class="map">
                      
                        <iframe src="map.jsp" name="targetframe" allowTransparency="true" scrolling="no" frameborder="0" width="900" height="200">
                        </iframe>
                 </div>
                 
                <div class="bs-example2 bs-example-padded-bottom">
                    <div class="tab-pane active" id="horizontal-form">
                        <form class="form-horizontal" action="AddBranch" method="post">
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
                                String  weekdays_f  = (String) session.getAttribute("weekdays_f");
                                String  weekdays_t  = (String) session.getAttribute("weekdays_t");
                                String  saturday  = (String) session.getAttribute("saturday");
                                String  saturday_f  = (String) session.getAttribute("saturday_f");
                                String  saturday_t  = (String) session.getAttribute("saturday_t");
                                String  sunday  = (String) session.getAttribute("sunday");
                                String  sunday_f  = (String) session.getAttribute("sunday_f");
                                String  sunday_t  = (String) session.getAttribute("sunday_t");

                            %>
                            
                            <div class=" row col-lg-12 Bold" id="name"><h3><%= b_name %></h3></div>
                            <div class="form-group">
                                <label for="focusedinput" class="col-sm-2 control-label"><b>Branch ID :</b></label>
                                <label for="focusedinput" class="col-sm-2 control-label" value=" "><%= b_id %> </label>    
                            </div>
                            <div class="form-group">
                                <label for="focusedinput" class="col-sm-2 control-label"><b>Address :</b></label>
                                <label for="focusedinput" class="control-label"> <%= b_address1 %> <%= b_address2 %>, <%= b_address3 %></label>    
                            </div> 
                            <div class="form-group">
                                <label for="focusedinput" class="col-sm-2 control-label"><b>Branch Manager :</b></label>
                                <label for="focusedinput" class="control-label"><%= b_manager %></label>    
                            </div> 
                             
                            <div class="form-group">
                                <label for="focusedinput" class="col-sm-2 control-label"><b>Contacts :</b></label>
                                <label for="focusedinput" class="col-sm-2 control-label"><b>Tel: </b>+94 <%= b_tel1 %></label>
                                <label for="focusedinput" class="col-sm-2 control-label" value=" "><b>Tel: </b>+94 <%= b_tel2 %></label> 
                                <label for="focusedinput" class="col-sm-2 control-label" value=" "><b>Fax: </b>+94 <%= b_fax %></label>
                            </div> 
                             
                            <div class="form-group">
                                <label for="focusedinput" class="col-sm-2 control-label"><b>E-mail :</b></label>
                                <label for="focusedinput" class="col-sm-2 control-label"><a href="<%= b_email %>"><%= b_email %></a></label>    
                            </div> 
                            <div class="form-group">
                                <label for="focusedinput" class="col-sm-2 control-label"><b>Open Hours :</b></label>
                                <label for="focusedinput" class="col-sm-2 control-label">Weekdays : <%= weekdays %></label>
                                
                            </div>
                            <div class="form-group">
                                <label for="focusedinput" class="col-sm-2 control-label"><b>             </b></label>
                                <label for="focusedinput" class="col-sm-2 control-label" value=" ">Saturday : <%= saturday %></label>
                                
                            </div>
                            <div class="form-group">
                                <label for="focusedinput" class="col-sm-2 control-label"><b>             </b></label>
                                <label for="focusedinput" class="col-sm-2 control-label" value=" ">Sunday : <%= sunday %></label>
                                
                            </div> 
                             
                            
                        </form>
                        
                        
                    </div>
                    <div class="col-md-4">
                        <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                         Edit
                        </button>
                        <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#myModal2" >
                         Delete
                        </button>
                    </div>
                                
                                
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
			<div class="modal-dialog">
                            <div class="modal-content">
				<div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                    <h2 class="modal-title">Edit Branch/ATM Details</h2>
				</div>
				<div class="modal-body">
                                                            
                                <form class="form-horizontal" action="UpdateBranch" method="post">
                                    
                                    <div class="form-group">
                                      <label for="focusedinput" class="col-sm-2 control-label">Branch ID </label>
                                    <div class="col-sm-8">
                                        <label for="focusedinput" class="col-sm-2 control-label"><%= b_id %></label>
                                          <input type="hidden" name="b_id" class="form-control1" id="b_id" name="b_id" placeholder="Branch ID" value="<%= b_id %>" required="required">
                                    </div> 
                                    </div>
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-2 control-label">Branch Name </label>
                                    <div class="col-sm-8">
                                          <input type="text" class="form-control1" id="b_name" name="b_name" placeholder="Branch Name " value="<%= b_name %>" required="required">
                                    </div> 
                                  </div>
                              
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-2 control-label">Branch Address</label>
                                  </div>
                              
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-3 control-label">No</label>
                                    <div class="col-sm-3">
                                          <input type="text" class="form-control1" id="b_address1" name="b_address1" placeholder="No" value="<%= b_address1 %>">
                                    </div>
                                  </div>
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-3 control-label">Street</label>
                                    <div class="col-sm-3">
                                          <input type="text" class="form-control1" id="b_address2" name="b_address2"placeholder="Street" value="<%= b_address2 %>" >
                                    </div>
                                  </div>
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-3 control-label">City</label>
                                    <div class="col-sm-3">
                                          <input type="text" class="form-control1" id="b_address3" name="b_address3" placeholder="City" value="<%= b_address3 %>" required="required">
                                    </div>
                                  </div>
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-2 control-label">Branch Manager</label>
                                    <div class="col-sm-8">
                                          <input type="text" class="form-control1" id="b_manager" name="b_manager"  placeholder="Branch Manager" value="<%= b_manager %>" required="required">
                                    </div>
                                    
                                  </div>
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-2 control-label">Contact Details</label>
                                  </div>
                              
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-3 control-label">Email Address</label>
                                    <div class="col-sm-3">
                                          <input type="text" onchange="validate()" class="form-control1" id="b_email" name="b_email"  placeholder="Email Address"  value="<%= b_email %>" required="required">
                                          <span id="resultmail"></span>
                                    </div>
                                  </div>
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-3 control-label">TEl1 :</label>
                                    <div class="col-sm-3">
                                          <input type="text" class="form-control1" id="b_tel1" name="b_tel1" value="<%= b_tel1 %>" placeholder="TEL1">
                                    </div>
                                  </div>
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-3 control-label">TEl2 :</label>
                                    <div class="col-sm-3">
                                          <input type="text" class="form-control1" id="b_tel2" name="b_tel2" value="<%= b_tel2 %>" placeholder="TEL2">
                                    </div>
                                  </div>
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-3 control-label">FAX :</label>
                                    <div class="col-sm-3">
                                          <input type="text" class="form-control1" id="b_fax" name="b_fax" value="<%= b_fax %>" placeholder="FAX">
                                    </div>
                                  </div>
                                  
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-2 control-label">Open Hours</label>
                                  </div>
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-3 control-label">Week Days</label>
                                    
                                    <div class="col-sm-3 input-append">
                                        <label for="focusedinput" class="col-sm-3 control-label">From</label>
                                        <input type="text" id="t11" name="weekdays_f" value="<%= weekdays_f %>" class="input-small" readonly="">
                                        <button class="btn" type="button" id="toggle-btn1">
                                            <i class="glyphicon glyphicon-time"></i>
                                        </button>
                                    </div>
                                    <div class="col-sm-3 input-append">
                                        <label for="focusedinput" class="col-sm-3 control-label">To</label>
                                        <input type="text" id="t12" name="weekdays_t" value="<%= weekdays_t %>" class="input-small" readonly="">
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
                                                    <input type="text" id="t21" name="saturday_f" value="<%= saturday_f %>" class="input-small" readonly="">
                                                    <button class="btn" type="button" id="toggle-btn3">
                                                        <i class="glyphicon glyphicon-time"></i>
                                                    </button>
                                                </div>
                                                <div class="col-sm-3 input-append">
                                                    <label for="focusedinput" class="col-sm-3 control-label">To</label>
                                                    <input type="text" id="t22" name="saturday_t" value="<%= saturday_t %>" class="input-small" readonly="">
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
                                                    <input type="text" id="t31" name="sunday_f" value="<%= sunday_f %>" class="input-small" readonly="">
                                                    <button class="btn" type="button" id="toggle-btn5">
                                                        <i class="glyphicon glyphicon-time"></i>
                                                    </button>
                                                </div>
                                                <div class="col-sm-3 input-append">
                                                    <label for="focusedinput" class="col-sm-3 control-label">To</label>
                                                    <input type="text" id="t32" name="sunday_t" value="<%= sunday_t %>" class="input-small" readonly="">
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
                                    <div class="col-sm-3 input-append">
                                        <input type="password" name="confirmpassword2" placeholder="Enter your password" required="required">
                                    </div>
                                  <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Update</button>
                                  </div>
                                </form>                    
                                                            
						
				</div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
			</div>
                    </div>
                    
                                    
                                    
                                    
                    <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModal2Label" aria-hidden="true" style="display: none;">
                        <div class="modal-dialog">
                            <div class="modal-content">
				<div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                    <h2 class="modal-title">Edit Branch/ATM Details</h2>
				</div>
				<div class="modal-body">
                                                            
                                    <form class="form-horizontal" action="DeleteBranch" method="post">
                                        <h5>Do You really want to delete branch  "<%= b_name %>"  from the system ?</h5>
                                        <input type="password" name="confirmpassword" placeholder="Enter your password" required="required">
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                            <button type="submit" class="btn btn-primary">Delete</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                                    
                                    
                                    
                                    
                                    
                </div>
                </div>
                                        
                <div class="atm hide">
                 <form action="ViewATM" method="post">
                    <div class="input-group">
                        
                        <input type="text" name="search_atm" class="col-sm-6 form-control1 input-search" placeholder="Branch/ ATM Name..." id="atm" onkeyup="showData_atm(this.value);" >
                        <div style="position: absolute; z-index: 2; list-style: none; background-color: #F0F8FF; width: 92%;" id="autocomplete2" ></div>
                        <span class="input-group-btn">
                            <button class="btn btn-success" type="submit" id="submit1"><i class="fa fa-search"></i></button>
                        </span>
                    </div><!-- Input Group -->
                </form>
                 <div class="map">
                      
                        <iframe src="map_atm.jsp" name="targetframe" allowTransparency="true" scrolling="no" frameborder="0" width="900" height="200">
                        </iframe>
                 </div>
                 
                 <div class="bs-example2 bs-example-padded-bottom">
                    <div class="tab-pane active" id="horizontal-form">
                        <form class="form-horizontal" action="AddATM" method="post">
                            <%  String  b_ida  = (String) session.getAttribute("b_ida");
                                String  a_name  = (String) session.getAttribute("a_name");
                                String  a_address1  = (String) session.getAttribute("a_address1");
                                String  a_address2  = (String) session.getAttribute("a_address2");
                                String  a_address3  = (String) session.getAttribute("a_address3");

                            %>
                            
                            <div class=" row col-lg-12 Bold" id="name"><h3><%= a_name %></h3></div>
                            <div class="form-group">
                                <label for="focusedinput" class="col-sm-2 control-label"><b>Branch ID :</b></label>
                                <label for="focusedinput" class="col-sm-2 control-label" value=" "><%= b_ida %> </label>    
                            </div>
                            <div class="form-group">
                                <label for="focusedinput" class="col-sm-2 control-label"><b>Address :</b></label>
                                <label for="focusedinput" class="control-label"> <%= a_address1 %> <%= a_address2 %>, <%= a_address3 %></label>    
                            </div> 
                 
                        </form>
                        
                        
                    </div>
                    <div class="col-md-4">
                        <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#myModala">
                         Edit
                        </button>
                        <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#myModala2" >
                         Delete
                        </button>
                    </div>
                                
                                
                    <div class="modal fade" id="myModala" tabindex="-1" role="dialog" aria-labelledby="myModalaLabel" aria-hidden="true" style="display: none;">
			<div class="modal-dialog">
                            <div class="modal-content">
				<div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                    <h2 class="modal-title">Edit Branch/ATM Details</h2>
				</div>
				<div class="modal-body">
                                                            
                                <form class="form-horizontal" action="UpdateATM" method="post">
                                    
                                    <div class="form-group">
                                      <label for="focusedinput" class="col-sm-2 control-label">ATM ID </label>
                                    <div class="col-sm-8">
                                        <label for="focusedinput" class="col-sm-2 control-label"><%= b_ida %></label>
                                          <input type="hidden" name="b_ida" class="form-control1" id="b_ida" name="b_ida" placeholder="Branch ID" value="<%= b_ida %>" required="required">
                                    </div> 
                                    </div>
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-2 control-label">ATM Name </label>
                                    <div class="col-sm-8">
                                          <input type="text" class="form-control1" id="b_name" name="a_name" placeholder="Branch Name " value="<%= a_name %>" required="required">
                                    </div> 
                                  </div>
                              
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-2 control-label">ATM Address</label>
                                  </div>
                              
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-3 control-label">No</label>
                                    <div class="col-sm-3">
                                          <input type="text" class="form-control1" id="b_address1" name="a_address1" placeholder="No" value="<%= a_address1 %>">
                                    </div>
                                  </div>
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-3 control-label">Street</label>
                                    <div class="col-sm-3">
                                          <input type="text" class="form-control1" id="b_address2" name="a_address2"placeholder="Street" value="<%= a_address2 %>" >
                                    </div>
                                  </div>
                                  <div class="form-group">
                                      <label for="focusedinput" class="col-sm-3 control-label">City</label>
                                    <div class="col-sm-3">
                                          <input type="text" class="form-control1" id="b_address3" name="a_address3" placeholder="City" value="<%= a_address3 %>" required="required">
                                    </div>
                                  </div>

                                    <div class="col-sm-3 input-append">
                                        <input type="password" name="confirmpassword2" placeholder="Enter your password" required="required">
                                    </div>
                                  <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Update</button>
                                  </div>
                                </form>                    
                                                            
						
				</div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
			</div>
                    </div>
                    
                                    
                                    
                                    
                    <div class="modal fade" id="myModala2" tabindex="-1" role="dialog" aria-labelledby="myModala2Label" aria-hidden="true" style="display: none;">
                        <div class="modal-dialog">
                            <div class="modal-content">
				<div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                    <h2 class="modal-title">Edit Branch/ATM Details</h2>
				</div>
				<div class="modal-body">
                                                            
                                    <form class="form-horizontal" action="DeleteATM" method="post">
                                        <h5>Do You really want to delete branch  "<%= a_name %>"  from the system ?</h5>
                                        <input type="password" name="confirmpassword" placeholder="Enter your password" required="required">
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                            <button type="submit" class="btn btn-primary">Delete</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                                    
                                    
                                    
                                    
                                    
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
<link href="css/custom.css" rel="stylesheet">
<!-- Metis Menu Plugin JavaScript -->
<script>
    function showData(value) {
                    
                    $.ajax({
                        url: "SearchBranch?branch=" + value,
                        type: "POST",
                        async: false,
                        success: function(data) {
                            $("#autocomplete").fadeIn();
                            $("#autocomplete").html(data);
                        }

                    });

                    $(document).on('click', 'li', function() {
                        $("#branch").val($(this).text());
                        $("#autocomplete").fadeOut();
                    });


                }
    function branchSelect() {

                    //document.getElementById("branch").disabled = false;
                    $('#panelbody').load('branchdetails.jsp');

                    //alert(bank);


                }
                function showData_atm(value) {
                    
                    $.ajax({
                        url: "SearchATM?atm=" + value,
                        type: "POST",
                        async: false,
                        success: function(data) {
                            $("#autocomplete2").fadeIn();
                            $("#autocomplete2").html(data);
                        }

                    });

                    $(document).on('click', 'li', function() {
                        $("#atm").val($(this).text());
                        $("#autocomplete2").fadeOut();
                    });


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
<script src="js/metisMenu.min.js"></script>
<script src="js/section.js"></script>
<script src="js/clockface.js"></script>
<script src="js/custom.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>

