<%-- 
    Document   : SubCategory
    Created on : 1 Jun, 2023, 10:46:20 AM
    Author     : densy
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin-SubCategory</title>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <div id="tab" align="center">
            <%
                String sid = "", stype = "", cid = "";
                if (request.getParameter("eid") != null) {
                    String sel2 = "select * from tbl_subcategory where subcategory_id='" + request.getParameter("eid") + "'";
                    ResultSet rs2 = con.selectCommand(sel2);
                    if (rs2.next()) {
                        sid = rs2.getString("subcategory_id");
                        stype = rs2.getString("subcategory_type");
                        cid = rs2.getString("category_id");

                    }
                }
                if (request.getParameter("submit") != null) {
                    if (request.getParameter("txt_hid").equals("")) {
                        String ins = "insert into tbl_subcategory(subcategory_type,category_id) values('" + request.getParameter("subcat") + "','" + request.getParameter("category") + "')";
                        if (con.executeCommand(ins)) {
            %>
            <script>
                alert("Data Inserted");
                window.location("SubCategory.jsp");
            </script>
            <%
                        }
                    } else {
                        String up = "update tbl_subcategory set subcategory_type='" + request.getParameter("subcat") + "',category_id='" + request.getParameter("category") + "' where subcategory_id='" + request.getParameter("txt_hid") + "'";
                        con.executeCommand(up);
                        response.sendRedirect("SubCategory.jsp");
                    }
                }
                if (request.getParameter("did") != null) {
                    String del = "delete from tbl_subcategory where subcategory_id=('" + request.getParameter("did") + "')";
                    con.executeCommand(del);
                    response.sendRedirect("SubCategory.jsp");
                }

            %>
            <h1 align="center"><u>SUB-CATEGORY</u></h1><br><br>
            <center>
                <form method="post">
                    <table align="center">
                        <tr><td>CATEGORY TYPE</td>
                            <td><select name="category">
                                    <option value="">--Select--</option>
                                    <%                                String sel = "select * from tbl_category";
                                        ResultSet rs = con.selectCommand(sel);
                                        while (rs.next()) {
                                    %>
                                            <option value="<%=rs.getString("category_id")%>"<% if (cid.equals(rs.getString("category_id"))) {
                                        out.print("selected");
                                    }%>><%=rs.getString("category_type")%></option>
                                    <%
                                        }
                                    %>
                                </select></td></tr>
                        <tr><td>SUB-CATEGORY TYPE</td>
                            <td><input type="text" name="subcat" value="<%=stype%>"></td>
                            <td><input type="hidden" name="txt_hid" value="<%=sid%>"></td></tr><tr></tr>
                        <tr><td colspan="2" align="center"><input type="submit" name="submit" value="SUBMIT">
                                <input type="reset" name="cancel" value="CANCEL"></td></tr>
                    </table><br><br>
                </form><br>
                <table border="1" align="center">
                    <tr><th>Sl No.</th><th>Category</th><th>Sub-Category</th><th>Action</th></tr>
                            <%
                                int i = 0;
                                String sel1 = "select * from tbl_category c inner join tbl_subcategory s on c.category_id=s.category_id";
                                ResultSet rs1 = con.selectCommand(sel1);
                                while (rs1.next()) {
                                    i++;
                            %>
                    <tr><td><%=i%></td>
                        <td><%=rs1.getString("category_type")%></td>
                        <td><%=rs1.getString("subcategory_type")%></td>
                        <td><a href="SubCategory.jsp?eid=<%=rs1.getString("subcategory_id")%>">UPDATE</a>
                            <a href="SubCategory.jsp?did=<%=rs1.getString("subcategory_id")%>">DELETE</a></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </center></div>
    </body>
</html>
