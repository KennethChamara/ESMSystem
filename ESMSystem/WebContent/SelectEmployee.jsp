<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="service.EmployeeService"%>
<%@page import="service.EmployeeServiceIMPL"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.EmployeeDetails"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

	<%
		EmployeeDetails dls = (EmployeeDetails) request.getAttribute("employee");
	%>

	<div class="container mt-3">
		<h1>Edit Employee Details</h1>



		<form method="POST" action="updateemployee">
			<!-- <input type="text" name="Emp_ID" id="name" placeholder="Emp_ID"/>-->
			<div class="form-row">
				<div class="col-lg-2 lg-2"></div>
				<div class="col-lg-8 lg-8">
					<input type="text" style="margin-top: 40px; width: 75%;" class="badge-pill" name="empname" id="name"
						value="<%=dls.getEmpName()%>" />
				</div>
				<div class="col-lg-2 lg-2"></div>
			</div>
			<div class="form-row">
				<div class="col-lg-2 lg-2"></div>
				<div class="col-lg-8 lg-8">
					<input type="text" style="margin-top: 40px; width: 75%;" class="badge-pill" name="Email" id="name" placeholder="Email"
						value="<%=dls.getEmpEmail()%>" />
				</div>
				<div class="col-lg-2 lg-2"></div>
			</div>
			<div class="form-row">
				<div class="col-lg-2 lg-2"></div>
				<div class="col-lg-8 lg-8">
					<input type="text" style="margin-top: 40px; width: 75%;" class="badge-pill" name="Gender" id="name" placeholder="Gender"
						value="<%=dls.getEmpGender()%>" />
				</div>
				<div class="col-lg-2 lg-2"></div>
			</div>
			<div class="form-row">
				<div class="col-lg-2 lg-2"></div>
				<div class="col-lg-8 lg-8">
					<input type="text" style="margin-top: 40px; width: 75%;" class="badge-pill" name="Address" id="name" placeholder="Address"
						value="<%=dls.getEmpAddress()%>" />
				</div>
				<div class="col-lg-2 lg-2"></div>
			</div>
			<div class="form-row">
				<div class="col-lg-2 lg-2"></div>
				<div class="col-lg-8 lg-8">
					<input type="text" style="margin-top: 40px; width: 75%;" class="badge-pill" name="Designation" id="name"
						placeholder="Designaton" value="<%=dls.getEmpDesignation()%>" />
				</div>
				<div class="col-lg-2 lg-2"></div>
			</div>
			<div class="form-row">
				<div class="col-lg-2 lg-2"></div>
				<div class="col-lg-8 lg-8">
					<input type="hidden" name="empID" value="<%=dls.getEmpID()%>">
					<button type="submit" class="btn btn-primary badge-pill"
						style="margin-top: 45px; width: 75%;">Submit</button>
				</div>
				<div class="col-lg-2 lg-2"></div>
			</div>




			<p>
				By clicking Register, you agree on our <a href="#">terms and
					condition</a>.
			</p>


		</form>

	</div>

</body>
</html>