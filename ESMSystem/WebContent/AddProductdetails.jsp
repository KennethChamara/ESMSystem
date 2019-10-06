<%@page import="service.SupplierAnalyseServiceIMPL"%>
<%@page import="service.SupplierAnalyseService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.SupplierDetails"%>

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
<script src="productsvalidation.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.btn {
	background-color: DodgerBlue;
	border: none;
	color: white;
	padding: 12px 30px;
	cursor: pointer;
	font-size: 20px;
}

/* Darker background on mouse-over */
.btn:hover {
	background-color: RoyalBlue;
}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="container contact-form">
		<h1>Add Purchased Product Details</h1>
		<hr class="hrcolor">

		<div class="row">

			<div class="col-md-4">
				<p>Hint:Add the valid details for the fields</p>


				<form target="_blank" method="post"
					action="generateproducts_pdf.jsp">
					<button class="btn">
						<i class="fa fa-download"> </i>Report
					</button>
				</form>
			</div>

			<div class="col-md-6">

				<form onsubmit="return productsvalidationform();" method="POST"
					action="AddProductServlet">




					<div class="form-group  box">

						<label>Company Name</label> <select name="CompanyName"
							class="form-control" style="height: 43px;">
							<%
								SupplierAnalyseService service = new SupplierAnalyseServiceIMPL(); //create marksAnalyserviceImpl object
								ArrayList<SupplierDetails> suppList = service.getSupplierdetailsList();

								for (SupplierDetails m : suppList) {
							%>


							<option value="<%=m.getCompanyName()%>"><%=m.getCompanyName()%></option>

							<%
								}
							%>
						</select>

					</div>

					<div class="form-group">
						<label>Product Name</label><br> <input type="text" required
							class="form-control" name="ProductName" placeholder="productname"
							id="productname">
					</div>


					<div class="form-group">
						<label>Unit Price</label> <input type="text" required
							class="form-control" name="unitprice"
							placeholder="Add unit price" id="unitprice">
					</div>


					<div class="form-group">
						<label>Quantity</label> <input type="text" required
							class="form-control" name="quantity"
							placeholder="Purchased quantity for a product" id="quantity">
					</div>


					<div class="form-group">
						<label>Discount</label> <input type="text" required
							class="form-control" name="discount" placeholder="discount "
							id="discount">
					</div>



					<div style="margin-top: 35px;">
						<button class="btn btn-success badge-pill" style="width: 225px;">Send</button>
						<button type="reset" class="btn btn-warning badge-pill"
							style="width: 125px" onClick="window.location.reload();">Reset</button>
					</div>

				</form>

			</div>

			<div class="col-md-2">
				</br> </br> </br> <br>
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
























