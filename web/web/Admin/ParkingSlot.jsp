<%-- 
    Document   : ParkingSlot
    Created on : 7 Jun, 2023, 2:41:46 PM
    Author     : densy
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin-ParkingSlot</title>
    </head>
    <body><%@include file="Header.jsp" %><div id="tab" align="center">
        <%
        if(request.getParameter("submit")!=null)    
        {
            String up="update tbl_booking set pickup_parkingslot='"+request.getParameter("parkingslot")+"' where booking_id='"+request.getParameter("eid")+"'";
      // out.print(up);
            con.executeCommand(up);
            String selb="select * from tbl_booking where booking_id='"+request.getParameter("eid")+"'";
             ResultSet rsb=con.selectCommand(selb);
             if(rsb.next())
                        {
            String ins="insert into tbl_notification(`notification_date`,`notification_title`,`notification_content`,`user_id`,`booking_id`)values(curdate(),'Parking Slot Details','"+request.getParameter("parkingslot")+" will be the parking slot"+"','"+rsb.getString("user_id")+"','"+rsb.getString("booking_id")+"')";
           System.out.print(ins);
            con.executeCommand(ins);
                        }
        %>
        <script>alert("Success!");</script>
            
        <%
       response.sendRedirect("ViewBookings.jsp");
        }
        
        %>
        <h1 align='center'>Parking Slot</h1>
        <form method='post'>
            <table align="center">
                <tr><td> Parking Slot: </td> <td><input type="text" name="parkingslot" ></td></tr>
                <tr><td colspan="2" align="center"><input type="submit" name="submit" value="SAVE">
                    <input type="reset" name="cancel" value="CANCEL"></td></tr>
            </table>
        </form>
    </body>
         </div>
</html>
