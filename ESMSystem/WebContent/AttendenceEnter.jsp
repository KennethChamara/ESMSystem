<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="model.Attendance"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.AttendenceServiceIMPL"%>
<%@page import="service.AttendenceService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Attendance Insert</title>
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
<script type="text/javascript">
function validateDate() {
	var Date_error_message = document.getElementById("Date_error_message");
	var date = document.forms["myForm"]["date"].value;
	var varDate = new Date(date);
	var today = new Date();
	today.setHours(0, 0, 0, 0);

	if (varDate > today) {
		Date_error_message.innerHTML = "Select a past Date";
		document.getElementById("Date").style.border = "solid 1px red";
		return false;
	} else {
		Date_error_message.innerHTML = "";
		document.getElementById("Date").style.border = "solid 1px red";
		return true;
	}	
}
</script>
<meta charset="ISO-8859-1">
</head>
<body>
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="container mt-3" style="min-height: 660px; ">
		<%
			String date = (String) request.getAttribute("date");

			if (date == null) {
				DateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy");
				Date Date_ = new Date();
				date = dateFormat.format(Date_);
			}
		%>

		<div class="row" style="border-bottom: 2px solid #ccc;">
			<div class="btn-group" role="group">
				<button type="button" style="margin-left: 10px;"
					class="btn btn-success  active">Insert Attendance</button>
				<a href="AttendenceAllList.jsp">
					<button type="button" class="btn">Monthly Attendance</button>
				</a>
			</div>
		</div>
		<br>

		<form method="post" onsubmit="return validateDate()" name="myForm" action="AttendanceSearchServlet">
			<div class="form-row">
				<div class="col-lg-8 lg-8"></div>

				<div class="col-lg-3 lg-3">
					<div id="datepicker" class="input-group date badge-pill"
						data-date-format="mm-dd-yyyy">
						<input class="form-control" type="text" id="Date" readonly name="date"
							value="<%=date%>" /> <span class="input-group-addon"></span>
					</div>
					<div id="Date_error_message"
								style="color: red; font-size: 13px; margin-left:10px;"></div>
				</div>
				
				<div class="col-lg-1 lg-1">
					<button type="submit" class="btn btn-primary">Search</button>
				</div>
			</div>
		</form>
		<br>

		<form method="post" action="InsertAttendenceServlet">
			<div class="form-row">
				<div class="col-lg-3 lg-3">
					<%
						AttendenceService sevice = new AttendenceServiceIMPL();
						ArrayList<String> list = sevice.getEmployeeIDs();
					%>
					<label for="eid">Employee ID</label> <select
						class="custom-select border-primary badge-pill" id="eid"
						style="width: 200px" name="e_id">
						<option selected>Choose...</option>
						<%
							for (String id : list) {
						%>
						<option value="<%=id%>"><%=id%></option>
						<%
							}
						%>

					</select>
				</div>
				<div class="col-lg-3 lg-3">
					<label for="in">In Time</label> <input type="time"
						class="form-control border-primary badge-pill" id="in" required
						style="width: 200px" name="intime">
				</div>
				<div class="col-lg-3 lg-3">
					<label for="out">Out Time</label> <input type="time"
						class="form-control border-primary badge-pill" id="out" required
						style="width: 200px" name="outtime">
				</div>
				<div class="col-lg-3 lg-3">
					<div style="position: absolute; right: 80px; bottom: 0;">
						<input type="hidden" value="<%=date%>" name="date" />
						<button class="btn btn-outline-primary badge-pill" type="submit"
							style="width: 150px">Insert</button>
					</div>
				</div>
			</div>

		</form>

		<div style="margin: 15px 0; height: 370px; overflow-y: scroll;"> 
			<table class="table table-bordered" style="background-color: #ffffff;">
				<thead class="thead-dark">
					<tr>
						<th></th>
						<th>Employee ID</th>
						<th>In Time</th>
						<th>Out Time</th>
						<th>State</th>
						<th>Change</th>
					</tr>
				</thead>
				<tbody>
					<%
						ArrayList<Attendance> Attendancelist = sevice.getOneDayAllAttendance(date);
						for (Attendance attendance : Attendancelist) {
					%>
					<tr>
						<td><input type="checkbox" id="delete"></td>
						<td><%=attendance.getEmployeeID()%></td>
						<td><input type="time"
							class="form-control border-primary badge-pill"
							id="validationServer02" style="width: 130px"
							value="<%=attendance.getIntime()%>"></td>
						<td><input type="time"
							class="form-control border-primary badge-pill"
							id="validationServer02" style="width: 130px"
							value="<%=attendance.getOuttime()%>"></td>
						<td><form action="">
								<input type="hidden" value="<%=attendance.getAttendanceID()%>">
								<%
									String color = "success";
										if (attendance.getState().equalsIgnoreCase("absent"))
											color = "danger";
										else if (attendance.getState().equalsIgnoreCase("leave"))
											color = "primary";
								%>
								<button class="btn btn-outline-<%=color%> badge-pill"
									type="submit" style="width: 130px"><%=attendance.getState()%></button>
							</form></td>
						<td><form method="post" action="AttendenceStateChange">
								<input type="hidden" name="id"
									value="<%=attendance.getAttendanceID()%>"> <input
									type="hidden" name="date" value="<%=date%>">
								<button class="btn btn-outline-danger badge-pill" type="submit"
									style="width: 130px">Change</button>
							</form></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
		<div class="row">
			<div class="col-sm-4"></div>
			<div class="col-sm-4" style="text-align:center;">
				<button type="button" class="btn btn-danger" style="width:200px">Delete</button>
			</div>
			<div class="col-sm-4"></div>

		</div>

	</div>
	<script type="text/javascript">
		$(function() {
			$("#datepicker").datepicker({
				autoclose : true,
				todayHighlight : true
			})
		});
		$(function() {
			$("#datepicker2").datepicker({
				autoclose : true,
				todayHighlight : true
			})
		});
	</script>

</body>
</html>