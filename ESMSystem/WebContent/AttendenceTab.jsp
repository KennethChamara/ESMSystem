<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Attendance</title>
<meta charset="utf-8">
<link rel="stylesheet" href="front.css">
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

</head>
<body
	style="background-color: #111111; color: #ffffff; font-size: 120%; font-family: Georgia, serif; line-height: 1.5;">
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="container mt-3">
		<h2>Attendance</h2>
		<br>
		<!-- Nav tabs -->
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active"
				data-toggle="tab" href="#home">Add</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#menu1">Tables</a></li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content">
			<div id="home" class="container tab-pane active">
				<br>
				<jsp:include page="/AttendenceEnter.jsp"></jsp:include>
			</div>
			<div id="menu1" class="container tab-pane fade">
				<br>
				<jsp:include page="/AttendenceAllList.jsp"></jsp:include>

			</div>

		</div>
	</div>
</body>
</html>