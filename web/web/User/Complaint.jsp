<%-- 
    Document   : Complaint
    Created on : 2 Jun, 2023, 1:40:31 PM
    Author     : densy
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User-Complaint</title>
    </head>
    <body>
        <%@include file="Header.jsp" %>
         <div id="tab" align="center">
        <%
            String cid="",ctitle="",ccon="";
            if(request.getParameter("eid")!=null)
            {
                String sel2="select * from tbl_complaint where complaint_id='"+request.getParameter("eid")+"'";
                ResultSet rs2=con.selectCommand(sel2);
                if(rs2.next())
                {
                    cid=rs2.getString("complaint_id");
                    ctitle=rs2.getString("complaint_title");
                    ccon=rs2.getString("complaint_content");
                    
                    
                }
            }
        if(request.getParameter("submit")!=null)
        {
            if(request.getParameter("txt_hid").equals(""))
            {
            String ins="insert into tbl_complaint(complaint_title,complaint_content,complaint_date,user_id)values('"+request.getParameter("title")+"','"+request.getParameter("content")+"',curdate(),'"+session.getAttribute("Uid")+"')";
            if(con.executeCommand(ins))
            {
                %>
                <script>alert("Complaint registered");
                window.location="Complaint.jsp"</script>
                <%
            }
        }
            else{
              String up="update tbl_complaint set complaint_title='"+request.getParameter("title")+"',complaint_content='"+request.getParameter("content")+"' where complaint_id='"+request.getParameter("txt_hid")+"'";
              con.executeCommand(up);
              response.sendRedirect("Complaint.jsp");  
            }
        }
        if(request.getParameter("did")!=null)
        {
            String del="delete from tbl_complaint where complaint_id=('"+request.getParameter("did")+"')";
            con.executeCommand(del);
            response.sendRedirect("Complaint.jsp");
        }
        %>
        <h1 align="center">COMPLAINT</h1>
        <form method="post">
            <table align="center">
                <tr><td>TITLE</td><td><input type="text" name="title" value="<%=ctitle%>"></td>
                    <td><input type="hidden" name="txt_hid" value="<%=cid%>"></td></tr>
                <tr><td>COMPLAINT</td><td><textarea name="content"><%=ccon%></textarea></td></tr>
                        <tr><td colspan="2" align="center">
                                <input type="submit" name="submit" value="SUBMIT">
                                <input type="reset" name="cancel" value="CANCEL">
                    </td></tr>
            </table>
        </form>
        <table border="1" align="center">
            <tr><th>Sl No.</th><th>Title</th><th>Complaint</th><th>Date</th><th>Reply Status</th><th>Action</th></tr>
            <%
            int i=0;
            String sel="select * from tbl_complaint c inner join tbl_user u on c.user_id=u.user_id where c.user_id='"+session.getAttribute("Uid")+"'";
            ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
                i++;
                %>
                <tr><td><%=i%></td>
                    <td><%=rs.getString("complaint_title")%></td>
                    <td><%=rs.getString("complaint_content")%></td>
                    <td><%=rs.getString("complaint_date")%></td>
                    <td><%=rs.getString("complaint_reply")%></td>
                    <td><a href="Complaint.jsp?eid=<%=rs.getString("complaint_id")%>">UPDATE</a>
                    <a href="Complaint.jsp?did=<%=rs.getString("complaint_id")%>">DELETE</a></td>
                </tr>
                <%
            }
            
            %>
        </table></div>
            <%@include file="Footer.jsp" %>
    </body>
</html>
