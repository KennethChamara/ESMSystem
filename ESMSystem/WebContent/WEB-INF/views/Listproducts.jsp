<%@page import="service.SupplierAnalyseServiceIMPL"%>
<%@page import="service.SupplierAnalyseService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ProductDetails"%>
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
		<div class="row">	
			<div class="col-sm-2"><button type="button" class="btn btn-primary badge-pill"><a href="supplier.jsp"><h1 style="color:white;font-size:20px;">Back</h1></a></button>
		</div>
		<div class="col-sm-8"
		
			style="background-color: #ffffff; color: #111111;">
			<h1 style="text-align: center;">Supplier Details</h1>
				<table class="table" style="background-color:#ffffff;">
		<thead class="thead-dark">
			<tr>
				<th scope="col">ProductName</th>
				<th scope="col">Quantity</th>
				<th scope="col">Discount</th>
				<th scope="col">unitPrice</th>
			
				
			</tr>			
	</thead>
		<%
		SupplierAnalyseService service = new SupplierAnalyseServiceIMPL();  //create marksAnalyserviceImpl object
		 	ArrayList<ProductDetails> productList = service.getProductdetailsList();    //ca
			
		 	for(ProductDetails m: productList ){
	 			 
		%>
	<tbody>	
		<tr>
				<th scope="row"><%=m.getProductName()%></th>
				<td><%=m.getQuantity()%></td>
				<td><%=m.getDiscount()%></td>
				<td><%=m.getUnitprice()%></td>
				
			
				<td>
				<form method="POST" action="selectproductdetails">
				<input type="hidden" name="productid" value="<%=m.getProductId() %>">
				<button type="submit" class="btn btn-primary badge-pill" >Update/Delete</button>
				</form> </td>
				
				
				
			
					</tr>		
		</tbody>
			<%} %>	
	</table>
		
	</div>
		
				
				


 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>