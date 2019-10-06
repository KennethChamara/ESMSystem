<%@page import="model.SupplierDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.4/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="custom.css" />
<script src="https://kit.fontawesome.com/d6b8fe8225.js"></script>
<script src="supplierformvalidation.js"></script>
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		function confirmf() {
			if (confirm('Are you sure you want to Delete this?')) {
				return true;
			} else {
				return false;
			}
		}
	</script>
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

	<%
		SupplierDetails mks = (SupplierDetails) request.getAttribute("details"); //fetching values from SelectmarksServlet
	%>

	<div class="container contact-form">
		<h1>Supplier Details Update/Delete</h1>
		<hr class="hrcolor">

		<div class="row">

			<div class="col-md-4">
				<p>Hint:</p>
				<p>Dont add Supplier details greater than the limit size</p>

			</div>

			<div class="col-md-6">

				<form onsubmit="return validation();" method="POST"
					action="UpdateSupplierServlet">

					<div class="form-group box">
						<label>Full Name</label><br> <input type="text" required
							class="form-control" name="FullName" id="supname"
							value="<%=mks.getFullName()%>">
					</div>

					<div class="form-group">
						<label>Company Name</label> <input type="text" required
							class="form-control" name="CompanyName" id="compnyname"
							value="<%=mks.getCompanyName()%>">
					</div>

					<div class="form-group">
						<label>Address</label> <input type="text" required
							class="form-control" name="address" id="address"
							value="<%=mks.getAddress()%>">
					</div>


					<div class="form-group">
						<label>Phone Number</label> <input type="text" required
							class="form-control" name="phonenumber" id="phone"
							value="<%=mks.getPhonenumber()%>">
					</div>


					<div class="form-group">
						<label>Email Address</label> <input type="text" required
							class="form-control" id="email" name="emailaddress"
							value="<%=mks.getEmailaddress()%>">
					</div>




					<div>

						<input type="hidden" name="supplierId"
							value="<%=mks.getSupplierId()%>" />
						<button class="btn btn-success badge-pill"
							style="width: 348px; margin-bottom: 4px; height: 38px;">Update</button>


					</div>

				</form>


				<form method="post" action="Supplierdeleteservlet"
					onsubmit="return confirmf()">


					<div>
						<input type="hidden" name="supplierId"
							value="<%=mks.getSupplierId()%>" />
						<button class="btn btn-danger badge-pill"
							style="width: 348px; margin-top: 4px; height: 38px; margin-bottom: 8px;">Delete</button>

					</div>
				</form>

			</div>

			<div class="col-md-2">
				<br>
				<div id="error_message1" style="color: red;"></div>
				<br> <br>
				<div id="error_message2" style="color: red;"></div>
				<br> <br>
				<div id="error_message3" style="color: red;"></div>
				<br> <br>
				<div id="error_message4" style="color: red;"></div>
				<br> <br>
				<div id="error_message5" style="color: red;"></div>
			</div>









		</div>

	</div>














</body>
</html>