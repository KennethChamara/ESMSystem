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


	<div class="container">
		<h2>Employees Salary</h2>
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
				for(int i =0;i<5;i++){
			%>
				<tr>
					<td>EP180615</td>
					<td>Mr.Weerathunga W.A.A.S.</td>
					<td>Deverloper</td>
					<td>26</td>
					<td>4</button></td>
				</tr>

			<%} %>

			</tbody>
		</table>
	</div>	
</body>
</html>