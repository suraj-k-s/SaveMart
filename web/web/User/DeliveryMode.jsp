<!DOCTYPE html>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
    <html>
        <head>
            <title></title>
            <script>
                function showTextBox() {
                    var radioButton = document.querySelector('input[name="option"]:checked');
                    var textBoxes = document.getElementsByClassName('textbox');

                    for (var i = 0; i < textBoxes.length; i++) {
                        textBoxes[i].style.display = 'none';
                    }

                    if (radioButton) {
                        var textBox = document.getElementById(radioButton.value);
                        textBox.style.display = 'block';
                    }
                }
            </script>
        </head>
        <body>
            <%
        DateFormat yearf = new SimpleDateFormat("YYYY");
        DateFormat monthf = new SimpleDateFormat("MM");
        DateFormat dayf = new SimpleDateFormat("dd");
        String year = yearf.format(new Date());
        String month = monthf.format(new Date());
        String day = dayf.format(new Date());
        int yearnew = Integer.parseInt(year) ;
        
        String Date = String.valueOf(yearnew)+"-"+month+"-"+day;
     
    %>
        <%@include file="Header.jsp" %><div id="tab" align="center">
            <%

                if (request.getParameter("btn_home") != null) {
                    String up = "update tbl_booking set delivery_address='" + request.getParameter("txthome") + "',delivery_mode='Home Delivery' where booking_id='" + session.getAttribute("bid") + "'";
                    con.executeCommand(up);
            %>
            <script>
                alert("Success");
            </script>
            <%
                    response.sendRedirect("Payment.jsp");
                }
                if (request.getParameter("btn_pick") != null) {
                    String up = "update tbl_booking set pickup_date='"+request.getParameter("pickupdate")+"',pickup_time='" + request.getParameter("txtpick") + "',delivery_mode='Pick-up' where booking_id='" + session.getAttribute("bid") + "'";
                    con.executeCommand(up);
            %>
            <script>
                alert("Success");
            </script>
            <%
                    response.sendRedirect("Payment.jsp");
                }


            %>


            <form method="post">
                <div style="padding-left: 40%">
                    <h2>Delivery Mode:</h2>
                    <input type="radio" name="option" value="Pickup" onclick="showTextBox()"> Pickup
                    <input type="radio" name="option" value="HomeDelivery" onclick="showTextBox()">Home Delivery<br>

                </div>
                <br><br><br>

                <div id="Pickup" class="textbox" style="display:none;">
                    <table border="1"align="center">
                        <tr>
                            <td>Pickup Date</td><td> <input type="date" min="<%=Date%>" name="pickupdate"></td></tr>
                        <tr> <td> <label for="text1">Pickup time:</label></td>
                            <td> <select  name="txtpick"id="text1">
                                    <option>Select</option>
                                    <option value="9:00 - 10:00">9:00 - 10:00</option>
                                    <option value="11:00 - 11:30">11:00 - 11:30</option>
                                </select></td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2"><input type="submit" name="btn_pick" value="save"></td>
                        </tr>
                    </table>
                </div>
                <div id="HomeDelivery" class="textbox" style="display:none;">
                    <table border="1"align="center">
                        <tr>
                            <td>
                                <label for="text2">Delivery Address:</label>
                                <textarea id="text2" name="txthome"></textarea></td>
                        </tr>
                        <tr>
                            <td align="center"><input type="submit" name="btn_home" value="save"></td>
                        </tr>
                    </table>
                </div>

            </form></div>
            <%@include file="Footer.jsp" %>
    </body>
</html>
