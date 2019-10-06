<%@page import="model.Stockproduct"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="button.css">

<title>Edit Item</title>
</head>
<body>

	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

			<div class="btn btn-primary mt-3">			
	 		<a href ="Stockproducts.jsp" class="btn btn-primary">Back</a>
			</div>

	<div class="container mt-3">

		<h2>Update Item</h2>

		<%
			Stockproduct stockproduct = (Stockproduct) request.getAttribute("item");
		%>

		<form method="post" action="UpdateItemServlet">

			<div class="form-group">
				<label for="item">Item name:</label> <input type="text"
					class="form-control" id="item" placeholder="Enter name" name="item"
					value="<%=stockproduct.getPname()%>">
			</div>

			<div class="form-group">
				<label for="category">Category:</label> <input type="text"
					class="form-control" id="category" placeholder="Enter category"name="category" 
					value="<%=stockproduct.getCategory()%>">
			</div>

			<div class="form-group">
				<label for="qnt">Quntity:</label> <input type="text"
					class="form-control" id="qnt" placeholder="Enter qnt" name="qnt"
					value="<%=stockproduct.getQty()%>">
			</div>

			<div class="form-group">
				<label for="manufacture">Manufacture:</label> <input type="text"
					class="form-control" id="manufacture"
					placeholder="Enter manufacture" name="manufacture"
					value="<%=stockproduct.getManufacture()%>">
			</div>

			<div class="form-group">
				<label for="price">Price:</label> <input type="text"
					class="form-control" id="price" placeholder="Enter price"
					name="price" value="<%=stockproduct.getPrice()%>">
			</div>


			<div class="form-group">
				<label for="image">Image:</label><br> <input type="file"
					class="btn btn-primary" value="fileupload" id="fileupload"
					placeholder="Attach" name="fileupload">
			</div>

			<button type="submit" class="btn btn-primary">Submit</button>
			<input type="hidden" name="itemId" value="<%=stockproduct.getPid()%>">
			<button type="reset" class="btn btn-primary">Reset</button>
		</form>

		
	</div>

</body>
</html>