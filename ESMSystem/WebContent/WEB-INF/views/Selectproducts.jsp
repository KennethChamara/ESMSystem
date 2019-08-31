<%@page import="model.ProductDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.4/css/bootstrap.min.css" rel="stylesheet">
 <link rel="stylesheet" type="text/css" href="custom.css" />
	<script src="https://kit.fontawesome.com/d6b8fe8225.js"></script>

<title>Insert title here</title>
</head>
<body>
		<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

<%
ProductDetails mks = (ProductDetails) request.getAttribute("details");		//fetching values from SelectmarksServlet
%>
	
	<div class="container contact-form">
	<h1> Products Details Update/Delete</h1>
	<hr class="hrcolor">

	<div class="row">
   
       <div class="col-md-6">
       	<p>Hint:</p>
       	<p>Dont add products details greater than the limit size </p>
       	
       </div>

       <div class="col-md-6">
       
       <form method="POST" action="UpdateproductsServlet">
       	
         <div class="form-group box">
         	<label>ProductName </label><br>
         		<input type="text" class="form-control"name="ProductName" value="<%=mks.getProductName()%>">
         </div>



	
         <div class="form-group">
         	<label>Quantity</label>
         	<input type="text" class="form-control" name="Quantity" value="<%=mks.getQuantity()%>">
         </div>

         <div class="form-group">
         	<label>Discount</label>
         	<input type="text" class="form-control" name="Discount" value="<%=mks.getDiscount()%>">
         </div>


 <div class="form-group">
         	<label>Unit Price</label>
         	<input type="text" class="form-control" name="unitprice" value="<%=mks.getUnitprice()%>">
         </div>






         <div class="form-group">
         <label></label>
         <input type="hidden" name="productId"
			value="<%=mks.getProductId()%>" />
         	<button class="btn btn-primary btn-block">Update</button>
         </div>
			
			</form>
			
			
			<form method="post" action="productsdeleteservlet">	
			<div class="form-group">
         	<label></label>
         	<input type="hidden" name="productId"
				value="<%=mks.getProductId()%>" />
         	<button class="btn btn-primary btn-block">Delete</button>
         </div>
			
			</form>
			
       </div>

    </div>

</div>
	
	
	
	
	
	
	
	
	
	
	



</body>
</html>