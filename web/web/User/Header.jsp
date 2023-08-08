<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Save Mart - Bootstrap Shop Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="../Assets/Template/User/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="../Assets/Template/User/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../Assets/Template/User/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="../Assets/Template/form.css" />
    <%@include file="SessionValidator.jsp" %>
</head>

<body>
    <!-- Topbar Start -->
    <div class="container-fluid">
        <div class="row bg-secondary py-2 px-xl-5">
            <div class="col-lg-6 d-none d-lg-block">
                <div class="d-inline-flex align-items-center">
                    <a class="text-dark" href="">FAQs</a>
                    <span class="text-muted px-2">|</span>
                    <a class="text-dark" href="">Help</a>
                    <span class="text-muted px-2">|</span>
                    <a class="text-dark" href="">Support</a>
                </div>
            </div>
            <div class="col-lg-6 text-center text-lg-right">
                <div class="d-inline-flex align-items-center">
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-linkedin-in"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-instagram"></i>
                    </a>
                    <a class="text-dark pl-2" href="">
                        <i class="fab fa-youtube"></i>
                    </a>
                </div>
            </div>
        </div>
        <div class="row align-items-center py-3 px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a href="HomePage.jsp" class="text-decoration-none">
                    <h1 class="m-0 display-5 font-weight-semi-bold"><img src="../Assets/Template/User/img/SaveMart.png" width="250" height="200"></h1>
                </a>
            </div>
            <div class="col-lg-6 col-6 text-left">
                <form action="">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search for products">
                        <div class="input-group-append">
                            <span class="input-group-text bg-transparent text-primary">
                                <i class="fa fa-search"></i>
                            </span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-lg-3 col-6 text-right">
                
                <a href="MyCart.jsp" class="btn border">
                    <i class="fas fa-shopping-cart text-primary"></i>
                    <span class="badge">
               
                  <span class="badge"></span>
               </span>
                </a>
            </div>
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid mb-5">
        <div class="row border-top px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                    <h6 class="m-0">Here you go</h6>
                    <i class="fa fa-angle-down text-dark"></i>
                </a>
                <nav class="collapse show navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0" id="navbar-vertical">
                    <div class="navbar-nav w-100 overflow-hidden" style="height: 410px">
                        <div class="nav-item dropdown">
                           <!-- <a href="#" class="nav-link" data-toggle="dropdown">Staples</a> <i class="fa fa-angle-down float-right mt-1"></i></a>
                            <div class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
                          
                                <!--<a href="" class="dropdown-item">Men's Dresses</a>
                                <a href="" class="dropdown-item">Women's Dresses</a>
                                <a href="" class="dropdown-item">Baby's Dresses</a>
                            </div>-->
                        </div>
                        <a href="HomePage.jsp" class="nav-item nav-link">Home</a>
                        <a href="SearchProduct.jsp" class="nav-item nav-link">Products</a>
                        <a href="MyCart.jsp" class="nav-item nav-link">Checkout</a>
                        <a href="MyBookings.jsp" class="nav-item nav-link">My Orders</a>
                        <a href="FindItem.jsp" class="nav-item nav-link">Find an Item</a>
                        <a href="MyProfile.jsp" class="nav-item nav-link">My Profile</a>
                        <a href="Complaint.jsp" class="nav-item nav-link">Complaints</a>
                        <a href="Feedback.jsp" class="nav-item nav-link">Feedback</a>
                        <a href="logout.jsp" class="nav-item nav-link">Logout</a>
                       <!-- <a href="" class="nav-item nav-link">Jackets</a>
                        <a href="" class="nav-item nav-link">Shoes</a>-->
                    </div>
                </nav>
            </div>
            <div class="col-lg-9">
                <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                    <a href="" class="text-decoration-none d-block d-lg-none">
                        <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto py-0">
                            <a href="HomePage.jsp" class="nav-item nav-link active">Home</a>
                            <a href="MyProfile.jsp" class="nav-item nav-link">My Profile</a>
                            <a href="Complaint.jsp" class="nav-item nav-link">Complaints</a>
                            <a href="Feedback.jsp" class="nav-item nav-link">Feedback</a>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">My Cart</a>
                                <div class="dropdown-menu rounded-0 m-0">
                                    <a href="SearchProduct.jsp" class="dropdown-item">Shopping Cart</a>
                                    <a href="MyCart.jsp" class="dropdown-item">Checkout</a>
                                </div>
                            </div>
                            <a href="MyBookings.jsp" class="nav-item nav-link">My Orders</a>
                            <a href="FindItem.jsp" class="nav-item nav-link">Find an Item</a>
                        </div>
                        <div class="navbar-nav ml-auto py-0">
                            <a href="logout.jsp" class="nav-item nav-link">Log Out</a>
                           
                        </div>
                    </div>
                </nav>
                <div id="header-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">