/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author densy
 */
@WebService(serviceName = "NewWebService")
public class NewWebService {

    ConnectionClass con = new ConnectionClass();

    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello " + txt + " !";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "login")
    public String login(@WebParam(name = "email") String email, @WebParam(name = "password") String password) {
        String sel = "select * from tbl_user where user_email='" + email + "' and user_password='" + password + "'";
        ResultSet rs = con.selectCommand(sel);
        System.out.println(sel);
        JSONArray j = new JSONArray();

        try {
            if (rs.next()) {
                JSONObject jo = new JSONObject();

                try {
                    jo.put("id", rs.getString("user_id"));
                    jo.put("name", rs.getString("user_name"));
                    j.put(jo);
                } catch (JSONException ex) {
                    Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        //TODO write your implementation code here:
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "myprofile")
    public String myprofile(@WebParam(name = "id") String id) {
        String select = "select * from tbl_user where user_id='" + id + "'";
        ResultSet rs = con.selectCommand(select);
        JSONArray j = new JSONArray();
        try {
            if (rs.next()) {
                JSONObject jo = new JSONObject();
                try {
                    jo.put("name", rs.getString("user_name"));
                    jo.put("email", rs.getString("user_email"));
                    jo.put("phone", rs.getString("user_contact"));

                    j.put(jo);
                } catch (JSONException ex) {
                    Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "editprofile")
    public String editprofile(@WebParam(name = "id") String id, @WebParam(name = "name") String name, @WebParam(name = "email") String email, @WebParam(name = "phone") String phone) {
        //TODO write your implementation code here:
        String s = "";
        String up = "update tbl_user set user_name='" + name + "',user_email='" + email + "',user_contact='" + phone + "' where user_id='" + id + "'";
        System.out.println(up);
        boolean b = con.executeCommand(up);
        if (b == true) {
            s = "Success";
        } else {
            s = "Fail";
        }
        return s;

    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "getitems")
    public String getitems(@WebParam(name = "catid") String catid) {
        //TODO write your implementation code here:

        String sel = "select * from tbl_item i inner join tbl_subcategory s on s.subcategory_id=i.subcategory_id inner join tbl_category c on c.category_id=s.category_id where s.category_id='" + catid + "' ";
        System.out.println(sel);
        ResultSet rs = con.selectCommand(sel);
        JSONArray J = new JSONArray();
        try {
            while (rs.next()) {

                JSONObject a = new JSONObject();
                try {
                    a.put("itemid", rs.getString("item_id"));
                    a.put("itemname", rs.getString("item_name"));
                    a.put("itemimg", rs.getString("item_image"));
                    a.put("itemamnt", rs.getString("item_price"));

                    J.put(a);
                } catch (JSONException ex) {
                    Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return J.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "CategoryData")
    public String category(@WebParam(name = "ip") String ip) {

        String select = "select * from tbl_category";
        ResultSet rs = con.selectCommand(select);
        System.out.println(select);
        JSONArray j = new JSONArray();
        try {
            while (rs.next()) {
                JSONObject jo = new JSONObject();
                try {
                    jo.put("id", rs.getString("category_id"));
                    jo.put("name", rs.getString("category_type"));
                    jo.put("image", "http://" + ip + ":8084/SaveMart/Assets/Files/Items/" + rs.getString("category_image"));

                    j.put(jo);
                } catch (JSONException ex) {
                    Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return j.toString();
        //TODO write your implementation code here:
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "registration")
    public String registration(@WebParam(name = "name") String name, @WebParam(name = "phone") String phone, @WebParam(name = "email") String email, @WebParam(name = "password") String password) {
        //TODO write your implementation code here:
        String ins = "insert into tbl_user(user_name,user_email,user_contact,user_password) values('" + name + "','" + email + "','" + phone + "','" + password + "')";
        String flag = "0";
        boolean status = con.executeCommand(ins);
        if (status == true) {
            flag = "1";
        } else {
            flag = "2";
        }
        return flag;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "scan")
    public String scan(@WebParam(name = "itemid") String itemid, @WebParam(name = "ip") String ip) {

        String sel = "select * from tbl_item where item_id='" + itemid + "'";
        System.out.println(sel);
        ResultSet rs = con.selectCommand(sel);
        JSONArray J = new JSONArray();
        try {
            while (rs.next()) {

                JSONObject a = new JSONObject();
                try {
                    a.put("itemname", rs.getString("item_name"));
                    a.put("itemimg", "http://" + ip + ":8084/SaveMart/Assets/Files/Items/" + rs.getString("item_image"));
                    a.put("itemamnt", rs.getString("item_price"));
                    J.put(a);
                } catch (JSONException ex) {
                    Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return J.toString();
        //TODO write your implementation code here:

    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "cart")
    public String cart(@WebParam(name = "itemid") String itemid, @WebParam(name = "userid") String userid) {
        //TODO write your implementation code here:
        // String id = request.getParameter("id");
        String a = "";
        String selQry = "select count(*) as count from tbl_booking where user_id='" + userid + "' and booking_status='0'";
        System.out.println(selQry);
        ResultSet rsC = con.selectCommand(selQry);
        try {
            rsC.next();
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            if (Integer.parseInt(rsC.getString("count")) > 0) {
                String sel = "select booking_id as id from tbl_booking where user_id='" + userid + "' and booking_status='0'";
                ResultSet rs = con.selectCommand(sel);
                if (rs.next()) {
                    String sqlQry = "select count(*) as count from tbl_cart where booking_id='" + rs.getString("id") + "' and item_id='" + itemid + "'";
                    ResultSet rsc = con.selectCommand(sqlQry);
                    rsc.next();
                    if (Integer.parseInt(rsc.getString("count")) > 0) {
                        a = "Already Added to Cart";
                    } else {
                        String insQry = "insert into tbl_cart(booking_id,item_id)values('" + rs.getString("id") + "','" + itemid + "')";
                        if (con.executeCommand(insQry)) {
                            a = "Added to Cart";
                        } else {

                            a = "Failed to Add Cart";
                        }
                    }
                }
            } else {
                String ins = "insert into tbl_booking(user_id,booking_date)values('" + userid + "',curdate())";
                if (con.executeCommand(ins)) {
                    String sel = "select Max(booking_id) as id from tbl_booking";
                    ResultSet rs = con.selectCommand(sel);
                    if (rs.next()) {
                        String insQry = "insert into tbl_cart(booking_id,item_id)values('" + rs.getString("id") + "','" + itemid + "')";
                        if (con.executeCommand(insQry)) {
                            a = "Added to Cart";
                        } else {

                            a = "Failed to Add Cart";
                        }
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "CartItems")
    public String CartItems(@WebParam(name = "userid") String userid, @WebParam(name = "ip") String ip) {
        String sel = "select * from tbl_cart c inner join tbl_item p on p.item_id=c.item_id inner join tbl_booking b on b.booking_id=c.booking_id where b.user_id='" + userid + "' and b.booking_status=0";
        System.out.println(sel);
        ResultSet rs = con.selectCommand(sel);
        JSONArray J = new JSONArray();
        try {
            while (rs.next()) {

                JSONObject a = new JSONObject();
                try {
                    a.put("name", rs.getString("item_name"));
                    a.put("image", "http://" + ip + ":8084/SaveMart/Assets/Files/Items/" + rs.getString("item_image"));
                    a.put("price", rs.getString("item_price"));
                    a.put("id", rs.getString("cart_id"));
                    a.put("qty", rs.getString("cart_qty"));
                    J.put(a);
                } catch (JSONException ex) {
                    Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }

        return J.toString();
        //TODO write your implementation code here:

    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "UpdateQuantity")
    public String UpdateQuantity(@WebParam(name = "qty") String qty, @WebParam(name = "id") String id) {
        String val = "false";

        String upQry = "update tbl_cart set cart_qty = '" + qty + "' where cart_id='" + id + "'";
        if (con.executeCommand(upQry)) {
            val = "true";
        }

        return val;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "DeleteItem")
    public String DeleteItem(@WebParam(name = "id") String id) {
        String val = "false";
        String delQry = "delete from tbl_cart where cart_id='" + id + "'";
        if (con.executeCommand(delQry)) {
            val = "true";
        }

        return val;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "capitalizetext")
    public String capitalizetext(@WebParam(name = "text") String text, @WebParam(name = "ip") String ip) {

        String selProduct = "select * from tbl_item where true";

        if (!text.equals("")) {
            selProduct = selProduct + " and item_name like '%" + text + "%'";

        }

        ResultSet rs = con.selectCommand(selProduct);
        JSONArray J = new JSONArray();
        try {
            while (rs.next()) {
                String Stock = "";
                JSONObject a = new JSONObject();
                try {
                    a.put("name", rs.getString("item_name"));
                    a.put("image", "http://" + ip + ":8084/SaveMart/Assets/Files/Items/" + rs.getString("item_image"));
                    a.put("price", rs.getString("item_price"));
                    a.put("rackno", rs.getString("item_rackno"));
                    String stockSql = "select sum(stock_count) as stock from tbl_stock where item_id = '" + rs.getString("item_id") + "'";
                    ResultSet rsST = con.selectCommand(stockSql);
                    rsST.next();
                    if (rsST.getString("stock") != null) {
                        int stock = Integer.parseInt(rsST.getString("stock"));
                        if (stock > 0) {

                            Stock = "Stock Found";

                        } else if (stock == 0) {
                            Stock = "Out of Stock";

                        }
                    } else {

                        Stock = "Stock Not Found";

                    }

                    a.put("stock", Stock);
                    J.put(a);
                } catch (JSONException ex) {
                    Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return J.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "Checkout")
    public String Checkout(@WebParam(name = "total") String total, @WebParam(name = "id") String id) {
        String bid = "";
        try {

            String select = "select booking_id as id from tbl_booking where booking_status=0 and user_id='" + id + "'";
            ResultSet rs = con.selectCommand(select);
            if (rs.next()) {
                bid = rs.getString("id");

                String upQry = "update tbl_booking set booking_status=1,booking_amount='" + total + "' where booking_id='" + bid + "'";
                if (con.executeCommand(upQry)) {
                    String updQry = "update tbl_cart set cart_status=1 where  booking_id='" + bid + "'";
                    if (con.executeCommand(updQry)) {
                        return bid;
                    }
                }
            }

            return null;
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bid;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "CheckoutPayment")
    public String CheckoutPayment(@WebParam(name = "id") String id) {
        String updQry = "update tbl_booking set payment_status=1 where  booking_id='" + id + "'";
        con.executeCommand(updQry);
        return null;
    }

    @WebMethod(operationName = "CategoryItem")
    public String CategoryItem(@WebParam(name = "id") String id, @WebParam(name = "ip") String ip) {

        String sel = "select * from tbl_item i inner join tbl_subcategory sb on sb.subcategory_id=i.subcategory_id where category_id='" + id + "'";
        System.out.println(sel);
        ResultSet rs = con.selectCommand(sel);
        JSONArray J = new JSONArray();
        try {
            while (rs.next()) {
                String stockSql = "select sum(stock_count) as stock from tbl_stock where item_id = '" + rs.getString("item_id") + "'";
                ResultSet rsST = con.selectCommand(stockSql);
                rsST.next();
                if (rsST.getString("stock") != null) {
                    int stock = Integer.parseInt(rsST.getString("stock"));
                    if (stock > 0) {
                        JSONObject a = new JSONObject();
                        try {
                            a.put("id", rs.getString("item_id"));
                            a.put("name", rs.getString("item_name"));
                            a.put("image", "http://" + ip + ":8084/SaveMart/Assets/Files/Items/" + rs.getString("item_image"));
                            a.put("price", rs.getString("item_price"));
                            J.put(a);
                        } catch (JSONException ex) {
                            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                }

            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return J.toString();
        //TODO write your implementation code here:

    }

    @WebMethod(operationName = "HomeCheckout")
    public String HomeCheckout(@WebParam(name = "total") String total, @WebParam(name = "id") String id, @WebParam(name = "address") String address) {
        String bid = "";
        try {

            String select = "select booking_id as id from tbl_booking where booking_status=0 and user_id='" + id + "'";
            ResultSet rs = con.selectCommand(select);
            if (rs.next()) {
                bid = rs.getString("id");

                String upQry = "update tbl_booking set delivery_mode='Home Delivery',delivery_address='" + address + "',booking_status=1,booking_amount='" + total + "' where booking_id='" + bid + "'";
                if (con.executeCommand(upQry)) {
                    String updQry = "update tbl_cart set cart_status=1 where  booking_id='" + bid + "'";
                    if (con.executeCommand(updQry)) {
                        return bid;
                    }
                }
            }

            return null;
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bid;
    }

    @WebMethod(operationName = "PickupCheckout")
    public String PickupCheckout(@WebParam(name = "total") String total, @WebParam(name = "id") String id, @WebParam(name = "date") String date, @WebParam(name = "time") String time) {
        String bid = "";
        try {

            String select = "select booking_id as id from tbl_booking where booking_status=0 and user_id='" + id + "'";
            ResultSet rs = con.selectCommand(select);
            if (rs.next()) {
                bid = rs.getString("id");

                String upQry = "update tbl_booking set delivery_mode='Pick-up',pickup_time='" + time + "',pickup_date='" + date + "',booking_status=1,booking_amount='" + total + "' where booking_id='" + bid + "'";
                if (con.executeCommand(upQry)) {
                    String updQry = "update tbl_cart set cart_status=1 where  booking_id='" + bid + "'";
                    if (con.executeCommand(updQry)) {
                        return bid;
                    }
                }
            }

            return null;
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bid;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "ViewBooking")
    public String ViewBooking(@WebParam(name = "id") String id) {
        String sel = "select * from tbl_booking where user_id='" + id + "' and booking_status!='0'";
        ResultSet rs = con.selectCommand(sel);
        JSONArray J = new JSONArray();
        try {
            while (rs.next()) {

                JSONObject a = new JSONObject();
                try {
                    a.put("id", rs.getString("booking_id"));
                    a.put("date", rs.getString("booking_date"));
                    a.put("amount", rs.getString("booking_amount"));
                    a.put("address", rs.getString("delivery_address"));
                    a.put("pdate", rs.getString("pickup_date"));
                    a.put("time", rs.getString("pickup_time"));
                    a.put("slot", rs.getString("pickup_parkingslot"));
                    a.put("mode", rs.getString("delivery_mode"));
                    J.put(a);
                } catch (JSONException ex) {
                    Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return J.toString();
        //TODO write your implementation code here:
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "ViewItems")
    public String ViewItems(@WebParam(name = "bookingId") String bookingId,  @WebParam(name = "ip") String ip) {
        String sel = "select * from tbl_cart c inner join tbl_item p on p.item_id=c.item_id inner join tbl_booking b on b.booking_id=c.booking_id where b.booking_id='" + bookingId + "'";
        System.out.println(sel);
        ResultSet rs = con.selectCommand(sel);
       
        JSONArray J = new JSONArray();
        try {
            while (rs.next()) {
                JSONObject a = new JSONObject();
                try {
                    a.put("name", rs.getString("item_name"));
                    a.put("image", "http://" + ip + ":8084/SaveMart/Assets/Files/Items/" + rs.getString("item_image"));
                    //a.put("price", rs.getString("item_price"));
                    a.put("id", rs.getString("cart_id"));
                    a.put("qty", rs.getString("cart_qty"));
                     String cart = "select c.cart_id,(i.item_price*c.cart_qty) as sum from tbl_cart c inner join tbl_item i on i.item_id=c.item_id";
        ResultSet crs = con.selectCommand(cart);
         System.out.println(crs);
                    if (crs.next()) {
                        a.put("total", crs.getInt("sum"));
                    }
                    J.put(a);
                } catch (JSONException ex) {
                    Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }

        return J.toString();
        //TODO write your implementation code here:

    }
    
    @WebMethod(operationName = "Notification")
    public String Notification(@WebParam(name = "id") String id) {
        String selB = "select * from tbl_notification where user_id='" + id + "'";
        ResultSet rs = con.selectCommand(selB);
        JSONArray J = new JSONArray();
        try {
            while (rs.next()) {
                JSONObject a = new JSONObject();
                try {
                    a.put("date", rs.getString("notification_date"));
                    a.put("title", rs.getString("notification_title"));
                    a.put("content", rs.getString("notification_content"));
                    J.put(a);
                } catch (JSONException ex) {
                    Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return J.toString();
    
    }

}
