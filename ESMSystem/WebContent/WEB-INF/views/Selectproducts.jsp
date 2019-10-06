<%@page import="model.ProductDetails"%>
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
<script src="productsvalidation.js"></script>
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
		ProductDetails mks = (ProductDetails) request.getAttribute("details");
	%>

	<div class="container contact-form">
		<h1>Products Details Update/Delete</h1>
		<hr class="hrcolor">

		<div class="row">

			<div class="col-md-4">
				<p>Hint:</p>
				<p>Dont add products details greater than the limit size</p>

			</div>

			<div class="col-md-6">

				<form onsubmit="return productsvalidationform();" method="POST"
					action="UpdateproductsServlet">

					<div class="form-group box">
						<label>ProductName </label><br> <input type="text"
							id="productname" class="form-control" name="ProductName"
							value="<%=mks.getProductName()%>">
					</div>

					<div class="form-group">
						<label>Unit Price</label> <input type="text" class="form-control"
							name="unitprice" id="unitprice" value="<%=mks.getUnitprice()%>">
					</div>

					<div class="form-group">
						<label>Quantity</label> <input type="text" class="form-control"
							name="quantity" id="quantity" value="<%=mks.getQuantity()%>">
					</div>

					<div class="form-group">
						<label>Discount</label> <input type="text" class="form-control"
							name="discount" id="discount" value="<%=mks.getDiscount()%>">
					</div>

					<div>
						<label></label> <input type="hidden" name="productId"
							value="<%=mks.getProductId()%>" />
						<button class="btn btn-success badge-pill"
							style="width: 348px; margin-bottom: 4px; height: 38px;padding:5px">Update</button>
					</div>

				</form>


				<form method="post" action="productsdeleteservlet"
					onsubmit="return confirmf()">
					<div>
						<label></label> <input type="hidden" name="productId"
							value="<%=mks.getProductId()%>" />
						<button class="btn btn-dangerbadge-pill"
							style="width: 348px; margin-top: 4px; height: 38px; margin-bottom: 8px;padding:5px">Delete</button>
					</div>

				</form>

			</div>

			<div class="col-md-2">
				</br>
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