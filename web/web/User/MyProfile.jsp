<%-- 
    Document   : MyProfile
    Created on : 2 Jun, 2023, 10:43:50 AM
    Author     : densy
--%>
<%@page import="java.sql.ResultSet"  %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User-MyProfile</title>
    </head>
    <body>
         <%@include file="Header.jsp" %>
         <div id="tab" align="center">
        <h2 align="center">MY PROFILE</h2>
        
        <%
          session.getAttribute("Uid");
          String sel="select user_name,user_contact,user_email from tbl_user where user_id='"+session.getAttribute("Uid")+"'";
          ResultSet rs=con.selectCommand(sel);
          %>
          <table align="center">
          <% 
          while(rs.next())
          {
              %>
             
              <tr><td><b>NAME</b></td><td><%=rs.getString("user_name")%></td></tr>
              <tr><td><b>CONTACT</b></td><td><%=rs.getString("user_contact")%></td></tr>
              <tr><td><b>EMAIL</b></td><td><%=rs.getString("user_email")%></td></tr>
              <tr><td><a href="EditProfile.jsp">EDIT PROFILE</a></td>
                  <td><a href="ChangePassword.jsp">CHANGE PASSWORD</a></td>
              </tr> 
              <%
          }  
          %>
          </table>
          
          
        
        
         </div>
    </body>
    <%@include file="Footer.jsp" %>
</html>
