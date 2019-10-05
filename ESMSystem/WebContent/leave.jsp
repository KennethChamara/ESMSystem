<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css"
	rel="stylesheet" type="text/css" />
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>

<meta charset="ISO-8859-1">
<title>Request Leave</title>
</head>
<body>
	<div align="center">
		<form method="POST" action="AddLeavesServlet" name="myForm"
			onsubmit="return validateDate() && validatType() && validatReason()">


			<div class="form-row">
				<div class="col-lg-2 lg-2"></div>
				<div class="col-lg-4 lg-4">
					<input type="radio" name="day" value="one" checked>One Day
				</div>
				<div class="col-lg-4 lg-4">
					<input type="radio" name="day" id="sday">Several Days
					<div id="day_error_message" style="color: red; font-size: 13px;"></div>
				</div>
				<div class="col-lg-2 lg-2"></div>
			</div>

			<div class="form-row" style="margin: 30px 0;">
				<div class="col-lg-2 lg-2"></div>
				<div class="col-lg-4 lg-4">
					<div class="form-row">
						<div class="col-lg-2 lg-2" style="text-align: left;">
							<label>from</label>
						</div>
						<div class="col-lg-10 lg-10">
							<div id="datepicker" class="input-group date badge-pill"
								data-date-format="mm-dd-yyyy">
								<input class="form-control" type="text" id="fdate" readonly
									name="formDate" /> <span class="input-group-addon"><i
									class="glyphicon glyphicon-calendar"></i></span>
							</div>
							<div id="formDate_error_message"
								style="color: red; font-size: 13px;"></div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 lg-4">
					<div class="form-row">
						<div class="col-lg-2 lg-2" style="text-align: left;">
							<div style="margin-left: 15px;">
								<label>To </label>
							</div>
						</div>
						<div class="col-lg-10 lg-10">
							<div id="datepicker2" class="input-group date badge-pill"
								data-date-format="mm-dd-yyyy">
								<input class="form-control" type="text" id="tdate" readonly
									name="toDate" /> <span class="input-group-addon"><i
									class="glyphicon glyphicon-calendar"></i></span>
							</div>
							<div id="toDate_error_message"
								style="color: red; font-size: 13px;"></div>
						</div>
					</div>
				</div>
				<div class="col-lg-2 lg-2"></div>
			</div>

			<div class="form-row" style="margin: 30px 0;">
				<div class="col-lg-2 lg-2"></div>
				<div class="col-lg-8 lg-8">
					<div class="form-row">
						<div class="col-lg-1 lg-1" style="text-align: left;">
							<label>Type</label>
						</div>
						<div class="col-lg-11 lg-11">
							<select name="type" id="select" class="custom-select badge-pill">
								<option>--Select One--</option>
								<option>Holy day(personal)</option>
								<option>Sick leave</option>
								<option>no pay leave</option>
								<option>Other leave</option>
							</select>
						</div>

					</div>
				</div>
				<div class="col-lg-2 lg-2"></div>
			</div>

			<div class="form-row">
				<div class="col-lg-2 lg-2"></div>
				<div class="col-lg-8 lg-8">
					<div class="form-group shadow-textarea" style="text-align: left;">
						<label for="exampleFormControlTextarea6">Reason for the
							Leave</label>
						<div id="Reason_error_message" style="color: red;"></div>
						<textarea class="form-control form-rounded" id="reason" cols="80"
							rows="6" placeholder="Write something here..." name="reason"></textarea>
					</div>
				</div>
				<div class="col-lg-2 lg-2"></div>
			</div>

			<div class="form-row" style="text-align: center;">
				<div class="col-lg-2 lg-2"></div>
				<div class="col-lg-4 lg-4">
					<button type="submit" class="btn btn-primary badge-pill"
						style="margin-top: 15px; width: 75%;">Submit</button>
				</div>
				<div class="col-lg-4 lg-4">
					<button type="reset" class="btn btn-warning badge-pill"
						style="margin-top: 15px; width: 75%">Reset</button>
				</div>
				<div class="col-lg-2 lg-2"></div>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		var Reason_error_message = document
				.getElementById("Reason_error_message");
		var Select_error_message = document
				.getElementById("Select_error_message");
		var toDate_error_message = document
				.getElementById("toDate_error_message");
		var formDate_error_message = document
				.getElementById("formDate_error_message");
		var day_error_message = document.getElementById("day_error_message");

		function validateDate() {
			var select = document.forms["myForm"]["day"].value;
			var date = document.forms["myForm"]["formDate"].value;
			var date2 = document.forms["myForm"]["toDate"].value;
			var varDate = new Date(date);
			var varDate2 = new Date(date2);
			var today = new Date();
			today.setHours(0, 0, 0, 0);

			if (varDate < today) {
				formDate_error_message.innerHTML = "Select upcoming Date or today";
				document.getElementById("fdate").style.border = "solid 1px red";
				return false;
			} else {
				document.getElementById("fdate").style.border = "0px";
				if (select == "one") {
					if (date == date2) {
						day_error_message.innerHTML = "";
						document.getElementById("sday").style.border = "0px";
						return true;
					} else {
						day_error_message.innerHTML = "Select This";
						document.getElementById("sday").style.border = "solid 2px red";
						return false;
					}
				} else {
					if (varDate2 >= varDate) {
						toDate_error_message.innerHTML = "";
						document.getElementById("tdate").style.border = "0px";
						return true;
					} else {
						toDate_error_message.innerHTML = "This should Grater than From Date";
						document.getElementById("tdate").style.border = "solid 1px red";
						return false;
					}
				}

			}	
		}
		
		function validatReason() {
			var type = document.forms["myForm"]["type"].value;
			if (type == "--Select One--") {
				document.getElementById("select").style.border = "solid 2px red";
				return false;
			} else {
				document.getElementById("select").style.border = "0px";
				return true;
			}
		}
		
		function validatType() {
			var type = document.forms["myForm"]["reason"].value;
			if (type == "") {
				document.getElementById("reason").style.border = "solid 2px red";
				return false;
			} else {
				document.getElementById("reason").style.border = "0px";
				return true;
			}
		}
		//==============================================================================================================
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
