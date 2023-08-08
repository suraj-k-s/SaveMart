<%-- 
    Document   : ViewBookings
    Created on : 7 Jun, 2023, 1:58:57 PM
    Author     : densy
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin-ViewBookings</title>
    </head>
    <body>
         <%@include file="Header.jsp" %><div id="tab" align="center">
             <%
            if(request.getParameter("eid")!=null)
                {
                    String up="update tbl_booking set booking_status='"+request.getParameter("status")+"' where booking_id='"+request.getParameter("eid")+"'";
                    if(con.executeCommand(up))
                    {
                        String selb="select * from tbl_booking where booking_id='"+request.getParameter("eid")+"'";
                     // out.print(selb);
                        ResultSet rsb=con.selectCommand(selb);
                        if(rsb.next())
                        {
                        if(rsb.getString("booking_status").equals("2"))
                        {
                            String title="Booking Confirmed";
                            String content="Your order is confiremd.Wait for further details.";
                            String ins="insert into tbl_notification(`notification_date`,`notification_title`,`notification_content`,`user_id`,`booking_id`)values(curdate(),'"+title+"','"+content+"','"+rsb.getString("user_id")+"','"+rsb.getString("booking_id")+"')";
//                           out.print(ins);
              
                                   con.executeCommand(ins);
                        }
                        else if(rsb.getString("booking_status").equals("3"))
                        {
                            String title="Order Shipped";
                            String content="Your order is shipped to your address.";
                            String ins="insert into tbl_notification(`notification_date`,`notification_title`,`notification_content`,`user_id`,`booking_id`)values(curdate(),'"+title+"','"+content+"','"+rsb.getString("user_id")+"','"+rsb.getString("booking_id")+"')";
//                           out.print(ins);
              
                                   con.executeCommand(ins);
                        }
                        else if(rsb.getString("booking_status").equals("4"))
                        {
                            String title="Order Delivered";
                            String content="Your order is delivered to your address.Thank you for placing orders.";
                            String ins="insert into tbl_notification(`notification_date`,`notification_title`,`notification_content`,`user_id`,`booking_id`)values(curdate(),'"+title+"','"+content+"','"+rsb.getString("user_id")+"','"+rsb.getString("booking_id")+"')";
//                           out.print(ins);
              
                                   con.executeCommand(ins);
                        }
                        else if(rsb.getString("booking_status").equals("5"))
                        {
                            String title="Items Packed";
                            String content="Your order is packed and ready for pickup.";
                            String ins="insert into tbl_notification(`notification_date`,`notification_title`,`notification_content`,`user_id`,`booking_id`)values(curdate(),'"+title+"','"+content+"','"+rsb.getString("user_id")+"','"+rsb.getString("booking_id")+"')";
//                           out.print(ins);
              
                                   con.executeCommand(ins);
                        }
                        
                    }
                    }
                    
                     
                   %>
                   <script>//window.location="ViewBookings.jsp";</script>
                   <%
                }
                 %>
                 <h1 align="center"><U>ALL ORDERS</U></h1><br><br>
        <table border="1" align="center">
            <tr><th>Sl No</th><th>Booking Id</th><th>Booking Date</th><th>User Name</th><th>Price</th><th>Quantity</th><th>Contact</th><th colspan="2" algn="center">Mode</th><th>Booking Status</th><th></th></tr>
            <%
                String status="",userid="";
            int i=0;
            String sel="select * from tbl_booking b inner join tbl_user u on b.user_id=u.user_id";
            ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
                i++;
                userid=rs.getString("user_id");
                %>
                <tr><td><%=i%></td>
                    <td><%=rs.getString("booking_id")%></td>
                    <td><%=rs.getString("booking_date")%></td>
                    <td><%=rs.getString("user_name")%></td>
                <td><%=rs.getString("booking_amount")%></td>
                <td>
                    <%  
                        int count=0;
                String cart="select COUNT(cart_qty) as sum from tbl_cart c inner join tbl_booking b on b.booking_id=c.booking_id where b.booking_id='"+rs.getString("booking_id")+"' and b.user_id='"+rs.getString("user_id")+"'";
               // out.print(sum);
                ResultSet crs=con.selectCommand(cart);
                if(crs.next())
                 {
                     count=crs.getInt("sum");
                %>
               
                  <%=count%>
                  <%  } %>
                </td>
                
                <td><%=rs.getString("user_contact")%></td>
                <td><%=rs.getString("delivery_mode")%></td>
                 
                 <td>
                <%
               // if(rs.getString("delivery_mode").equals("Pick-up"))
             //   {
               // out.print(rs.getString("pickup_time"));
                 //    if( rs.getString("pickup_parkingslot").equals("0"))
                     //{
                         %>
                       <!--  <a href="ParkingSlot.jsp?eid=<%//=rs.getString("booking_id")%>">Parking Slot</a>-->
                         
                         <%
                     //}else{
                   //       out.print("<br> Parking Slot:"+rs.getString("pickup_parkingslot"));
                 //    }
                 
                   
               // }
                
                if(rs.getString("delivery_mode").equals("Home Delivery"))
                {
                   out.print("Address:<br>"+rs.getString("delivery_address"));
                   
                }
                
                %>
                   </td>
                   <td>
                <%
                //if(rs.getString("booking_status").equals("1") )
                //{
               // out.print("Order Received");
                if(rs.getString("booking_status").equals("1") &&  rs.getString("delivery_mode").equals("Home Delivery"))
                {
                    out.print("Order Received");
                %>
                <a href="ViewBookings.jsp?eid=<%=rs.getString("booking_id")%>&status=2&<%=rs.getString("user_id")%>">Order Confirmed</a>
                <%
                
                //response.sendRedirect("ViewBookings.jsp");
                }
               // }
                else if(rs.getString("booking_status").equals("2") &&  rs.getString("delivery_mode").equals("Home Delivery"))
                {
                    out.print("Order Confirmed");
                    %>
                    <a href="ViewBookings.jsp?eid=<%=rs.getString("booking_id")%>&status=3&<%=rs.getString("user_id")%>">Shipped</a>
                    <%
                    //response.sendRedirect("ViewBookings.jsp");
                }
                else if(rs.getString("booking_status").equals("3") &&  rs.getString("delivery_mode").equals("Home Delivery"))
                {
                    out.print("Shipped");
                    %>
                    <a href="ViewBookings.jsp?eid=<%=rs.getString("booking_id")%>&status=4&<%=rs.getString("user_id")%>">Delivered</a>
                    <%
                    //response.sendRedirect("ViewBookings.jsp");
                }
                else if(rs.getString("booking_status").equals("1") &&  rs.getString("delivery_mode").equals("Pick-up"))
                {
                    out.print("Order Received");
                    %>
                <a href="ViewBookings.jsp?eid=<%=rs.getString("booking_id")%>&status=2&<%=rs.getString("user_id")%>">Order Confirmed</a>
                <%
                    
                }
                else if(rs.getString("booking_status").equals("2") &&  rs.getString("delivery_mode").equals("Pick-up"))
                {
                    out.print("Order Confirmed");
                    %>
                <a href="ViewBookings.jsp?eid=<%=rs.getString("booking_id")%>&status=5&<%=rs.getString("user_id")%>">Item Packed</a>
                <%
                    
                }
                else if(rs.getString("booking_status").equals("5")&&  rs.getString("delivery_mode").equals("Pick-up"))
                {
                    out.print("Item Packed");
                    %>
                    <a href="ParkingSlot.jsp?eid=<%=rs.getString("booking_id")%>">Parking Slot</a>
                    <%
                    out.print("<br> Parking Slot:"+rs.getString("pickup_parkingslot"));
                    
                }
                else if(rs.getString("booking_status").equals("6")&&  rs.getString("delivery_mode").equals("Pick-up"))
                {
                    out.print("Ready to pick");
                    
                    
                }
                else if(rs.getString("booking_status").equals("7")&&  rs.getString("delivery_mode").equals("Pick-up"))
                {
                    out.print("Picked");
                    
                    
                }
                
                %>
                   </td><td><a href="ViewMore.jsp?id=<%=rs.getString("booking_id")%>">View More</a></td>
                </tr>
                <%
            }
            %>
        </table>
         </div>
    </body>
</html>
