<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        
           <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <style>
            .custom-alert-box{
                width: 20%;
                height: 10%;
                position: fixed;
                bottom: 0;
                right: 0;
                z-index:1;
                left: auto;
            }

            .success {
                color: #3c763d;
                background-color: #dff0d8;
                border-color: #d6e9c6;
                display: none;
            }

            .failure {
                color: #a94442;
                background-color: #f2dede;
                border-color: #ebccd1;
                display: none;
            }

            .warning {
                color: #8a6d3b;
                background-color: #fcf8e3;
                border-color: #faebcc;
                display: none;
            }
        </style>
    </head>
    <body>
        
        <div class="custom-alert-box">
            <div class="alert-box success">Successful Added to Cart !!!</div>
            <div class="alert-box failure">Failed to Add Cart !!!</div>
            <div class="alert-box warning">Already Added to Cart !!!</div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3">
                    <h5>Filter Product</h5>
                    <hr>
                    <h6 class="text-info"> Select Category</h6>
                    <ul class="list-group">
                        <%                            String selBrand = "SELECT * from tbl_category";
                            ResultSet rsB = con.selectCommand(selBrand);
                            while (rsB.next()) {
                        %>
                        <li class="list-group-item">
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input type="checkbox" class="form-check-input product_check" value="<%=rsB.getString("category_id")%>" id="brand"><%=rsB.getString("category_type")%>
                                </label>
                            </div>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                     <h6 class="text-info">Select Subcategory</h6>
                    <ul class="list-group">
                        <%                            String selBrand1 = "SELECT * from tbl_subcategory";
                            ResultSet rsB1 = con.selectCommand(selBrand1);
                            while (rsB1.next()) {
                        %>
                        <li class="list-group-item">
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input type="checkbox" class="form-check-input product_check" value="<%=rsB1.getString("subcategory_id")%>" id="category"><%=rsB1.getString("subcategory_type")%>
                                </label>
                            </div>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                  
                    </ul>
                  
                </div>

                <div class="col-lg-9">
                     <div class="col-lg-3" style="padding-left: 90%">
                    <a class="fas fa-home" href="HomePage.jsp">Home</a>
                     </div><br>
                    <div class="col-lg-3 col-6 text-right" style="padding-left: 90%">
            <a href="MyCart.jsp" class="btn border">
                <%  
                        int count=0;
                String cart="select COUNT(cart_id) as sum from tbl_cart c inner join tbl_booking b on b.booking_id=c.booking_id where c.cart_status='0'  and b.user_id='"+session.getAttribute("Uid")+"'";
               // out.print(sum);
                ResultSet crs=con.selectCommand(cart);
                if(crs.next())
                 {
                     count=crs.getInt("sum");
                %>
               
                <span id="count" class="badge"><%=count%></span>
                <%  } %>
                    <i class="fas fa-shopping-cart text-primary"></i>
                  
                </a>
        </div>
                    
                    <h5 class="text-center" id="textChange">All Products</h5>
                    
                    <hr>
                    <div class="text-center">
                       
                    </div>
                    <div class="row" id="result">

                        <%
                            String selProduct = "select * from tbl_item i inner join tbl_subcategory s on s.subcategory_id=i.subcategory_id inner join tbl_category c on c.category_id=s.category_id";
                            ResultSet rsP = con.selectCommand(selProduct);
                            while (rsP.next()) {
                        %>

                        <div class="col-md-3 mb-2">
                            <div class="card-deck">
                                <div class="card border-secondary">
                                    <img src="../Assets/Files/Items/<%=rsP.getString("item_image")%>" class="card-img-top" height="250">
                                    <div class="card-img-secondary">
                                        <h6  class="text-light bg-info text-center rounded p-1"><%=rsP.getString("item_name")%></h6>
                                    </div>
                                    <div class="card-body">
                                        <h4 class="card-title text-danger">
                                            Price : <%=rsP.getString("item_price")%>/-
                                        </h4>
                                        <p>
                                           Product &nbsp;&nbsp;&nbsp;&nbsp;   : <%=rsP.getString("subcategory_type")%><br>
                                          
                                            Details &nbsp; : <%=rsP.getString("item_details")%><br>
                                           
                                        </p>
                                        <%
                                          String selcart="select COALESCE(sum(cart_qty),0 ) as stockcount from tbl_cart where item_id = '" + rsP.getString("item_id") + "'";
                                          //out.print(selcart);
                                                ResultSet rsc = con.selectCommand(selcart);
                                                
                                                 rsc.next();
                                              //   out.println("Cart"+Integer.parseInt(rsc.getString("stockcount")));
                                            String stockSql = "select COALESCE(sum(stock_count),0) as stock from tbl_stock where item_id = '" + rsP.getString("item_id") + "'";
                                           
                                            ResultSet rsST = con.selectCommand(stockSql);
                                            
                                            rsST.next();
                                          //  out.println("stock"+Integer.parseInt(rsST.getString("stock")));
                                            if (rsST.getString("stock") != null) {
                                              
                                                
                                                int stock = Integer.parseInt(rsST.getString("stock"))- Integer.parseInt(rsc.getString("stockcount"));
                                               // out.println(stock);
                                                if (stock == 0) {
                                        %>
                                    
                                        <a href="javascript:void(0)" class="btn btn-danger btn-block">Out of Stock</a>
                                        
                                        
                                        <%
                                        } else if (stock >0) {
                                        %>
                                        <a href="javascript:void(0)" onclick="addCart('<%=rsP.getString("item_id")%>')" class="btn btn-success btn-block">Add to Cart</a>
                                        <%
                                            }
                                         else {
                                               
                                        %>
                                        <a href="javascript:void(0)" class="btn btn-warning btn-block">Stock Not Found</a>
                                        <%
                                            }
                                            }
                                        %>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>

                </div>

            </div>
        </div>

        <script>

            function addCart(id)
            {
                $.ajax({
                    url: "../Assets/AjaxPages/AjaxAddCart.jsp?id=" + id,
                    success: function(response) {
                        $("#count").html(response.count);
                        if (response.msg.trim() === "Added to Cart")
                        {
                           //  location.reload();
                            // setTimeout(function (){
                            $("div.success").fadeIn(300).delay(1500).fadeOut(400);
                            // },500)
                        }
                        else if (response.msg.trim() === "Already Added to Cart")
                        {
                            $("div.warning").fadeIn(300).delay(1500).fadeOut(400);
                            
                        }
                        else
                        {
                            $("div.failure").fadeIn(300).delay(1500).fadeOut(400);
                            
                        }
                    }
                });
              
            }
// location.reload();

            $(document).ready(function() {

                $(".product_check").click(function() {
                    $("#loder").show();

                    var action = 'data';
                    var brand = get_filter_text('brand');
                    var category = get_filter_text('category');
                  


                    $.ajax({
                        url: "../Assets/AjaxPages/AjaxSearchProduct.jsp?action=" + action + "&brand=" + brand + "&category=" + category,
                        success: function(response) {
                            $("#result").html(response);
                            $("#loder").hide();
                            $("#textChange").text("Filtered Products");
                        }
                    });


                });



                function get_filter_text(text_id)
                {
                    var filterData = [];

                    $('#' + text_id + ':checked').each(function() {
                        filterData.push($(this).val());
                    });
                    return filterData;
                }
            });
        </script>
    </body>
</html>

