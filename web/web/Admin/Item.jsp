<%-- 
    Document   : Item
    Created on : 1 Jun, 2023, 12:26:24 PM
    Author     : densy
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin-Item</title>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/qrcode.js"></script>
        <script type="text/javascript" src="js/qrReader.js"></script>
        <script src="../Assets/JQuery/jQuery.js"></script>
        <script>
            function genarate(id) {
                var array =
                        '{ "id" : "' +
                        id +
                        '"  }';
                var qrcode = new QRCode(document.getElementById("code" + id), {
                    text: array,
                    width: 128,
                    height: 128,
                    colorDark: "#5868bf",
                    colorLight: "#ffffff",
                    correctLevel: QRCode.CorrectLevel.H,
                });
            }
        </script>

    </head>
    <body>
        <%@include file="Header.jsp" %>
        <div id="tab" align="center">
            <%
                if (request.getParameter("did") != null) {
                    String del = "delete from tbl_item where item_id=('" + request.getParameter("did") + "')";
                    con.executeCommand(del);
                    response.sendRedirect("Item.jsp");
                }
            %>
            <h1 align="center"><u>ITEM DETAILS</u></h1><br><br>
            <center>
                <form method="post" action="../Assets/ActionPages/ItemAction.jsp" enctype="multipart/form-data">
                    <table align="center">
                        <tr><td>CATEGORY</td><td>
                                <select name="category" onchange="getSubCategory(this.value)">
                                    <option value="">--Category--</option>
                                    <%
                                        String sel = "select * from tbl_category";
                                        ResultSet rs = con.selectCommand(sel);
                                        while (rs.next()) {
                                    %>
                                    <option value="<%=rs.getString("category_id")%>"><%=rs.getString("category_type")%></option>
                                    <%
                                        }
                                    %>
                                </select></td></tr>
                        <tr><td>SUB-CATEGORY</td><td>
                                <select name="subcategory"id="subcategory">
                                    <option value="">--SubCategory--</option>
                                    <%
                                        String sel2 = "select * from tbl_subcategory";
                                        ResultSet rs2 = con.selectCommand(sel2);
                                        while (rs2.next()) {
                                    %>
                                    <option value="<%=rs2.getString("subcategory_id")%>"><%=rs2.getString("subcategory_type")%></option>
                                    <%
                                        }
                                    %>
                                </select></td></tr>
                        <tr><td>ITEM NAME</td><td><input type="text" name="iname"></td></tr>
                        <tr><td>ITEM DETAILS</td><td><textarea name="idetails"></textarea></td></tr>
                        <tr><td>ITEM PRICE</td><td><input type="text" name="iprice"></td></tr>
                        <tr><td>ITEM IMAGE</td><td><input type="file" name="file_photo"></td></tr>
                        <tr><td>ITEM RACK NUMBER</td><td><input type="text" name="irackno"></td></tr>
                        <tr><td colspan="2" align="center"><input type="submit" name="submit" value="SUBMIT">
                                <input type="reset" name="cancel" value="CANCEL"></td></tr>
                    </table><br><br>
                </form>
                <table border="1" align="center">
                    <tr><th>Sl No</th><th>Category</th><th>Sub-Category</th><th>Name</th><th>Details</th><th>Price</th><th>Image</th><th>Rack Number</th><th>QR</th><th>Action</th></tr>
                            <%
                                int i = 0;
                                String selQry = "select * from tbl_item i inner join tbl_subcategory s on i.subcategory_id=s.subcategory_id inner join tbl_category c on s.category_id=c.category_id";
                                ResultSet re = con.selectCommand(selQry);
                                while (re.next()) {
                                    i++;
                            %>
                    <tr><td><%=i%></td>
                        <td><%=re.getString("category_type")%></td>
                        <td><%=re.getString("subcategory_type")%></td>
                        <td><%=re.getString("item_name")%></td>
                        <td><%=re.getString("item_details")%></td>
                        <td><%=re.getString("item_price")%></td>
                        <td><img src="../Assets/Files/Items/<%=re.getString("item_image")%>" width="150" height="150"></td>
                        <td><%=re.getString("item_rackno")%></td>
                        <td id="code<%=re.getString("item_id")%>"><script>genarate(<%=re.getString("item_id")%>)</script></td>
                        <td><a href="Stock.jsp?eid=<%=re.getString("item_id")%>">STOCK</a>
                            <a href="Item.jsp?did=<%=re.getString("item_id")%>">DELETE</a></td>
                            <%
                                session.setAttribute("eid", re.getString("item_id"));
                            %>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </center></div>
    </body>
</html>

<script>
    function getSubCategory(cid)
    {
        $.ajax({url: "../Assets/AjaxPages/AjaxSubCategory.jsp?sid=" + cid,
            success: function(result) {
                $("#subcategory").html(result);
            }
        })
    }

</script>

