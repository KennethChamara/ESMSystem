<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	   <jsp:include page="/WEB-INF/header.jsp"></jsp:include>

		<div class= "  ">
		
			<a href="addsupplier.jsp">
			
				<button type="submit">Add Supplier</button>
				
			</a>
			
		</div>  
	
	<br>
	
		<div class= "  ">
		
			<a href="AddProductdetails.jsp">
			
				<button type="submit">Add Product</button>
				
			</a>
		</div>  
	
	<br>
	
		<div class="  ">
	
			<form method="post" action="Listsupplier">
				<button type="submit">Displaysupplierdetails</button>
			</form>
		</div>





</body>
</html>