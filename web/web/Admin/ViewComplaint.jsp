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
        <title>Admin-ViewComplaint</title>
    </head>
    <body>
        <%@include file="Header.jsp" %><div id="tab" align="center">
            <h1 align="center"><u>COMPLAINTS</u></h1><br>
    <center>
        <form method="post">
            <h3 align="right"><a href="RepliedComplaint.jsp">REPLIED COMPLAINTS</a></h3>
            <table align="center" border="1">
                <tr>
                    <th>Sl No.</th><th>Title</th><th>Complaint</th><th>Date</th><th>Username</th><th>Status</th><th>Action</th>
                </tr>
                <tr>
                    <%
                    int i=0;
                    String sel="select * from tbl_complaint c inner join tbl_user u on c.user_id=u.user_id";
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
                        <td><%if(rs.getString("complaint_status").equals("1"))
                        {
                            out.print("Replied");
                        }
                        else
                        {
                            out.print("Not Replied");
                        }%></td>
                        <td><a href="Reply.jsp?eid=<%=rs.getString("complaint_id")%>">REPLY</a></td></tr>

                        <%
                    }
                    session.setAttribute("Cid", "complaint_id");
                    %>
            </table>
        </form>
    </center></div>
    </body>
</html>
