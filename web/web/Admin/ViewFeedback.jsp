<%-- 
    Document   : ViewComplaint
    Created on : 2 Jun, 2023, 2:48:10 PM
    Author     : densy
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin-ViewFeedback</title>
    </head>
    <body>
        <%@include file="Header.jsp" %><div id="tab" align="center">
            <h1 align="center"><u>FEEDBACK</u></h1><br><br>
    <center>
        <form method="post">
            
            <table align="center" border="1">
                <tr>
                    <th>Sl No.</th><th>Feedback</th><th>Date</th><th>Username</th>
                </tr>
                <tr>
                    <%
                    int i=0;
                    String sel="select * from tbl_feedback f inner join tbl_user u on f.user_id=u.user_id";
                    ResultSet rs=con.selectCommand(sel);
                    while(rs.next())
                    {
                        i++;
                        %>
                        <td><%=i%></td>
                       
                        <td><%=rs.getString("feedback_content")%></td>
                        <td><%=rs.getString("feedback_date")%></td>
                        <td><%=rs.getString("user_name")%></td>
                </tr>
                        <%
                    }
                    session.setAttribute("Cid", "complaint_id");
                    %>
                
            </table>
        </form>
    </center></div>
    </body>
</html>
