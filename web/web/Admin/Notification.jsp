<%-- 
    Document   : Notification
    Created on : 20 Jul, 2023, 12:31:06 PM
    Author     : densy
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin-Notification</title>
    </head>
    <body>
        <h2>Notification Form</h2>
    <form method="post" action="">
        <label for="title">Title:</label>
        <input type="text" name="title" id="title" required><br>
        <label for="message">Message:</label>
        <textarea name="message" id="message" rows="4" cols="50" required></textarea><br>
        <input type="submit" value="Submit">
    </form>
        <%
        String title = request.getParameter("title");
      String message = request.getParameter("message");
      
      String in = "INSERT INTO notifications (title, message) VALUES ('"+title+"', '"+message+"')";
      if(con.executeCommand(in))
      {%>
          <script>
                    alert("Notification inserted");
                    window.location="Notification.jsp";
                </script>
                <%
      }
        %>
    </body>
</html>
