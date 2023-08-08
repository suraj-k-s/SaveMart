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
        <title>User-Feedback</title>
    </head>
    <body>
         <%@include file="Header.jsp" %>
          <div id="tab" align="center">
        <%
            String fid="",fcon="";
            if(request.getParameter("eid")!=null)
            {
                String sel2="select * from tbl_feedback where feedback_id='"+request.getParameter("eid")+"'";
                ResultSet rs2=con.selectCommand(sel2);
                if(rs2.next())
                {
                    fid=rs2.getString("feedback_id");                  
                    fcon=rs2.getString("feedback_content");
               }
            }
        if(request.getParameter("submit")!=null)
        {
            if(request.getParameter("txt_hid").equals(""))
            {
            String ins="insert into tbl_feedback(feedback_content,feedback_date,user_id)values('"+request.getParameter("content")+"',curdate(),'"+session.getAttribute("Uid")+"')";
            if(con.executeCommand(ins))
            {
                %>
                <script>alert("Feedback given successfully ");
                window.location="Feedback.jsp"</script>
                <%
            }
        }
            else{
              String up="update tbl_feedback set feedback_content='"+request.getParameter("content")+"' where feedback_id='"+request.getParameter("txt_hid")+"'";
              con.executeCommand(up);
              response.sendRedirect("Feedback.jsp");  
            }
        }
        if(request.getParameter("did")!=null)
        {
            String del="delete from tbl_feedback where feedback_id=('"+request.getParameter("did")+"')";
            con.executeCommand(del);
            response.sendRedirect("Feedback.jsp");
        }
        %>
        <h1 align="center">FEEDBACK</h1>
        <form method="post">
            <table align="center">
                <tr><td>FEEDBACK</td><td><textarea name="content"><%=fcon%></textarea></td>
                    <td><input type="hidden" name="txt_hid" value="<%=fid%>"></td></tr>
                
                        <tr><td colspan="2" align="center">
                                <input type="submit" name="submit" value="SUBMIT">
                                <input type="reset" name="cancel" value="CANCEL">
                    </td></tr>
            </table>
        </form>
        <table border="1" align="center">
            <tr><th>Sl No.</th><th>Complaint</th><th>Date</th><th>Action</th></tr>
            <%
            int i=0;
            String sel="select * from tbl_feedback f inner join tbl_user u on f.user_id=u.user_id";
            ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
                i++;
                %>
                <tr><td><%=i%></td>
                    
                    <td><%=rs.getString("feedback_content")%></td>
                    <td><%=rs.getString("feedback_date")%></td>
                    
                    <td><a href="Feedback.jsp?eid=<%=rs.getString("feedback_id")%>">UPDATE</a>
                    <a href=Feedback.jsp?did=<%=rs.getString("feedback_id")%>">DELETE</a></td>
                </tr>
                <%
            }
            
            %>
        </table></div>
            <%@include file="Footer.jsp" %>
    </body>
</html>
