<%@page  import="java.sql.ResultSet"  %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>



<option>--Sub Category--</option>

<%
String sel="select * from tbl_subcategory where category_id='"+request.getParameter("sid") +"'";
ResultSet rs=con.selectCommand(sel);
while(rs.next())
{
    %>
    <option value="<%=rs.getString("subcategory_id")%>"><%=rs.getString("subcategory_type")%></option>
    <%
}
%>
