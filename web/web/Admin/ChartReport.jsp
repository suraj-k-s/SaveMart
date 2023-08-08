<%@page import="java.sql.ResultSet "%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<body>
<div id="tab" align="center">
<canvas id="myChart" style="width:100%;max-width:600px"></canvas>

<script>


var xValues = [
<%

  String sel="select * from tbl_category";
  ResultSet rs=con.selectCommand(sel);
  while(rs.next())
  {
      out.print("'"+rs.getString("category_type")+"',");
      
  }

%>
];

var yValues = [
<%
  String sel2="select * from tbl_category";
  //System.out.println (sel2);
  ResultSet rss=con.selectCommand(sel2);
  while(rss.next())
  {
	  
	String sel1="select count(*) as sum from tbl_booking b inner join tbl_cart ct on b.booking_id=ct.booking_id inner join tbl_item i on ct.item_id=i.item_id inner join tbl_subcategory s on i.subcategory_id=s.subcategory_id inner join tbl_category c on s.category_id=c.category_id where c.category_id='"+rss.getString("category_id")+"'";
	System.out.println (sel1);
	  
    ResultSet rs1=con.selectCommand(sel1);
  while(rs1.next())
	  {
        out.print (rs1.getString("sum")+",");
	  }
  }

%>
];



var barColors = [
  "#b91d47",
  "#00aba9",
  "#2b5797",
  "#e8c3b9",
  "#1e7145",
  "#aaa"
];

new Chart("myChart", {
  type: "bar",
  data: {
    labels: xValues,
    datasets: [{
      backgroundColor: barColors,
      data: yValues
    }]
  },
  options: {
    title: {
      display: true,
      text: "All Bookings"
    }
  }
});
</script>

</div>
</body>
</html>