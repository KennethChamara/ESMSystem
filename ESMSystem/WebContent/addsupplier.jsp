
<!DOCTYPE html>
<html lang="en">
<head>
<title>Insert title here</title>
<meta charset="UTF-8">

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.4/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="custom.css" />
<script src="https://kit.fontawesome.com/d6b8fe8225.js"></script>
<script src="supplierformvalidation.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


</head>
<body>

	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<br>
	<div class="container adding">
		<h1>Add Supplier Details</h1>
		<hr class="hrcolor">

		<div class="row">
			<div class="col-md-4">
				<p>Hint:names should be grater than 5 and less than 20</p>
				<p>phone number should be Local</p>

				<form target="_blank" method="post"
					action="supplierdetails_pdf_.jsp">
					<button class="btn">
						<i class="fa fa-download"> </i>Report
					</button>
				</form>

			</div>
			<br>
			<div class="col-md-8">

				<form onsubmit="return validation();" method="POST"
					action="AddSupplierdetailsServlet">

					<div class="row">
						<div class="col-md-8 form-group">
							<label>Full Name</label><br> <input type="text" required
								class="form-control" name="FullName"
								placeholder="Supplier Full name" id="supname">
						</div>
						<div class="col-md-2 form-group">
							<br>
							<div id="error_message1" style="color: red;"></div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-8 form-group">
							<label>Company Name</label> <input type="text" required
								class="form-control" name="CompanyName"
								placeholder="Supplier company Name" id="compnyname">
						</div>
						<div class="col-md-2">
							<br>
							<div id="error_message2" style="color: red;"></div>
						</div>
					</div>



					<div class="row">
						<div class="col-md-8 form-group">
							<label>Address</label> <input type="text" required
								class="form-control" name="address"
								placeholder="Supplier Company Address" id="address">
						</div>
						<div class="col-md-2">
							<br>
							<div id="error_message3" style="color: red;"></div>
						</div>
					</div>



					<div class="row">
						<div class="col-md-8 form-group">
							<label>Phone Number</label> <input type="text" required
								class="form-control" name="phonenumber"
								placeholder="Phone number" id="phone">
						</div>
						<div class="col-md-2">
							<br>
							<div id="error_message4" style="color: red;"></div>
						</div>
					</div>



					<div class="row">
						<div class="col-md-8 form-group">
							<label>Email Address</label> <input type="text" required
								class="form-control" name="emailaddress"
								placeholder="email address" id="email">
						</div>
						<div class="col-md-2">
							<br>
							<div id="error_message5" style="color: red;"></div>
						</div>
					</div>


					<div class="row">
						<div class="col-md-4">
							<br>
							<button class="btn btn-success badge-pill" style="width: 100%;">Send</button>
						</div>
						<div class="col-md-4">
							<br>
							<button type="reset" class="btn btn-warning badge-pill"
								onClick="window.location.reload();" style="width: 100%;">Reset</button>
						</div>
					</div>
				</form>

			</div>

		</div>

		<br>
	</div>

	</div>


</body>
</html>








