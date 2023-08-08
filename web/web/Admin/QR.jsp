<!DOCTYPE html>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<html>
  <head>
    <title>QR Code </title>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/qrcode.js"></script>
  </head>
  <body>
      
    <table border="1" align="center">
      <tr>
        <td>Product</td>
                <td><select name="txt_name" id="txt_name" onchange="getSubCategory(this.value)">
                        <option value="">--Select--</option>
                        <%
                        String sel="select * from tbl_item";
                        ResultSet rs=con.selectCommand(sel);
                        while(rs.next())
                        {
                            %>
                            <option value="<%=rs.getString("item_id")%>"><%=rs.getString("item_name")%></option>
                            <%
                        }
                        %>
            </select>
            </td>
      </tr>
      
      <tr>
        <td>Rack Number</td>
        <td><select id="txt_rackno" name="txt_rackno"><option value="">-Select-</option>
            <%
                            String select="select * from tbl_item";
                            ResultSet rse=con.selectCommand(select);
                            while(rse.next())
                            {
                                %>
                                <option value="<%=rse.getString("item_id")%>"><%=rse.getString("item_rackno")%></option>
                                <%
                            }
                            %>
            </select></td>
            
      </tr>
     
      <tr>
        <td colspan="2" align="center">
          <button id="btn_generate" onclick="generate()">Generate</button>
        </td>
      </tr>
    </table>
    <br>
    <div id="code" align="center">
     
    </div>
      
    <script>
  function generate() {
    var product = document.getElementById("txt_name").value;
    var rackNumber = document.getElementById("txt_rackno").value;

    var data = {
      "Product": product,
      "Rack Number": rackNumber
    };

    var jsonData = JSON.stringify(data);

    var qrcode = new QRCode(document.getElementById("code"), {
      text: jsonData,
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