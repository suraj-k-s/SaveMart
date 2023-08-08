<%@page import="org.json.JSONObject" %> 
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    int count=0;
    String msg="";
    String id = request.getParameter("id");
    String selQry = "select count(*) as count from tbl_booking where user_id='" + session.getAttribute("Uid") + "' and booking_status='0'";
    ResultSet rsC = con.selectCommand(selQry);
    rsC.next();
    if (Integer.parseInt(rsC.getString("count")) > 0) {
        String sel = "select booking_id as id from tbl_booking where user_id='" + session.getAttribute("Uid") + "' and booking_status='0'";
        ResultSet rs = con.selectCommand(sel);
        if (rs.next()) {
            String sqlQry = "select count(*) as count from tbl_cart where booking_id='" + rs.getString("id") + "' and item_id='" + id + "'";
            ResultSet rsc = con.selectCommand(sqlQry);
            rsc.next();
            if (Integer.parseInt(rsc.getString("count")) > 0) {
               //out.println("Already Added to Cart");
                msg="Already Added to Cart";
            } else {
                String insQry = "insert into tbl_cart(booking_id,item_id)values('" + rs.getString("id") + "','" + id + "')";
                if (con.executeCommand(insQry)) {
                    msg="Added to Cart";
                  //  out.println("Added to Cart");
                    
                } else {
                   msg="Failed to Add Cart";
                   // out.println("Failed to Add Cart");
                }
            }
        }
    } else {
        String ins = "insert into tbl_booking(user_id,booking_date)values('" + session.getAttribute("Uid") + "',curdate())";
        if (con.executeCommand(ins)) {
            String sel = "select Max(booking_id) as id from tbl_booking";
            ResultSet rs = con.selectCommand(sel);
            if (rs.next()) {
                String insQry = "insert into tbl_cart(booking_id,item_id)values('" + rs.getString("id") + "','" + id + "')";
                if (con.executeCommand(insQry)) {
                    msg="Added to Cart";
                    //out.println("Added to Cart");
                   %>
                  
                   <%
                   
                } else {
                    msg="Failed to Add Cart";
                    //out.println("Failed to Add Cart");
                }
            }
        }
    }
     String cart="select COUNT(cart_id) as sum from tbl_cart c inner join tbl_booking b on b.booking_id=c.booking_id where c.cart_status='0'  and b.user_id='"+session.getAttribute("Uid")+"'";
               // out.print(cart);
                ResultSet crs=con.selectCommand(cart);
                crs.next();
                count=crs.getInt("sum");
                
                JSONObject responses= new JSONObject();
                responses.put("count",count);
                responses.put("msg",msg);
                response.setContentType("application/json");
                response.getWriter().write(responses.toString());
                 

%> 