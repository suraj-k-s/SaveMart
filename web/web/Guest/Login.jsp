<%-- 
    Document   : Login
    Created on : 2 Jun, 2023, 10:27:58 AM
    Author     : densy
--%>
<%@page import="java.sql.ResultSet"  %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

            <!-- SEO Meta Tags -->
            <meta name="description" content="Tivo is a HTML landing page template built with Bootstrap to help you crate engaging presentations for SaaS apps and convert visitors into users.">
            <meta name="author" content="Inovatik">

            <!-- OG Meta Tags to improve the way the post looks when you share the page on LinkedIn, Facebook, Google+ -->
            <meta property="og:site_name" content="" /> <!-- website name -->
            <meta property="og:site" content="" /> <!-- website link -->
            <meta property="og:title" content=""/> <!-- title shown in the actual shared post -->
            <meta property="og:description" content="" /> <!-- description shown in the actual shared post -->
            <meta property="og:image" content="" /> <!-- image link, make sure it's jpg -->
            <meta property="og:url" content="" /> <!-- where do you want your post to link to -->
            <meta property="og:type" content="article" />

            <!-- Website Title -->
            <title>Log In </title>

            <!-- Styles -->
            <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,400i,700&display=swap&subset=latin-ext" rel="stylesheet">
            <link href="../Assets/Template/Login/css/bootstrap.css" rel="stylesheet">
            <link href="../Assets/Template/Login/css/fontawesome-all.css" rel="stylesheet">
            <link href="../Assets/Template/Login/css/swiper.css" rel="stylesheet">
            <link href="../Assets/Template/Login/css/magnific-popup.css" rel="stylesheet">
            <link href="../Assets/Template/Login/css/styles.css" rel="stylesheet">

            <!-- Favicon  -->
            <link rel="icon" href="../Assets/Template/Login/images/SaveMart.png">
        </head>

    <%
        if (request.getParameter("submit") != null) {
            String user = "select * from tbl_user where user_email='" + request.getParameter("mail") + "' and user_password='" + request.getParameter("password") + "'";
            ResultSet rsu = con.selectCommand(user);

            String admin = "select * from tbl_admin where admin_email='" + request.getParameter("mail") + "' and admin_password='" + request.getParameter("password") + "'";
            ResultSet rsa = con.selectCommand(admin);

            if (rsu.next()) {
                session.setAttribute("Uid", rsu.getString("user_id"));
                session.setAttribute("Uname", rsu.getString("user_name"));
                response.sendRedirect("../User/HomePage.jsp");
            }

            if (rsa.next()) {
                session.setAttribute("Aid", rsa.getString("admin_id"));
                //session.setAttribute("Aname",rsa.getString("admin_name"));
                response.sendRedirect("../Admin/HomePage.jsp");
            }
        }
    %>
    <body data-spy="scroll" data-target=".fixed-top">

        <!-- Preloader -->
        <div class="spinner-wrapper">
            <div class="spinner">
                <div class="bounce1"></div>
                <div class="bounce2"></div>
                <div class="bounce3"></div>
            </div>
        </div>
        <!-- end of preloader -->

        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
            <div class="container">

                <!-- Text Logo - Use this if you don't have a graphic logo -->
                <!-- <a class="navbar-brand logo-text page-scroll" href="index.html">Tivo</a> -->

                <!-- Image Logo -->
                <a class="navbar-brand logo-image" href="index.html"><img src="../Assets/Template/Login/images/logo.png" alt="alternative"></a> 

                <!-- Mobile Menu Toggle Button -->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-awesome fas fa-bars"></span>
                    <span class="navbar-toggler-awesome fas fa-times"></span>
                </button>
                <!-- end of mobile menu toggle button -->

                <div class="collapse navbar-collapse" id="navbarsExampleDefault">

                    <span class="nav-item" style="padding-left: 90%">
                        <a class="fas fa-home btn-outline-light" href="../index.html"></a>
                    </span>
                </div>
            </div> <!-- end of container -->
        </nav> <!-- end of navbar -->
        <!-- end of navigation -->

        <!-- Header -->
        <header id="header" class="ex-2-header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h1>Log In</h1>
                        <p>You don't have a password? Then please <a class="white" href="UserRegistration.jsp">Sign Up</a></p> 
                        <!-- Sign Up Form -->
                        <div class="form-container">
                            <form  data-toggle="validator" data-focus="false" method="post">
                                <div class="form-group">
                                    <input type="email" class="form-control-input" name="mail" id="lemail" autocomplete="off" required>
                                    <label class="label-control" for="lemail">Email</label>
                                    <div class="help-block with-errors"></div>
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control-input" name="password" id="lpassword" required>
                                    <label class="label-control" for="lpassword">Password</label>
                                    <div class="help-block with-errors"></div>
                                </div>
                                <div class="form-group">
                                    <button type="submit" name="submit" class="form-control-submit-button">LOG IN</button>
                                </div>
                                <div class="form-message">
                                    <div id="lmsgSubmit" class="h3 text-center hidden"></div>
                                </div>
                            </form>
                        </div> <!-- end of form container -->
                        <!-- end of sign up form -->

                    </div> <!-- end of col -->
                </div> <!-- end of row -->
            </div> <!-- end of container -->
        </header> <!-- end of ex-header -->
        <!-- end of header -->

        <!-- Scripts -->
        <script src="../Assets/Template/Login/js/jquery.min.js"></script> <!-- jQuery for Bootstrap's JavaScript plugins -->
        <script src="../Assets/Template/Login/js/popper.min.js"></script> <!-- Popper tooltip library for Bootstrap -->
        <script src="../Assets/Template/Login/js/bootstrap.min.js"></script> <!-- Bootstrap framework -->
        <script src="../Assets/Template/Login/js/jquery.easing.min.js"></script> <!-- jQuery Easing for smooth scrolling between anchors -->
        <script src="../Assets/Template/Login/js/swiper.min.js"></script> <!-- Swiper for image and text sliders -->
        <script src="../Assets/Template/Login/js/jquery.magnific-popup.js"></script> <!-- Magnific Popup for lightboxes -->
        <script src="../Assets/Template/Login/js/validator.min.js"></script> <!-- Validator.js - Bootstrap plugin that validates forms -->
        <script src="../Assets/Template/Login/js/scripts.js"></script> <!-- Custom scripts -->
    </body>
</html>