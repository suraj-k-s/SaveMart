<%-- 
    Document   : ReportPickup
    Created on : 11 Jul, 2023, 11:48:29 AM
    Author     : densy
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin-Report Pickup</title>
    </head>
    <body><%@include file="Header.jsp" %>
          <div id="tab" align="center">
        <h1 align="center">PICK-UP ORDERS</h1>
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
        <%
        if(request.getParameter("submit")!=null)
        {
            int i=0;
        String sel="select * from tbl_booking b inner join tbl_user u on b.user_id=u.user_id where b.booking_date between '"+request.getParameter("fromdate")+"' and '"+request.getParameter("todate")+"' and delivery_mode='Pick-up'";
        ResultSet rs=con.selectCommand(sel);
        
        %>
        <table align="center" border="1">
            <tr><th>Sl No</th><th>Booking ID</th><th>User Name</th><th>Booking Amount</th><th>Quantity</th></tr>
            <%
        while(rs.next())
        {
            i++;
            %>
            <tr><td><%=i%></td>
               <td><%=rs.getString("booking_id")%></td>
               <td><%=rs.getString("user_name")%></td>
               <td><%=rs.getString("booking_amount")%></td>
               <td><%  
                        int count=0;
                String cart="select COUNT(cart_qty) as sum from tbl_cart c inner join tbl_booking b on b.booking_id=c.booking_id where b.booking_id='"+rs.getString("booking_id")+"' and b.user_id='"+rs.getString("user_id")+"'";
               // out.print(sum);
                ResultSet crs=con.selectCommand(cart);
                if(crs.next())
                 {
                     count=crs.getInt("sum");
                %>
               
                  <%=count%>
                  <%  } %></td>
                
            <%
        }
        %>
        </table>
        <%
        }
        %></div>
    </body>
</html>
