<%-- 
    Document   : ReportAll
    Created on : 11 Jul, 2023, 11:29:36 AM
    Author     : densy
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin-Report All Orders</title>
    </head>
    <body><center><%@include file="Header.jsp" %>
          <div id="tab" align="center">
        <h1 align="center">ALL ORDERS</h1>
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
        {     %>    
            <br><br>From Date :<%=request.getParameter("fromdate")%>
            To Date :<%=request.getParameter("todate")%><br><br>
            <%
            int i=0;
            String sel="select * from tbl_booking b inner join tbl_user u on b.user_id=u.user_id where b.booking_date between '"+request.getParameter("fromdate")+"' and '"+request.getParameter("todate")+"'";
            ResultSet rs=con.selectCommand(sel);
            
            int ctb=0;
            String countb="select COUNT(booking_id) as sum from tbl_booking where booking_date between '"+request.getParameter("fromdate")+"' and '"+request.getParameter("todate")+"' ";
            ResultSet cb=con.selectCommand(countb);
            if(cb.next())
            {
                ctb=cb.getInt("sum");
                out.print("Number of bookings placed :");
            %>
            <%=ctb%>
            <%  
            }
            %>
        
        <br><br><table align="center" border="1">
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
        %>
          </div>
    </center> 
    </body>
</html>
