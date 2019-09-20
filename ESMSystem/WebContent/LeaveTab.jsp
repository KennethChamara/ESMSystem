<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
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
<title>Leave Tab</title>
</head>
<body>
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="container-fluid">

		<div class="row" style="padding: 260px 100px;">
			<div class="col-sm-6" style="hieght: 200px" align="center">
				<div align="center">
					<a href="leave.jsp">
						<button type="button" class="btn btn-success badge-pill"
							style="margin: 20px; width: 70%; padding: 10px; height: 110px; font-size: 30px;">ADD
							Leave</button>
					</a>
				</div>
			</div>
			<div class="col-sm-6">
				<div align="center">
					<a href="requestLeaveList.jsp">
						<button type="button" class="btn btn-success badge-pill"
							style="margin: 20px; width: 70%; padding: 10px; height: 110px; font-size: 30px;">Reqested
							leave List</button>
					</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>