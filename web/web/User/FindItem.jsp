<%-- 
    Document   : FindItem
    Created on : 20 Jul, 2023, 7:45:27 AM
    Author     : densy
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User-Find Item</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        
           <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    </head>
    <body><%@include file="Header.jsp" %>
        <div id="tab" align="center"><center>
            <h2 align="center">Find Item</h2><br>
            <center>
                <form method="post">
                    <table align="center">
                        <tr><td>Enter Item to Search</td>
                            <td><input type="text" name="search" id="search" onblur="capitalizeInput()" autocomplete="off"></td></tr><tr></tr>
                        <tr><td colspan="2" align="center">
                                <input type="submit" name="submit" value="SUBMIT">
                                <input type="reset" name="cancel" value="CANCEL">
                            </td></tr>
                    </table>
                </form><br>

                <%
                    if (request.getParameter("submit") != null) {

                %>
                <div class="text-center">
                       
                    </div>
                <div class="row" id="result">

                    <%   
                        String searchItem = request.getParameter("search");
                        String selProduct = "select * from tbl_item where item_name like '%" + searchItem + "%'";
                        ResultSet rsP = con.selectCommand(selProduct);
                        while (rsP.next()) {
                    %>

                    <div class="col-md-3 mb-2">
                        <div class="card-deck">
                            <div class="card border-secondary">
                                <img src="../Assets/Files/Items/<%=rsP.getString("item_image")%>" class="card-img-top" height="150">
                                <div class="card-img-secondary">
                                    <h6  class="text-light bg-info text-center rounded p-1"><%=rsP.getString("item_name")%></h6>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title text-danger">
                                        Price : <%=rsP.getString("item_price")%>/-
                                    </h5>
                                    <h5 class="card-title text-decoration-none">
                                        Rack Number : <%=rsP.getString("item_rackno")%>
                                    </h5>

                                    <%
                                        String stockSql = "select sum(stock_count) as stock from tbl_stock where item_id = '" + rsP.getString("item_id") + "'";
                                        ResultSet rsST = con.selectCommand(stockSql);
                                        rsST.next();
                                        if (rsST.getString("stock") != null) {
                                            int stock = Integer.parseInt(rsST.getString("stock"));
                                            if (stock == 0) {
                                    %>
                                    <a href="javascript:void(0)" class="btn btn-danger btn-block">Out of Stock</a>
                                    <%
                                        }
                                    } else {
                                    %>
                                    <a href="javascript:void(0)" class="btn btn-warning btn-block">Stock Not Found</a>
                                    <%
                                        }
                                    %>

                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div> <%
                    }
                    %></center>
        </div><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <%@include file="Footer.jsp" %>
    </body>
</html>
<script>
    function capitalizeInput() {
        var input = document.getElementById("search");
        var words = input.value.split(" ");

        for (var i = 0; i < words.length; i++) {
            words[i] = words[i].charAt(0).toUpperCase() + words[i].slice(1);
        }

        input.value = words.join(" ");
    }
</script>
