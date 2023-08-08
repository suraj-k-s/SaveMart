<%-- 
    Document   : PaymentStatus
    Created on : 17 Jun, 2023, 7:39:05 PM
    Author     : densy
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin-Payment Status</title>
    </head>
    <body><%@include file="Header.jsp" %>
        <div id="tab" align="center">
        <h1>Payment Status</h1>
        <table border="1" align="center">
            <tr><th>Sl No</th><th>Booking Id</th><th>User Name</th><th>Booking Date</th><th>Price</th><th>Payment Status</th><th>Delivery Mode</th></tr>
            <%
                int i=0;
            String sel="select * from tbl_booking b inner join  tbl_user u on b.user_id=u.user_id";
            ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
                i++;
                %>
                <tr><td><%=i%></td>
                <td><%=rs.getString("booking_id")%></td>
                <td><%=rs.getString("user_name")%></td>
                <td><%=rs.getString("booking_date")%></td>
                <td><%=rs.getString("booking_amount")%></td>
                <td><%
                if(rs.getString("payment_status").equals("0"))
                {
                    out.print("Not Paid");
                }
                if(rs.getString("payment_status").equals("1"))
                {
                    out.print("Paid");
                }
                %></td>
                <td><%=rs.getString("delivery_mode")%></td>
                </tr>
                <%
            }
            %>
        </table>
        </div>
    </body>
</html>
