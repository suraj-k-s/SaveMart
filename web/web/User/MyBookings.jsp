<%-- 
    Document   : MyBookings
    Created on : 7 Jun, 2023, 11:27:18 AM
    Author     : densy
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User-MyBookings</title>
    </head>
    <body>
       <%@include file="Header.jsp" %>
         <div id="tab" align="center">
        <h1 align="center">My Orders</h1>
        <table border="1" align="center">
            <tr><th>Sl No</th><th>Booking ID</th><th>Booking Date</th><th>Price</th><th>Quantity</th><th colspan="2" algn="center">Mode</th><th>Status</th><th></th></tr>
        <%
            int i=0;
        String sel="select * from tbl_booking where payment_status='1' and user_id='"+session.getAttribute("Uid") +"' ";
        ResultSet rs=con.selectCommand(sel);
        
        while(rs.next())
        {
            i++;
            %>
            <tr><td><%=i%></td>
                <td><%=rs.getString("booking_id")%></td>
                <td><%=rs.getString("booking_date")%></td>
                <td><%=rs.getString("booking_amount")%></td>
                <td>
                <%  
                        int count=0;
                String cart="select COUNT(cart_qty) as sum from tbl_cart c inner join tbl_booking b on b.booking_id=c.booking_id where b.booking_id='"+rs.getString("booking_id")+"' and b.user_id='"+session.getAttribute("Uid")+"'";
               // out.print(sum);
                ResultSet crs=con.selectCommand(cart);
                if(crs.next())
                 {
                     count=crs.getInt("sum");
                %>
               
                  <%=count%>
                  <%  } %></td>
                <td><%=rs.getString("delivery_mode")%></td>
                 
                 <td>
                <%
                if(rs.getString("delivery_mode").equals("Pick-up"))
                {
                out.print(rs.getString("pickup_time"));
                     if( rs.getString("pickup_parkingslot").equals("0"))
                     {
                         out.print("<br>No slots ");
                     }else{
                          out.print("<br> Parking Slot:"+rs.getString("pickup_parkingslot"));
                     }
                 
                   
                }
                
               else if(rs.getString("delivery_mode").equals("Home Delivery"))
                {
                   out.print("Address:<br>"+rs.getString("delivery_address"));
                   
                }
                
                %>
                   </td>
                <td>
                <%
                if(rs.getString("booking_status").equals("1"))
                {
                out.print("Order Received");
                //response.sendRedirect("MyBookings.jsp");
                }
                else if(rs.getString("booking_status").equals("2"))
                {
                    out.print("Order Confirmed");
                    response.sendRedirect("MyBookings.jsp");
                }
                else if(rs.getString("booking_status").equals("3"))
                {
                    out.print("Shipped");
                    response.sendRedirect("MyBookings.jsp");
                }
                else if(rs.getString("booking_status").equals("4"))
                {
                    out.print("Delivered");
                    response.sendRedirect("MyBookings.jsp");
                }
                else if(rs.getString("booking_status").equals("5"))
                {
                    out.print("Items Packed");
                    %>
                   
                   
                    <a href="MyBookings.jsp?eid=<%=rs.getString("booking_id")%>">Pick-up</a>
                    <%
                    if(request.getParameter("eid")!=null)
                {
                    String up="update tbl_booking set booking_status='6' where booking_id='"+request.getParameter("eid")+"'";
                    con.executeCommand(up);
                    %><script>window.location="MyBookings.jsp";</script><%
                }
                }
                else if(rs.getString("booking_status").equals("6"))
                {
                    out.print("Ready to Pick");
                    
                    %>
                    <a href="MyBookings.jsp?eid=<%=rs.getString("booking_id")%>">Pick-up</a>
                    <%
                    if(request.getParameter("eid")!=null)
                {
                    String up="update tbl_booking set booking_status='7' where booking_id='"+request.getParameter("eid")+"'";
                    con.executeCommand(up);
                    %><script>window.location="MyBookings.jsp";</script><%
                }
                    
                    
                     
                }
                
               else if(rs.getString("booking_status").equals("6"))
                {
                    out.print("Picked");
                }
                %>
                </td>
                <td><a href="ViewItems.jsp?id=<%=rs.getString("booking_id")%>">View Items</a></td>
            </tr>
            <%
        }
        %>
        </table></div><%@include file="Footer.jsp" %>
    </body>
</html>
