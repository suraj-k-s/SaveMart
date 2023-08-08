<%-- 
    Document   : ChangePassword
    Created on : 2 Jun, 2023, 11:07:44 AM
    Author     : densy
--%>
<%@page import="java.sql.ResultSet"  %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User-ChangePassword</title>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <div id="tab" align="center">
        <%
        if(request.getParameter("submit")!=null)
        {
            String sel="select * from tbl_user where user_id='"+session.getAttribute("Uid")+"'";
            ResultSet rs=con.selectCommand(sel);
            if(rs.next())
            {
            if(rs.getString("user_password").equals(request.getParameter("curpass")))
            {
                if(request.getParameter("newpass").equals(request.getParameter("conpass")))
                {
                    String up="update tbl_user set user_password='"+request.getParameter("newpass")+"' where user_id='"+session.getAttribute("Uid")+"'";
                    con.executeCommand(up);                   
                        %>
                        <script>
                            alert("Changed Successfully");
                            window.location="../Guest/Login.jsp";
                        </script>
                        <%
                    
                }
                else{
                    %>
                    <script>alert("Password doesn't match");</script>
                    <%
                }
            }
            else{
               %>
                    <script>alert("Current Password Wrong");</script>
                    <% 
            }
            
        }
        } 
        %>
        <h1 align="center">CHANGE PASSWORD</h1>
        <form method="post">
            <table align="center">
                <tr><td>Current Password</td><td><input type="password" name="curpass"></td></tr>
                <tr><td>New Password</td><td><input type="password" name="newpass"></td></tr>
                <tr><td>Confirm Password</td><td><input type="password" name="conpass"></td></tr>
                <tr><td colspan="2" align="center"><input type="submit" name="submit" value="SAVE">
                    <input type="reset" name="cancel" value="CANCEL"></td></tr>
                
                
            </table>
        </form>
    </body></div>
    <%@include file="Footer.jsp" %>
</html>
