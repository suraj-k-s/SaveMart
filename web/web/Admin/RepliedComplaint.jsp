<%-- 
    Document   : RepliedComplaint
    Created on : 2 Jun, 2023, 11:20:46 PM
    Author     : densy
--%>
<%@page import="java.sql.ResultSet"  %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin-RepliedComplaint</title>
    </head>
    <body>
        <%@include file="Header.jsp" %><div id="tab" align="center">
        <h1 align="center">REPLIED COMPLAINTS</h1><br>
    <center>
        <form method="post">             
            <table align="center" border="1">
                <tr><th>Sl No.</th><th>Title</th><th>Complaint</th><th>Date</th><th>Username</th><th>Reply</th></tr>
                <tr>
                    <%
                        int i=0;
                    String sel="select * from tbl_complaint c inner join tbl_user u on c.user_id=u.user_id where complaint_status=1";
                    ResultSet rs=con.selectCommand(sel);
                    while(rs.next())
                    {
                        i++;
                        %>
                        <td><%=i%></td>
                        <td><%=rs.getString("complaint_title")%></td>
                        <td><%=rs.getString("complaint_content")%></td>
                        <td><%=rs.getString("complaint_date")%></td>
                        <td><%=rs.getString("user_name")%></td>
                        <td><%=rs.getString("complaint_reply")%></td></tr>
                        <%
                    }
                    
                    %>
                
            </table>
        </form>
    </center></div>
    </body>
</html>
