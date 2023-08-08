<%-- 
    Document   : Category
    Created on : 1 Jun, 2023, 10:04:54 AM
    Author     : densy
--%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin-Category</title>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <div id="tab" align="center">
            <%
                if (request.getParameter("did") != null) {
                    String del = "delete from tbl_category where category_id=('" + request.getParameter("did") + "')";
                    con.executeCommand(del);
                    response.sendRedirect("Category.jsp");
                }
            %>
            <h1 align="center"><u>CATEGORY</u></h1><br><br>
            <center>
                <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/CategoryAction.jsp">
                    <table align="center">
                        <tr>
                            <td>CATEGORY IMAGE</td>
                            <td><input type="file" name="file_category"></td>
                        </tr><tr>
                            <td>CATEGORY TYPE</td>
                            <td><input type="text" name="category"></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <input type="submit" name="submit" value="SUBMIT">
                                <input type="reset" name="cancel" value="CANCEL">
                            </td></tr>
                    </table><br><br>
                </form><br>
                <table border="1"align="center">
                    <tr><th>Sl.No</th><th>Category Type</th><th>Category Image</th><th>Action</th></tr>
                            <%                int i = 0;
                                String sel = "select * from tbl_category";
                                ResultSet rs = con.selectCommand(sel);
                                while (rs.next()) {
                                    i++;
                            %>
                    <tr>
                        <td><%=i%></td>
                        <td><%=rs.getString("category_type")%></td>
                        <td><img src="../Assets/Files/Items/<%=rs.getString("category_image")%>" width="120" height="120"/></td>
                        <td>                    
                            <a href="Category.jsp?did=<%=rs.getString("category_id")%>">DELETE</a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </center></div>
    </body>
</html>
