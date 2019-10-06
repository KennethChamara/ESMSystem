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
<title>All Attendance</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="container mt-3" style="min-height: 660px;">
		<%
			String smonth = (String) request.getAttribute("month");

			int month = 0;

			if (smonth != null && !smonth.equalsIgnoreCase(""))
				month = Integer.parseInt(smonth);

			if (month == 0) {
				LocalDate today = LocalDate.now();
				month = today.getMonthValue();
			}
		%>

		<div class="row" style="border-bottom: 2px solid #ccc;">
			<div class="col-lg-10 lg-10">
				<div class="btn-group" role="group">
					<a href="AttendenceEnter.jsp">
						<button type="button" style="margin-left: 10px;" class="btn btn">Insert
							Attendance</button>
					</a>
					<button type="button" class="btn btn-success active">Monthly
						Attendance</button>

				</div>
			</div>
			<div class="col-lg-2 lg-2">
				<div style="float: right;">
					<form target="_blank" method="post"
						action="AttendenceAllList_PDF.jsp">
						<input type="hidden" name="month" value="<%=month%>">
						<button type="submit" class="btn btn-primary badge-pill"
							style="width: 100px; margin-bottom: 10px;">
							<i class="fa fa-download"> </i>Report
						</button>
					</form>
				</div>
			</div>
		</div>
		<br>
		<div class="form-row">
			<div class="col-lg-7 lg-7">
				<h2>Employees Attendance</h2>
			</div>
			<div class="col-lg-5 lg-5">
				<div style="float: right; margin-bottom: 10px;">
					<form method="post" action="GetMonthlyAttendenceServlet">
						<select class="custom-select border-primary badge-pill" id="month"
							style="width: 200px" name="month">
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
						</select> <input type="hidden" name="page" value="admin" />
						<button class="btn btn-outline-success badge-pill" type="submit"
							style="width: 150px">Search</button>
					</form>
				</div>
			</div>
		</div>


		<div style="height: 500px; overflow-y: scroll;">
			<table class="table table-bordered"
				style="background-color: #ffffff;">
				<thead class="thead-dark">
					<tr>
						<th>Employee ID</th>
						<th>Employee Name</th>
						<th>Designation</th>
						<th>Present</th>
						<th>Absent</th>
						<th>Report</th>
					</tr>
				</thead>
				<tbody>
					<%
						AttendenceService sevice = new AttendenceServiceIMPL();
						ArrayList<Attendancelist> attendancelist = sevice.getMonthlyAttendance(month);
						for (Attendancelist attendance : attendancelist) {
					%>
					<tr>
						<td><%=attendance.getEmployeeID()%></td>
						<td>Mr.<%=attendance.getEmployeeName()%></td>
						<td><%=attendance.getEmployeePossion()%></td>
						<td><%=attendance.getNoOfdate_present()%></td>
						<td><%=attendance.getNoOfdate_absent()%></td>
						<td><form target="_blank" method="post"
								action="AttendanceView_PDF.jsp">
								<input type="hidden" name="month" value="<%=month%>"> <input
									type="hidden" name="ID" value="003ID">
								<button type="submit" class="btn btn-primary badge-pill"
									style="width: 100px; margin-bottom: 10px;">
									<i class="fa fa-download"> </i>Report
								</button>
							</form></td>
					</tr>
					<%
						}
					%>

				</tbody>
			</table>
		</div>
	</div>
</body>
</html>