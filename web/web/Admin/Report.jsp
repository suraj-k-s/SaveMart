<%-- 
    Document   : Report
    Created on : 13 Jul, 2023, 3:17:35 PM
    Author     : densy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin-Reports</title>
    </head>
    <body><center><%@include file="Header.jsp" %>
          <div id="tab" align="center">
              <br><br><h3><b><u>Choose the report to see</u></b></h3><br><br>
        <a href="ReportAll.jsp">All Reports</a>&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="ReportDelivery.jsp">Home Delivery Reports</a>&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="ReportPickup.jsp">Pick-up Reports</a>&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="ReportItems.jsp">Item Sold Report</a>&nbsp;&nbsp;&nbsp;&nbsp;
        <br><br><br><br>
        <a href="PieAll.jsp">Category Report-Pie</a>&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="ChartReport.jsp">Category Report-Chart</a>&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="DonutReport.jsp">Category Report-Donut</a>&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
    </center>
    </body>
</html>
