<%@page  import="java.sql.ResultSet"  %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>


<option>--Rack Number--</option>

<%
String selt="select * from tbl_item where item_id='"+request.getParameter("sid") +"'";
ResultSet rst=con.selectCommand(selt);
while(rst.next())
{
    %>
    <option value="<%=rst.getString("item_id")%>"><%=rst.getString("item_rackno")%></option>
    <%
}
%>
