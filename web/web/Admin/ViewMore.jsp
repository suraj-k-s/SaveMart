<%-- 
    Document   : ViewMore
    Created on : 1 Jul, 2023, 10:34:57 AM
    Author     : densy
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin-View More</title>
    </head>
    <body>
        <%@include file="Header.jsp" %><div id="tab" align="center"><br>
        <table border="1" align="center">
            <tr><th>Sl No</th><th>Item</th><th>Image</th><th>Price</th><th>Quantity</th><th>Total</th></tr>
            <%
            int i=0,a=0,b=0,sum=0;
        String sel="select * from tbl_booking b inner join tbl_cart c on b.booking_id=c.booking_id inner join tbl_item i on c.item_id=i.item_id where b.booking_id='"+request.getParameter("id")+"' ";
        ResultSet rs=con.selectCommand(sel);
        while(rs.next())
        {
            i++;
            %>
            <tr><td><%=i%></td>
                <td><%=rs.getString("item_name")%></td>
                <td><img src="../Assets/Files/Items/<%=rs.getString("item_image")%>" width="50" height="50"></td>
                <td><%=rs.getString("item_price")%></td>
                <td><%=rs.getString("cart_qty")%></td>
                <td>
                    <%  
                        int count=0;
                String cart="select c.cart_id,(i.item_price*c.cart_qty) as sum from tbl_cart c inner join tbl_item i on i.item_id=c.item_id";
               // out.print(sum);
                ResultSet crs=con.selectCommand(cart);
                if(crs.next())
                 {
                     count=crs.getInt("sum");
                %>
               
                  <%=count%>
                  <%  } %>
                </td></tr>
                <%
        }
            %>
        </table>
         </div>
    </body>
</html>
