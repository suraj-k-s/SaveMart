<%-- 
    Document   : UserRegistration
    Created on : 1 Jun, 2023, 7:36:39 PM
    Author     : densy
--%>
<%@page import="java.sql.ResultSet" %>
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
        <title>Sign Up</title>

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
                        <h1>Sign Up</h1>
                        <p>Fill out the form below to sign up for Save Mart. Already signed up? Then just <a class="white" href="Login.jsp">Log In</a></p> 
                        <!-- Sign Up Form -->
                        <div class="form-container">
                            <form  data-toggle="validator" method="post" data-focus="false" action="../Assets/ActionPages/UserAction.jsp" enctype="multipart/form-data">

                                <div class="form-group">
                                    <input type="text" class="form-control-input" name="uname" id="sname" required title="Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$" autocomplete="off">
                                    <label class="label-control" for="sname">Name</label>
                                    <div class="help-block with-errors"></div>
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control-input" name="mailid" id="semail" autocomplete="off" required>
                                    <label class="label-control" for="semail">Email</label>
                                    <div class="help-block with-errors"></div>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control-input" name="contact" id="sname" autocomplete="off" pattern="[0-9]{10}" minlength="10" required>
                                    <label class="label-control" for="sname" >Contact</label>
                                    <div class="help-block with-errors"></div>
                                </div>
                                <!--<div class="form-group">
                                    <input type="file" style="padding-left:25%" class="form-control-input" name="file_photo" id="sname" required>
                                   <label class="label-control" for="sname">Photo</label>
                                   <div class="help-block with-errors"></div>
                               </div>-->
                                <div class="form-group">
                                    <input type="password" class="form-control-input" name="password" id="spassword" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
                                    <label class="label-control" for="spassword" >Password</label>
                                    <div class="help-block with-errors"></div>
                                </div>
                                <div class="form-group checkbox">
                                    <input type="checkbox" id="sterms" value="Agreed-to-Terms" required>I agree with Save Mart's Privacy Policy and Terms Conditions
                                    <a href="terms.jsp">Terms and Conditions</a>
                                    <div class="help-block with-errors"></div>
                                </div>
                                <div class="form-group">
                                    <button type="submit"  name="submit" class="form-control-submit-button">SIGN UP</button>
                                </div>
                                <div class="form-message">
                                    <div id="smsgSubmit" class="h3 text-center hidden"></div>
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