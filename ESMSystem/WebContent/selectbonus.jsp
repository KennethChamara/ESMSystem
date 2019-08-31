<%@page import="model.Bonuse"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="benefits.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>Add Bonuse</title>
</head>
<body>

	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>



	<div class="container mt-3">
		<div class="row" style="margin-top: 40px">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">

				<h2>
					<b>Update Bonus</b>
				</h2>
				<%
					Bonuse bounce = (Bonuse) request.getAttribute("Bonuse");
				%>
				<br> <br>

				<form method="POST" action="UpdateBonusServelet">

					<div class="form-group">

						<label for="usr">Employee ID:</label> <input type="text"
							class="form-control" id="eId" placeholder="Enter Employee ID"
							name="eId" value="<%=bounce.getEid()%>">

					</div>

					<div class="form-group">
						<label for="usr">Bonus Rate :</label> <input type="text"
							class="form-control" id="bRate" placeholder="Enter Bonuse Rate"
							name="brate" value="<%=bounce.getRate()%>">
					</div>

					<div class="form-group">
						<label for="usr">Bonus Type :</label> <input type="text"
							class="form-control" id="bType" placeholder="Enter Bonuse Type"
							name="bType" value="<%=bounce.getType()%>">
					</div>

					<input type="hidden" name="id" value="<%=bounce.getBid()%>">
					
					<button type="submit" class="btn btn-primary">Update</button>

					<button type="reset" class="btn btn-primary">Reset</button>
				</form>

			</div>
		</div>
	</div>

</body>
</html>