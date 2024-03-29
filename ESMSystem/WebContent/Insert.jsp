<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Insert Record</title>
	<link rel="stylesheet" type="text/css" href="insert_tab.css">
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
  <script>
  function IncomeValidate(){
		var name = document.myForm.paidBy.value;
		var num = document.myForm.amount.value;
		
		if(name==""||name==null){
			document.getElementById("paidby").innerHTML="*Plese enter the income name";
			return false;
		}else{
			if(num==""||num==null){
  	  			document.getElementById("amount").innerHTML="*Plese enter the income amount";
  	  			return false;
  	  		}
  	  		else{
  	  			if(isNaN(num)){
	  	  			document.getElementById("amount").innerHTML="*Enter numeric value only";
	  	  			return false;
	  	  		}else{
	  	  			return true;
	  	  		}
  	  		}
		}	
	}

  </script>
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
			<form name ="myForm" method="post" onsubmit="return IncomeValidate()"  action="Controller/insert_controller.jsp" >
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
					<input type="date" name="date" value="">
				</div>
				<div class="input-group">
					<label>Amount</label>
					<input type="text" name="amount" value="">
					<span id="amount"></span>
				</div>
				<div class="input-group">
					<label>Paid By</label>
					<input type="text" name="paidBy" value="">
					<span id="paidby"></span>
				</div>
				<div class="input-group">
					<button class="btn" type="submit" name="save" >Save</button>
				</div>
			</form>
		</div>		
	</div>

</body>
</html>