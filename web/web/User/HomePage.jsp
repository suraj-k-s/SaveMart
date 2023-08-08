<!DOCTYPE html>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <html lang="en">

        <head>
            <meta charset="utf-8">
            <title>Save Mart</title>
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
                    <form action="" method="post">
                        <div class="input-group">
                            <input type="text" name="search" class="form-control" placeholder="Search for products">
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
                        <span class="badge"><%                        int count = 0;
                            String cart = "select COUNT(cart_id) as sum from tbl_cart c inner join tbl_booking b on b.booking_id=c.booking_id where c.cart_status='0'  and b.user_id='" + session.getAttribute("Uid") + "'";
                            // out.print(sum);
                            ResultSet crs = con.selectCommand(cart);
                            if (crs.next()) {
                                count = crs.getInt("sum");
                            %>

                            <span class="badge"><%=count%></span>
                            <%  }%></span>
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
                                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Shop Now</a>
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
                            <div class="carousel-item active" style="height: 410px;">
                                <img class="img-fluid" src="../Assets/Template/User/img/fruits.jpg" alt="Image">
                                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                    <div class="p-3" style="max-width: 700px;">
                                        <!--<h4 class="text-light text-uppercase font-weight-medium mb-3">10% Off Your First Order</h4>-->
                                        <h3 class="display-4 text-white font-weight-semi-bold mb-4">Welcome</h3>
                                        <a href="SearchProduct.jsp" class="btn btn-light py-2 px-3">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item" style="height: 410px;">
                                <img class="img-fluid" src="../Assets/Template/User/img/sm.jpg" alt="Image">
                                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                    <div class="p-3" style="max-width: 700px;">
                                        <!-- <h4 class="text-light text-uppercase font-weight-medium mb-3">10% Off Your First Order</h4>-->
                                        <h3 class="display-4 text-white font-weight-semi-bold mb-4">Reasonable Price</h3>
                                        <a href="" class="btn btn-light py-2 px-3">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                            <div class="btn btn-dark" style="width: 45px; height: 45px;">
                                <span class="carousel-control-prev-icon mb-n2"></span>
                            </div>
                        </a>
                        <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                            <div class="btn btn-dark" style="width: 45px; height: 45px;">
                                <span class="carousel-control-next-icon mb-n2"></span>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Navbar End -->


        <!-- Featured Start -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5 pb-3">
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">Quality Product</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                        <h5 class="font-weight-semi-bold m-0">Home Delivery</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">Pick-Up</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">24/7 Support</h5>
                    </div>
                </div>
            </div>
        </div>
        <!-- Featured End -->


        <!-- Categories Start -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5 pb-3">
                <div class="col-lg-4 col-md-6 pb-1">
                    <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                        <!--<p class="text-right">15 Products</p>-->
                        <a href="" class="cat-img position-relative overflow-hidden mb-3">
                            <img class="img-fluid" src="../Assets/Template/User/img/staples.jfif" alt="">
                        </a>
                        <h5 class="font-weight-semi-bold m-0">Staples</h5>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 pb-1">
                    <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                        <!--<p class="text-right">15 Products</p>-->
                        <a href="" class="cat-img position-relative overflow-hidden mb-3">
                            <img class="img-fluid" src="../Assets/Template/User/img/fv.webp" alt="">
                        </a>
                        <h5 class="font-weight-semi-bold m-0">Fruits & Vegetables</h5>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 pb-1">
                    <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                        <!-- <p class="text-right">15 Products</p>-->
                        <a href="" class="cat-img position-relative overflow-hidden mb-3">
                            <img class="img-fluid" src="../Assets/Template/User/img/db.jfif" alt="">
                        </a>
                        <h5 class="font-weight-semi-bold m-0">Diary & Bakery</h5>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 pb-1">
                    <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                        <!--<p class="text-right">15 Products</p>-->
                        <a href="" class="cat-img position-relative overflow-hidden mb-3">
                            <img class="img-fluid" src="../Assets/Template/User/img/sbf.jfif" alt="">
                        </a>
                        <h5 class="font-weight-semi-bold m-0">Snacks & Branded Foods</h5>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 pb-1">
                    <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                        <!-- <p class="text-right">15 Products</p>-->
                        <a href="" class="cat-img position-relative overflow-hidden mb-3">
                            <img class="img-fluid" src="../Assets/Template/User/img/bv.jfif" alt="">
                        </a>
                        <h5 class="font-weight-semi-bold m-0">Beverages</h5>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 pb-1">
                    <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                        <!--<p class="text-right">15 Products</p>-->
                        <a href="" class="cat-img position-relative overflow-hidden mb-3">
                            <img class="img-fluid" src="../Assets/Template/User/img/homecare.png" alt="">
                        </a>
                        <h5 class="font-weight-semi-bold m-0">Home Care</h5>
                    </div>
                </div>
            </div>
        </div>
        <!-- Categories End -->












        <!-- Footer Start -->
        <div class="container-fluid bg-secondary text-dark mt-5 pt-5">
            <div class="row px-xl-5 pt-5">
                <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                    <a href="" class="text-decoration-none">
                        <h1 class="mb-4 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border border-white px-3 mr-1"></span>Save Mart</h1>
                    </a>
                    <p>We provide the best service.</p>
                    <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>ABC Street</p>
                    <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>savemart@gmail.com</p>
                    <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>9988007656</p>
                </div>
                <div class="col-lg-8 col-md-12">
                    <div class="row">
                        <div class="col-md-4 mb-5">
                            <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-dark mb-2" href="index.html"><i class="fa fa-angle-right mr-2"></i>Home</a>
                                <a class="text-dark mb-2" href="MyProfile.jsp"><i class="fa fa-angle-right mr-2"></i>My Profile</a>
                                <a class="text-dark mb-2" href="Complaint.jsp"><i class="fa fa-angle-right mr-2"></i>Complaints</a>
                                <a class="text-dark mb-2" href="Feedback.jsp"><i class="fa fa-angle-right mr-2"></i>Feedback</a>
                                <a class="text-dark mb-2" href="SearchProduct.jsp"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                                <a class="text-dark mb-2" href="MyCart.jsp"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                                <a class="text-dark mb-2" href="MyOrders.jsp"><i class="fa fa-angle-right mr-2"></i>My Orders</a>
                                <a class="text-dark" href="FindItem.jsp"><i class="fa fa-angle-right mr-2"></i>Find an Item</a>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
            <div class="row border-top border-light mx-xl-5 py-4">
                <div class="col-md-6 px-xl-0">
                    <p class="mb-md-0 text-center text-md-left text-dark">
                        &copy; <a class="text-dark font-weight-semi-bold" href="#">Save Mart</a>. All Rights Reserved. 

                    </p>
                </div>
                <div class="col-md-6 px-xl-0 text-center text-md-right">
                    <img class="img-fluid" src="../Assets/Template/User/img/payments.png" alt="">
                </div>
            </div>
        </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="../Assets/Template/User/lib/easing/easing.min.js"></script>
        <script src="../Assets/Template/User/lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="../Assets/Template/User/mail/jqBootstrapValidation.min.js"></script>
        <script src="../Assets/Template/User/mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="../Assets/Template/User/js/main.js"></script>
    </body>

</html>