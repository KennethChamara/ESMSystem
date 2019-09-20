<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>
<style>
td {
	margin: 25px;
	padding: 15px:
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css"
	rel="stylesheet" type="text/css" />
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>

<meta charset="ISO-8859-1">
<title>Request Leave</title>
<script>
	/*function validateDate() {
		var date = document.forms["myForm"]["formDate"].value;
		var varDate = new Date(date); //dd-mm-YYYY
		var today = new Date();

		if (varDate >= today) {
			alert("Working!");
			return true;
		} else {
			alert(varDate);
			alert(today);
			alert("Name must be filled out");
			return false;
		}
	}*/
	function validatType() {
		var type = document.forms["myForm"]["type"].value;
		if (type == "--Select One--") {
			alert("Select a leave Type");
			return false;
		}
	}

	function validateDate() {
		var select = document.forms["myForm"]["day"].value;
		var date = document.forms["myForm"]["formDate"].value;
		var date2 = document.forms["myForm"]["toDate"].value;
		var varDate = new Date(date);
		var varDate2 = new Date(date);
		var today = new Date();

		if (select == "one") {
			if (date == date2) {
				return true;
			} else {				
				alert("Select Several Days\nif you request more than one day");
				return false;
			}
		} else {
			if (varDate >= today) {
				alert("Working!");
				return true;
			} else {
				alert(varDate);
				alert(today);
				alert("Invalid date");
				return false;
			}
		}
	}
</script>
</head>
<body>

	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<a href="LeaveTab.jsp">
		<button type="button" class="btn btn-success badge-pill"
			style="position: fixed; left: 25px; top: 70px; width: 150px;">Back</button>
	</a>
	<div class="container mt-3">
		<h1 style="text-align: center;">Request leaves</h1>
		<div align="center">
			<form method="POST" action="AddLeavesServlet" name="myForm"
				onsubmit="return validateDate() && validatType()">

				<table>
					<tr>
						<td><input type="radio" name="day" value="one" checked>One
							Day</td>
						<td><input type="radio" name="day">Several Days</td>
					</tr>
					<tr>
						<td><label>from : </label>
							<div id="datepicker" class="input-group date"
								data-date-format="mm-dd-yyyy">
								<input class="form-control" type="text" readonly name="formDate"
									style="margin: 10px;" /> <span class="input-group-addon"><i
									class="glyphicon glyphicon-calendar"></i></span>
							</div></td>
						<td><label>To : </label>
							<div id="datepicker2" class="input-group date"
								data-date-format="mm-dd-yyyy">
								<input class="form-control" type="text" readonly name="toDate"
									style="margin: 10px;" /> <span class="input-group-addon"><i
									class="glyphicon glyphicon-calendar"></i></span>
							</div></td>
					</tr>
					<tr>

						<td colspan="2">
							<div style="margin: 10px;">
								<label>Leave Type : </label> <select name="type">
									<option>--Select One--</option>
									<option>Holy day(personal)</option>
									<option>Sick leave</option>
									<option>no pay leave</option>
									<option>Other leave</option>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="form-group shadow-textarea">
								<label for="exampleFormControlTextarea6">Reoson for the
									Leave</label>
								<textarea class="form-control z-depth-1"
									id="exampleFormControlTextarea6" cols="80" rows="11"
									placeholder="Write something here..." name="reason" required></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td><button type="submit" class="btn btn-primary"
								style="margin: 15px; width: 100px;">Submit</button></td>
						<td><button type="reset" class="btn btn-warning"
								style="margin: 15px; width: 100px;">Reset</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$("#datepicker").datepicker({
				autoclose : true,
				todayHighlight : true
			}).datepicker('update', new Date());
		});
		$(function() {
			$("#datepicker2").datepicker({
				autoclose : true,
				todayHighlight : true
			}).datepicker('update', new Date());
		});
	</script>
</body>
</html>
