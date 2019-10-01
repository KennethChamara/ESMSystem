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
<title>Insert title here</title>
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
<script>
	
</script>

<style type="text/css">
input {
    position: relative;
    width: 150px; height: 20px;
    color: white;
}

input:before {
    position: absolute;
    top: 3px; left: 3px;
    content: attr(data-date);
    display: inline-block;
    color: black;
}

input::-webkit-datetime-edit, input::-webkit-inner-spin-button, input::-webkit-clear-button {
    display: none;
}

input::-webkit-calendar-picker-indicator {
    position: absolute;
    top: 3px;
    right: 0;
    color: black;
    opacity: 1;
}
</style>

</head>
<body>
	<form method="post" action="InsertAttendenceServlet">
		<div class="form-row">
			<div class="col-lg-9 lg-9">
				<h2>Insert Attendance</h2>
			</div>
			<div class="col-lg-3 lg-3">
				<div id="datepicker" class="input-group date"
					data-date-format="mm-dd-yyyy">
					<input class="form-control" type="date" data-date-format="YYYY MMMM DD" name="formDate"
						style="margin: 10px;" /> <span class="input-group-addon"><i
						class="glyphicon glyphicon-calendar"></i></span>
				</div>
			</div>
		</div>

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
					<button class="btn btn-outline-primary badge-pill" type="submit"
						style="width: 150px">Insert</button>
				</div>
			</div>
		</div>

	</form>

	<div style="margin: 15px 0;">
		<table class="table table-bordered">
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
					ArrayList<Attendance> Attendancelist = sevice.getOneDayAllAttendance();
					for (Attendance attendance : Attendancelist) {
				%>
				<tr>
					<td><input type="checkbox" name="delete" value="delete">
					</td>
					<td><%=attendance.getEmployeeID()%></td>
					<td><input type="time"
						class="form-control border-primary badge-pill"
						id="validationServer02" placeholder="Last name" required
						style="width: 200px" value="<%=attendance.getIntime()%>"></td>
					<td><input type="time"
						class="form-control border-primary badge-pill"
						id="validationServer02" value="<%=attendance.getOuttime()%>"
						required style="width: 200px"></td>
					<td><form action="">
							<input type="hidden" value="<%=attendance.getAttendanceID()%>">
							<button class="btn btn-outline-success badge-pill" type="submit"
								style="width: 150px"><%=attendance.getState()%></button>
						</form></td>
					<td><form method="post" action="AttendenceStateChange">
							<input type="hidden" name="id" value="<%=attendance.getAttendanceID()%>">
							<button class="btn btn-outline-danger badge-pill" type="submit"
								style="width: 150px">Change</button>
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
		<div class="col-sm-4">
			<button type="button" class="btn btn-primary">Primary</button>
			<button type="button" class="btn btn-danger">Danger</button>
		</div>
		<div class="col-sm-4"></div>

	</div>

</body>
</html>