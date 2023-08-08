<%-- 
    Document   : ReportItems
    Created on : 11 Jul, 2023, 11:53:19 AM
    Author     : densy
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin-Report Items</title>
    </head>
    <body><%@include file="Header.jsp" %>
          <div id="tab" align="center">
        <h1 align="center">ITEMS SOLD</h1>
        <form method="post">
            <table align="center">
                <tr><td>From Date</td><td><input type="date" name="fromdate"></td> 
                    <td>To Date</td><td><input type="date" name="todate"></td></tr><tr></tr>
                     <tr><td colspan="4" align="center">
                        <input type="submit" name="submit" value="SUBMIT">
                        <input type="reset" name="cancel" value="CANCEL">
                    </td></tr>
            </table>
        </form>
        <table align="center" border="1">
            <tr><th>Sl No</th><th>Item ID</th><th>Item Name</th><th>Item Price</th><th>Total Stock</th><th>Quantity Sold</th><th>Balance Stock</th></tr>
            <%
                int i=0;
               
            String sel="SELECT i.item_id, i.item_name, i.item_price, SUM(cart_qty) AS quantity, s.stock_count FROM tbl_cart c JOIN tbl_item i ON c.item_id = i.item_id JOIN tbl_booking b ON c.booking_id = b.booking_id LEFT JOIN tbl_stock s ON c.item_id = s.item_id WHERE b.booking_date BETWEEN '"+request.getParameter("fromdate")+"' AND '"+request.getParameter("todate")+"' GROUP BY i.item_id, i.item_name, i.item_price, s.stock_count;";
            ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
              i++;
             
              %>
            <tr><td><%=i%></td>
                <td><%=rs.getString("item_id")%></td>
            <td><%=rs.getString("item_name")%></td>
            <td><%=rs.getString("item_price")%></td>
            <td><%=rs.getInt("stock_count")%></td>
            <td><%=rs.getInt("quantity")%></td>
            <td><%=rs.getInt("stock_count") - rs.getInt("quantity")%></td>
            </tr>
            <%
            }
            
            %></table></div>
    </body>
</html>
