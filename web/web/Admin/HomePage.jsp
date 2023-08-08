<!DOCTYPE html>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<html lang="en">
   <head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>Save Mart -  Admin Panel </title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- site icon -->
      <link rel="icon" href="../Assets/Template/Admin/images/fevicon.png" type="image/png" />
      <!-- bootstrap css -->
      <link rel="stylesheet" href="../Assets/Template/Admin/css/bootstrap.min.css" />
      <!-- site css -->
      <link rel="stylesheet" href="../Assets/Template/Admin/style.css" />
      <!-- responsive css -->
      <link rel="stylesheet" href="../Assets/Template/Admin/css/responsive.css" />
      <!-- color css -->
      <link rel="stylesheet" href="../Assets/Template/Admin/css/colors.css" />
      <!-- select bootstrap -->
      <link rel="stylesheet" href="../Assets/Template/Admin/css/bootstrap-select.css" />
      <!-- scrollbar css -->
      <link rel="stylesheet" href="../Assets/Template/Admin/css/perfect-scrollbar.css" />
      <!-- custom css -->
      <link rel="stylesheet" href="../Assets/Template/Admin/css/custom.css" />
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
   </head>
   <body class="dashboard dashboard_1">
      <div class="full_container">
         <div class="inner_container">
            <!-- Sidebar  -->
            <nav id="sidebar">
               <div class="sidebar_blog_1">
                  <div class="sidebar-header">
                     <div class="logo_section">
                        <a href="index.html"><img class="logo_icon img-responsive" src="../Assets/Template/Admin/images/logo/SaveMart.png" alt="#" /></a>
                     </div>
                  </div>
                  <div class="sidebar_user_info">
                     <div class="icon_setting"></div>
                     <div class="user_profle_side">
                         <div class="user_img"><img class="img-responsive" src="../Assets/Template/Admin/images/logo/SaveMart.png" alt="" width="150" height="90"/></div>
                        <div class="user_info">
                           <!--<h6>John David</h6>
                           <p><span class="online_animation"></span> Online</p>-->
                        </div>
                     </div>
                  </div>
               </div>
               <div class="sidebar_blog_2">
                  <h4>Home Page</h4>
                  <ul class="list-unstyled components">
                     <li class="active">
                         <a href="HomePage.jsp"><i class="fa fa-dashboard red_color"></i> <span>Dashboard</span></a>
                       
                     </li>
                     <li><a href="Category.jsp"><i class="fa fa-diamond yellow_color"></i> <span>Category</span></a>
                     </li>
                     
                     <li>
                         <a href="SubCategory.jsp"><i class="fa fa-diamond blue1_color"></i> <span>Sub-Category</span></a>
                     </li>
                        
                     
                     <li><a href="Item.jsp"><i class="fa fa-diamond yellow_color"></i> <span>Items</span></a></li>
                     <!--<li><a href="ItemStock.jsp"><i class="fa fa-exclamation"></i> <span>Less Stock Items</span></a></li>-->
                     <li>
                        <a href="ViewComplaint.jsp"><i class="fa fa-comment red_color"></i> <span>Complaints</span></a>
                        
                     </li>
                     <li><a href="ViewFeedback.jsp"><i class="fa fa-feed green_color"></i> <span>Feedback</span></a></li>
                     <li>
                        <a href="ViewUsers.jsp"><i class="fa fa-group orange_color"></i> <span>Users</span></a>
                     </li>
                     
                      <li>
                        <a href="ViewBookings.jsp"><i class="fa fa-opencart blue2_color"></i> <span>Orders</span></a>
                        
                     </li>
                     <li>
                        <!--<a href="DeliveryStatus.jsp"><i class="fa fa-ship yellow_color"></i> <span>Delivery Status</span></a>-->
                        
                     </li>
                     <li><a href="PaymentStatus.jsp"><i class="fa fa-paypal purple_color2"></i> <span>Payment Status</span></a></li>
                     <li><a href="Report.jsp"><i class="fa fa-bar-chart green_color"></i> <span>Reports</span></a></li>
                    <!-- <li><a href="settings.html"><i class="fa fa-cog yellow_color"></i> <span>Settings</span></a></li>-->
                  </ul>
               </div>
            </nav>
            <!-- end sidebar -->
            <!-- right content -->
            <div id="content">
               <!-- topbar -->
               <div class="topbar">
                  <nav class="navbar navbar-expand-lg navbar-light">
                     <div class="full">
                        <button type="button" id="sidebarCollapse" class="sidebar_toggle"><i class="fa fa-bars"></i></button>
                        <div class="logo_section">
                            <a href="index.html"><!--<img class="img-responsive" src="../Assets/Template/Admin/images/logo/SaveMart.png" alt="#" width="100" height="150" />--></a>
                        </div>
                        <div class="right_topbar">
                           <div class="icon_info">
                              <ul class="user_profile_dd">
                                 <li>
                                    <a class="dropdown-toggle" data-toggle="dropdown"><span class="name_user">Admin</span></a>
                                    <div class="dropdown-menu">
                   
                                       <a class="dropdown-item" href="logout.jsp"><span>Log Out</span> <i class="fa fa-sign-out"></i></a>
                                    </div>
                                 </li>
                              </ul>
                           </div>
                        </div>
                     </div>
                  </nav>
               </div>
               <!-- end topbar -->
               <!-- dashboard inner -->
                 <div class="midde_cont">
                  <div class="container-fluid">
                     <div class="row column_title">
                        <div class="col-md-12">
                           <div class="page_title">
                              <h2>Dashboard</h2>
                           </div>
                        </div>
                     </div>
                     <div class="row column1">
                        <div class="col-md-6 col-lg-3">
                           <div class="full counter_section margin_bottom_30">
                              <div class="couter_icon">
                                 <div> 
                                    <i class="fa fa-users yellow_color"></i>
                                 </div>
                              </div>
                              <div class="counter_no">
                                 <div>
                                    <p class="total_no"><%
                                        String sel="SELECT COUNT(user_id) as user FROM tbl_user";
                                        ResultSet rs=con.selectCommand(sel);
                                        int ucount=0;
                                        if(rs.next())
                                        {
                                            ucount=rs.getInt("user");
                                        }%>
                                        <%=ucount%>
                                   </p>
                                    <a class="head_couter" href="ViewUsers.jsp">Users</a>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                           <div class="full counter_section margin_bottom_30">
                              <div class="couter_icon">
                                 <div> 
                                    <i class="fa fa-clock-o blue1_color"></i>
                                 </div>
                              </div>
                              <div class="counter_no">
                                 <div>
                                     <p class="total_no">
                                       <%
                                        String seli="SELECT COUNT(item_id) as items FROM tbl_item";
                                        ResultSet rsi=con.selectCommand(seli);
                                        int icount=0;
                                        if(rsi.next())
                                        {
                                            icount=rsi.getInt("items");
                                        }%>
                                        <%=icount%>  
                                     </p>
                                    <p class="head_couter">Items</p>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                           <div class="full counter_section margin_bottom_30">
                              <div class="couter_icon">
                                 <div> 
                                    <i class="fa fa-comments green_color"></i>
                                 </div>
                              </div>
                              <div class="counter_no">
                                 <div>
                                    <p class="total_no"><%
                                        String selc="SELECT COUNT(complaint_id) as complaints FROM tbl_complaint";
                                        ResultSet rsc=con.selectCommand(selc);
                                        int ccount=0;
                                        if(rsc.next())
                                        {
                                            ccount=rsc.getInt("complaints");
                                        }%>
                                        <%=ccount%></p>
                                    <p class="head_couter">Complaints</p>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                           <div class="full counter_section margin_bottom_30">
                              <div class="couter_icon">
                                 <div> 
                                    <i class="fa fa-feed red_color"></i>
                                 </div>
                              </div>
                              <div class="counter_no">
                                 <div>
                                    <p class="total_no"><%
                                        String self="SELECT COUNT(feedback_id) as feedbacks FROM tbl_feedback";
                                        ResultSet rsf=con.selectCommand(self);
                                        int fcount=0;
                                        if(rsf.next())
                                        {
                                            fcount=rsf.getInt("feedbacks");
                                        }%>
                                        <%=fcount%></p>
                                    <p class="head_couter">Feedbacks</p>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     
                  <!-- footer -->
               </div>
               <!-- end dashboard inner -->
            </div>
         </div>
      </div>
      <!-- jQuery -->
      <script src="../Assets/Template/Admin/js/jquery.min.js"></script>
      <script src="../Assets/Template/Admin/js/popper.min.js"></script>
      <script src="../Assets/Template/Admin/js/bootstrap.min.js"></script>
      <!-- wow animation -->
      <script src="../Assets/Template/Admin/js/animate.js"></script>
      <!-- select country -->
      <script src="../Assets/Template/Admin/js/bootstrap-select.js"></script>
      <!-- owl carousel -->
      <script src="../Assets/Template/Admin/js/owl.carousel.js"></script> 
      <!-- chart js -->
      <script src="../Assets/Template/Admin/js/Chart.min.js"></script>
      <script src="../Assets/Template/Admin/js/Chart.bundle.min.js"></script>
      <script src="../Assets/Template/Admin/js/utils.js"></script>
      <script src="../Assets/Template/Admin/js/analyser.js"></script>
      <!-- nice scrollbar -->
      <script src="../Assets/Template/Admin/js/perfect-scrollbar.min.js"></script>
      <script>
         var ps = new PerfectScrollbar('#sidebar');
      </script>
      <!-- custom js -->
      <script src="../Assets/Template/Admin/js/custom.js"></script>
      <script src="../Assets/Template/Admin/js/chart_custom_style1.js"></script>
   </body>
</html>