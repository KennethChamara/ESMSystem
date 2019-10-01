<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="container mt-3">

		<div class="row" style="border-bottom: 2px solid #ccc;">
			<div class="btn-group" role="group">
				<button type="button" style="margin-left: 10px;"
					class="btn btn-success">Monthly Attendance</button>
				<button type="button" class="btn btn-success  active">Insert
					Attendance</button>
			</div>
		</div>
		<br>
		<div class="form-row">
			<div class="col-lg-7 lg-7">
				<h2>Employees Salary</h2>
			</div>
			<div class="col-lg-5 lg-5">
				<form method="post" action="GetMonthlyAttendenceServlet">
					<select class="custom-select border-primary badge-pill" id="eid"
						style="width: 200px" name="e_id">
						<option value="09">This month</option>
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
					</select>

					<button class="btn btn-outline-success badge-pill" type="submit"
						style="width: 150px">Search</button>
				</form>
			</div>
		</div>



		<table class="table table-bordered">
			<thead class="thead-dark">
				<tr>
					<th>Employee ID</th>
					<th>Employee Name</th>
					<th>Possion</th>
					<th>Present</th>
					<th>Absent</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < 5; i++) {
				%>
				<tr>
					<td>EP180615</td>
					<td>Mr.Weerathunga W.A.A.S.</td>
					<td>Deverloper</td>
					<td>26</td>
					<td>4</td>
				</tr>

				<%
					}
				%>

			</tbody>
		</table>
	</div>
</body>
</html>