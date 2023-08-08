<%-- 
    Document   : ItemStock
    Created on : 8 Jul, 2023, 9:55:00 AM
    Author     : densy
--%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin- ItemStock</title>
    </head>
    <body><%@include file="Header.jsp" %><div id="tab" align="center">
        <table border="1">
            <table align="center" border="1">
                <tr>
                    <th>Sl No.</th><th>Item Image</th><th>Item Name</th><th>Price</th><th>Count</th>
                </tr>
                <tr>
                    <%
                    int i=0;
                    String sel="select * from tbl_item i inner join tbl_stock s on i.item_id=s.item_id where s.stock_count<=5";
                    ResultSet rs=con.selectCommand(sel);
                    while(rs.next())
                    {
                        i++;
                        %>
                        <td><%=i%></td>                  
                        <td><img src="../Assets/Files/Items/<%=rs.getString("item_image")%>" width="150" height="150"></td>
                        <td><%=rs.getString("item_name")%></td>
                        <td><%=rs.getString("item_price")%></td>
                        <td><%=rs.getString("stock_count")%></td>
                        </tr>
                        <%
                    }
                    %>
              </table></div>           
    </body>
</html>
