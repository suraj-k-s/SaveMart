<%-- 
    Document   : ViewUsers
    Created on : 17 Jun, 2023, 2:01:25 PM
    Author     : densy
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin-View Users</title>
    </head>
    <body> <%@include file="Header.jsp" %><div id="tab" align="center">
            <h1><u>USERS LIST</u></h1><br>
        <form method="post">
            
            <table align="center" border="1">
                <tr>
                    <th>Sl No.</th><th>User Name</th><th>User Email</th><th>Contact</th>
                </tr>
                <tr>
                    <%
                    int i=0;
                    String sel="select * from tbl_user";
                    ResultSet rs=con.selectCommand(sel);
                    while(rs.next())
                    {
                        i++;
                        %>
                        <td><%=i%></td>
                       
                        <td><%=rs.getString("user_name")%></td>
                        <td><%=rs.getString("user_email")%></td>
                        <td><%=rs.getString("user_contact")%></td>
                        </tr>
                        <%
                    }
                    %>
              </table>
        </form>
    </body>
</html>
