<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Leave List tab</title>
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

</head>
<body
	style="background-color: #111111; color: #ffffff; font-size: 120%; font-family: Georgia, serif; line-height: 1.5;">
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="container mt-4" style="min-height: 660px; ">
		<h2>Leave</h2>

		<!-- Nav tabs -->
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active"
				data-toggle="tab" href="#home">Request leaves</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#menu1">Requested leaves</a></li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content">
			<div id="home" class="container tab-pane active">
				<br>
				<jsp:include page="/requestedLeave.jsp"></jsp:include>
				
			</div>
			<div id="menu1" class="container tab-pane fade">
				<br>
				<jsp:include page="/leave.jsp"></jsp:include>

			</div>

		</div>
	</div>
</body>
</html>