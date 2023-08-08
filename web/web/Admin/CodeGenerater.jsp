<!DOCTYPE html>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<html>
  <head>
    <title>QR Code Encode and Decode</title>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/qrcode.js"></script>
  </head>
  <body>
      
    <table border="1" align="center">
      <tr>
        <td>Item Name</td>
        <td><input type="text" id="txt_name" name="item">
            </td>
      </tr>
      
      <tr>
        <td>Item Details</td>
        <td><input type="text" id="txt_details" name="details"></td>           
      </tr>
     <tr>
        <td>Item Price</td>
        <td><input type="text" id="txt_price" name="price"></td>           
      </tr>
      <tr>
        <td colspan="2" align="center">
          <button id="btn_generate" onclick="genarate()">Generate</button>
        </td>
      </tr>
    </table>
    <br />
    <div id="code" align="center">
     
    </div>
      
    <script>
      function genarate() {
        var name = document.getElementById("txt_name").value;
        var details = document.getElementById("txt_details").value;
        var price = document.getElementById("txt_price").value;

        var array =
          '{ "Item Name" : "' +
          name +
          '" , "Details" : "' +
          details +
          '" , "Price" : "' +
          price +
         
          '" }';
        console.log(array);
        var after = JSON.parse(array);
        console.log(after);
        console.log(after.name);

        var qrcode = new QRCode(document.getElementById("code"), {
          text: array,
          width: 128,
          height: 128,
          colorDark: "#5868bf",
          colorLight: "#ffffff",
          correctLevel: QRCode.CorrectLevel.H,
        });
      }
    </script>

    <br />
    <br />
    <br />
    <br />


    <!--To Read QR Code-->
    <script type="text/javascript" src="js/qrReader.js"></script>
  </body>
</html>
<script src="../Assets/JQuery/jQuery.js"></script>
                        <script>
                            function getSubCategory(cid)
                            {
                                $.ajax({url:"../Assets/AjaxPages/AjaxItemRack.jsp?sid=" + cid,
                                success: function(result){
                                    $("#txt_rackno").html(result);
                                }
                            })
                            }
                           
                        </script>