<%@page import="model.Attendance"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="model.Attendancelist"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.AttendenceServiceIMPL"%>
<%@page import="service.AttendenceService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Attendance view</title>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
<%
	String smonth = (String) request.getAttribute("month");

	int month = 0;

	if (smonth != null && !smonth.equalsIgnoreCase(""))
		month = Integer.parseInt(smonth);

	if (month == 0) {
		LocalDate today = LocalDate.now();
		month = today.getMonthValue();
	}
	
	AttendenceService sevice = new AttendenceServiceIMPL();
	
	double precent = sevice.getSingleMonthlyAttendancePrnt("003ID", month);
	
	%>
.bar {
	background-color:#FFFFFF;
	border-radius: 25px;
	width:100%;
	height:30px;
	margin-bottom:40px;
}

.bar-inner {
	background-color:#2ecc71;
	border-radius: 25px;
	width:<%=precent %>%;
	height:100%;
	position:relative;
}

.bar-inner:after {
	position:absolute;
	right:2.5%;
	content:attr(data-percent);
	line-height: 30px;
	color: #fff;
	font-weight: 700;
}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="container mt-3">
		<%
			
		%>
		<div class="row" style="border-bottom: 2px solid #ccc;">
			<div class="col-lg-8 lg-8">
				<div class="btn-group" role="group">
					<h2>My Attendance</h2>

				</div>
			</div>
			<div class="col-lg-4 lg-4">
			<div style="float: right;">
				<form method="post" action="GetMonthlyAttendenceServlet">
					<select class="custom-select border-primary badge-pill" id="month"
						style="width: 197px" name="month">
						<option value="">This month</option>
						<option value="01">January</option>
						<option value="02">February</option>
						<option value="03">March</option>
						<option value="04">April</option>
						<option value="05">May</option>
						<option value="06">June</option>
						<option value="07">July</option>
						<option value="08">August</option>
						<option value="09">September</option>
						<option value="10">October</option>
						<option value="11">November</option>
						<option value="12">December</option>
					</select> <input type="hidden" name="page" value="view" />
					<button class="btn btn-outline-success badge-pill" type="submit"
						style="width: 145px">Search</button>
				</form>
				</div>
			</div>
		</div>
		<div class="form-row" style="margin: 15px 0px;">
			<div class="col-lg-10 lg-10">
				<h5>Attendance Percentage</h5>
				<div class = "bar">
					<div class="bar-inner" data-percent="<%=precent %>%"></div>	
				</div> 
			</div>
			
			<div class="col-lg-2 lg-2">
				<br>
				<div style="float: right;">
				<form target="_blank" method="post" action="AttendanceView_PDF.jsp">
					<input type="hidden" name="month" value="<%=month%>">
					<input type="hidden" name="ID" value="003ID">
					<button type="submit" class="btn btn-primary badge-pill" style="width: 150px"><i class="fa fa-download">
       				</i>Report</button>
				</form>
				</div>
			</div>
		</div>

		<table class="table table-bordered">
			<thead class="thead-dark">
				<tr>
					<th>Date</th>
					<th>In Time</th>
					<th>Out Time</th>
					<th>State</th>
				</tr>
			</thead>
			<tbody>
				<%
					ArrayList<Attendance> attendancelist = sevice.getSingleMonthlyAttendance("003ID", month);

					for (Attendance attendance : attendancelist) {
				%>
				<tr>
					<td><%=attendance.getDate()%></td>
					<td><%=attendance.getIntime()%></td>
					<td><%=attendance.getOuttime()%></td>
					<td><%=attendance.getState()%></td>

				</tr>

				<%
					}
				%>

			</tbody>
		</table>
	</div>
</body>
</html>