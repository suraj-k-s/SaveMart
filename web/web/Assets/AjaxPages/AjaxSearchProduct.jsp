<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

    if (request.getParameter("action") != "") {

        String sqlQry = "select * from tbl_item i inner join tbl_subcategory s on s.subcategory_id=i.subcategory_id inner join tbl_category c on c.category_id=s.category_id where  true ";
        String row = "SELECT count(*) as count FROM tbl_item i inner join tbl_subcategory s on s.subcategory_id=i.subcategory_id inner join tbl_category c on c.category_id=s.category_id where true ";

        if (!request.getParameter("brand").equals("")) {

            String brand = request.getParameter("brand");

            sqlQry += "AND c.category_id IN(" + brand + ")";
            row += "AND c.category_id IN(" + brand + ")";
        }
          if (!request.getParameter("category").equals("")) {

            String category = request.getParameter("category");

            sqlQry += "AND s.subcategory_id IN(" + category + ")";
            row += "AND s.subcategory_id IN(" + category + ")";
        }
       
      //  out.println(sqlQry);
        ResultSet rs = con.selectCommand(sqlQry);
        ResultSet rsr = con.selectCommand(row);
        rsr.next();
        //out.println(row);
//Edited
  if (Integer.parseInt(rsr.getString("count")) > 0) {
            while (rs.next()) {
%>

<div class="col-md-3 mb-2">
                            <div class="card-deck">
                                <div class="card border-secondary">
                                    <img src="../Assets/Files/Items/<%=rs.getString("item_image")%>" class="card-img-top" height="250">
                                    <div class="card-img-secondary">
                                        <h6  class="text-light bg-info text-center rounded p-1"><%=rs.getString("subcategory_type")%></h6>
                                    </div>
                                    <div class="card-body">
                                        <h4 class="card-title text-danger">
                                            Price : <%=rs.getString("item_price")%>/-
                                        </h4>
                                        <p>
                                           Product  &nbsp;&nbsp;&nbsp;&nbsp;   : <%=rs.getString("item_name")%><br>
                                            Details  : <%=rs.getString("item_details")%><br>
                                          
                                        </p>
                                        <%
                                            String stockSql = "select sum(stock_count) as stock from tbl_stock where item_id = '" + rs.getString("item_id") + "'";
                                            ResultSet rsST = con.selectCommand(stockSql);
                                            rsST.next();
                                            if (rsST.getString("stock") != null) {
                                                int stock = Integer.parseInt(rsST.getString("stock"));
                                                if (stock > 0) {
                                        %>
                                        <a href="javascript:void(0)" onclick="addCart('<%=rs.getString("item_id")%>')" class="btn btn-success btn-block">Add to Cart</a>
                                        <%
                                        } else if (stock == 0) {
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
                                         <a href="ViewDressMore.jsp?id=<%=rs.getString("item_id")%>" class="btn btn-warning btn-block">View More</a>
                                    </div>
                                </div>
                            </div>
                        </div>

<%
            }
        } else {
            out.println("<h4>Products Not Found!!!!</h4>");
        }
    }

%>