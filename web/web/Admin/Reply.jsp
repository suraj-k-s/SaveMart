<%-- 
    Document   : Reply
    Created on : 2 Jun, 2023, 3:03:57 PM
    Author     : densy
--%>
<%@page import="java.sql.ResultSet"  %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin-Reply</title>
    </head>
    <body>
        <%@include file="Header.jsp" %><div id="tab" align="center">
        <%
            String cid="",crply="";
            if(request.getParameter("eid")!=null)
            {                
                String sel2="select * from tbl_complaint where complaint_id='"+request.getParameter("eid")+"'";
                ResultSet rs2=con.selectCommand(sel2);
                if(rs2.next())
                {
                    cid=rs2.getString("complaint_id");
                    crply=rs2.getString("complaint_reply");
                    
                }
            }
        if(request.getParameter("submit")!=null)
        {            
            String up="update tbl_complaint set complaint_reply='"+request.getParameter("reply")+"',complaint_status=1 where complaint_id='"+request.getParameter("eid")+"'";
            con.executeCommand(up);
            %>
            <script>alert("Replied");
            window.location="ViewComplaint.jsp";</script>
            <%
           // response.sendRedirect("ViewComplaint.jsp"); 
        }
        %>
        <h1 align="center">REPLY</h1>
        <form method="post">
            <table align="center">
                <tr><td>REPLY</td><td><textarea name="reply"></textarea></td>
                <input type="hidden" name="txt_hid" value="<%=cid%>"</tr>
                <tr><td colspan="2" align="center">
                                <input type="submit" name="submit" value="SAVE">
                                <input type="reset" name="cancel" value="CANCEL">
                    </td></tr>
            </table>
        </form>
              </div>
    </body>
</html>
