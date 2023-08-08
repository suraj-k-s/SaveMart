<%-- 
    Document   : EditProfile
    Created on : 2 Jun, 2023, 11:02:52 AM
    Author     : densy
--%>
<%@page import="java.sql.ResultSet"  %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User-EditProfile</title>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <div id="tab" align="center">
        <%
        String sel="select * from tbl_user where user_id='"+session.getAttribute("Uid")+"'";
        ResultSet rs=con.selectCommand(sel);
        String uid="",uname="",ucon="",umail="";
        if(rs.next())
        {
            uid=rs.getString("user_id");
            uname=rs.getString("user_name");
            ucon=rs.getString("user_contact");
            umail=rs.getString("user_email");
        }
        if(request.getParameter("submit")!=null)
        {
            String up="update tbl_user set user_name='"+request.getParameter("name")+"',user_contact='"+request.getParameter("contact")+"',user_email='"+request.getParameter("mail")+"' where user_id='"+session.getAttribute("Uid")+"'";
            con.executeCommand(up);            
                %>
                <script>
                    alert("Updated successfully");
                    
                </script>
                <%            
            response.sendRedirect("MyProfile.jsp");
        }
        %>
        <h1 align="center">EDIT PROFILE</h1>
        <form method="post">
            <table align="center">
                <tr><td>NAME</td><td><input type="text" name="name" value="<%=uname%>"></td></tr>
                <tr><td>CONTACT</td><td><input type="text" name="contact" value="<%=ucon%>"></td></tr>
                <tr><td>EMAIL</td><td><input type="email" name="mail" value="<%=umail%>"></td></tr>
                <tr><td colspan="2" align="center"><input type="submit" name="submit" value="SAVE">
                    <input type="reset" name="cancel" value="CANCEL"></td></tr>
            </table>
        </form></div>
                <%@include file="Footer.jsp" %>
    </body>
</html>
