<%@page import="common.User_Bean"%>
<%@page import="CRUD.Edit_values"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Edit Record</title>
	<link rel="stylesheet" type="text/css" href="insert_tab.css">
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <style>
body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 14%;
  left: 0;
  background-color: #FFFFFF;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
</head>
<body>

	<%
		String bill_ID = (String)request.getParameter("bill_ID");
		
		Edit_values obj_Edit_values = new Edit_values();
		User_Bean obj_User_Bean = obj_Edit_values.get_values_of_user(bill_ID);
	
	
	%>
		<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

		<span style="float: left; font-size:30px;cursor:pointer" onclick="openNav()">&#9776;  Other Expenses</span>
		<div id="mySidenav" class="sidenav">
  			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  			<a href="Rental.jsp"> Rental</a>
  			<a href="Electricity.jsp"> Electricity</a>
  			<a href="Internet.jsp"> Internet</a>
  			<a href="Water.jsp"> Water</a>
  			<a href="Other.jsp"> Other</a>
		</div>
		<script>
			function openNav() {
  			document.getElementById("mySidenav").style.width = "250px";
			}

			function closeNav() {
 			document.getElementById("mySidenav").style.width = "0";
			}
		</script>
		<div id="Paris" class="tabcontent">
		<div>
			<form method="post" action="Controller/edit_controller.jsp" >
				<div class="input-group">
					<label>ID</label>
					<input type="text" name="bill_ID" value="<%=obj_User_Bean.getBill_ID() %>" required>
				</div>
				<div class="input-group">
					<label for="sel1">Select Bill Type</label>
					    <select style="border-radius: 5px; border: 1px solid gray; height: 45px; width: 97%; padding: 5px 10px; font-size: 16px;" class="form-control" id="sel1" name="bill_type">
        					<option>Electricity</option>
        					<option>Rental</option>
        					<option>Internet</option>
        					<option>Water</option>
        					<option>Other</option>
      					</select>
				</div>
				<div class="input-group">
					<label for="sel1">Month</label>
						<select style="border-radius: 5px; border: 1px solid gray; height: 45px; width: 97%; padding: 5px 10px; font-size: 16px;" class="form-control" id="sel1" name="month">
        					<option>January</option>
        					<option>February</option>
        					<option>March</option>
        					<option>April</option>
        					<option>May</option>
        					<option>June</option>
        					<option>July</option>
        					<option>August</option>
        					<option>August</option>
        					<option>September</option>
        					<option>October</option>
        					<option>November</option>
        					<option>December</option>
      					</select>
				</div>
				<div class="input-group">
					<label>Date</label>
					<input type="date" name="date" value="<%=obj_User_Bean.getDate()%>">
				</div>
				<div class="input-group">
					<label>Amount</label>
					<input type="text" name="amount" value="<%=obj_User_Bean.getAmount() %>" required>
				</div>
				<div class="input-group">
					<label>Paid By</label>
					<input type="text" name="paidBy" value="<%=obj_User_Bean.getPaidBy() %>" required>
				</div>
				<div class="input-group">
					<button class="btn" type="submit" name="save" >Edit</button>
				</div>
			</form>
		</div>		
	</div>

</body>
</html>