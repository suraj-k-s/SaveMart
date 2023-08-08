<%-- 
    Document   : DeliveryStatus
    Created on : 17 Jun, 2023, 7:11:49 PM
    Author     : densy
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin-Delivery Status</title>
    </head>
    <body>

        <%@include file="Header.jsp" %>
        <div id="tab" align="center"><h1><u>DELIVERY STATUS</u></h1><br><br>
            <table border="1" align="center">
                <tr><th>Sl No</th><th>Booking Id</th><th>User Name</th><th>Quantity</th><th>Booking Date</th><th colspan="2" algn="center">Delivery Mode</th><th>Delivery Status</th></tr>
                        <%
                            int i = 0;
                            String sel = "select * from tbl_booking b inner join tbl_user u on b.user_id=u.user_id";
                            ResultSet rs = con.selectCommand(sel);
                            while (rs.next()) {
                                i++;
                        %>
                <tr><td><%=i%></td>
                    <td><%=rs.getString("booking_id")%></td>
                    <td><%=rs.getString("user_name")%></td>
                    <td> <%
                        int count = 0;
                        String cart = "select COUNT(cart_qty) as sum from tbl_cart c inner join tbl_booking b on b.booking_id=c.booking_id where b.booking_id='" + rs.getString("booking_id") + "' and b.user_id='" + rs.getString("user_id") + "'";
                        // out.print(sum);
                        ResultSet crs = con.selectCommand(cart);
                        if (crs.next()) {
                            count = crs.getInt("sum");
                        %>

                        <%=count%>
                        <%  }%></td>
                    <td><%=rs.getString("booking_date")%></td>
                    <td><%=rs.getString("delivery_mode")%></td>
                    <td><%
                        if (rs.getString("delivery_mode").equals("Pick-up")) {
                            out.print(rs.getString("pickup_time"));
                            if (rs.getString("pickup_parkingslot").equals("0")) {

                            } else {
                                out.print("<br> Parking Slot:" + rs.getString("pickup_parkingslot"));
                        }

                    }%></td>
                    <td><%
                        if (rs.getString("booking_status").equals("0")) {
                            out.print("No order placed");
                        } else if (rs.getString("booking_status").equals("3")) {
                            out.print("Shipped");
                        } else if (rs.getString("booking_status").equals("4")) {
                            out.print("Delivered");
                        } else if (rs.getString("booking_status").equals("6")) {
                            out.print("Ready to Pick");
                        } else if (rs.getString("booking_status").equals("7")) {
                            out.print("Picked");
                        }
                        %></td></tr>
                        <%
                            }
                        %>
            </table>
        </div>
    </body>
</html>
