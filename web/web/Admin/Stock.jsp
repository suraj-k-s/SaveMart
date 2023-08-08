<%-- 
    Document   : Stock
    Created on : 1 Jun, 2023, 2:59:17 PM
    Author     : densy
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin-Stock</title>
        
    </head>
    <body>
         <%@include file="Header.jsp" %>
          <div id="tab" align="center">
              <%            
            String sid="",scount="";
            if(request.getParameter("submit")!=null)
            {
                if(request.getParameter("txt_hid").equals(""))
                {
            String ins="insert into tbl_stock(stock_count,item_id) values('"+request.getParameter("count")+"','"+request.getParameter("eid")+"')";
            if(con.executeCommand(ins))
            {
            %>
            <script>
                alert("Stock Updated");
                window.location("Item.jsp");
            </script>
            <%
            }
                }
                else
                {
                String up="update tbl_stock set stock_count=stock_count+'"+request.getParameter("count")+"' where stock_id='"+request.getParameter("txt_hid")+"'";
                con.executeCommand(up);
               %>
               <script>
                   alert("updated");
                   window.location="Stock.jsp?eid=<%=request.getParameter("eid")%>";
                                    
               </script>
               <%
                }
            }
               
            if(request.getParameter("eid")!=null)
            {
            String sel="select * from tbl_stock where stock_id='"+request.getParameter("sid")+"'";
            ResultSet rss=con.selectCommand(sel);
            if(rss.next())
            {
                sid=rss.getString("stock_id");
                scount=rss.getString("stock_count");                
            }
            }            
        %>
              <h1>STOCK UPDATE</h1><br>
           <form method="post">
            <table align="center">
                <tr><td>STOCK COUNT </td>
                    
                    <td><input type="number" min="0" name="count" autocomplete="off" ></td>
                    <td><input type="hidden" name="txt_hid" value="<%=sid%>"></td></tr><tr></tr>
                <tr><td colspan="2" align="center">
                        <input type="submit" name="submit" value="UPDATE">
                        <input type="reset" name="cancel" value="RESET"
                </td></tr>
            </table>
           </form>
            <table border="1" align="center">
                <tr><th>Name</th><th>Details</th><th>Price</th><th>Image</th><th>Stock</th><th>Action</th></tr>
            <%
            session.getAttribute("eid");
            String sel="select * from tbl_item i inner join tbl_stock s on i.item_id=s.item_id where s.item_id='"+ request.getParameter("eid")+"'";
            ResultSet re=con.selectCommand(sel);
            while(re.next())
            {
                %>               
                    <td><%=re.getString("item_name")%></td>
                    <td><%=re.getString("item_details")%></td>
                    <td><%=re.getString("item_price")%></td>
                    <td><img src="../Assets/Files/Items/<%=re.getString("item_image")%>" width="150" height="150"></td>
                    <td><%=re.getString("stock_count")%></td>                      
                    <td><a href="Stock.jsp?sid=<%=re.getString("stock_id")%>&eid=<%=request.getParameter("eid")%>">UPDATE</a>
                   
                </tr>
                <%
            }
            %>
            </table></div>
    </body>
</html>
