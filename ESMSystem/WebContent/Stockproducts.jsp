<%@page import="model.Stockproduct"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.StockproductServiceIMPL"%>
<%@page import="service.Stockproductservice"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="button.css">
  <link rel="stylesheet" href="table.css">
    <link rel="stylesheet" href="overflow.css">
   <link rel="stylesheet" href="popup.css">


<title>Products</title>
</head>
<body>

	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	 
	<div class="container mt-3">
	
  <h2>Products</h2>
  

  
    <p>Search here</p>
<form class="search" action="/action_page.php">
  <input type="text" class="form-control" placeholder="Products name or Products ID">
  <button type="submit" class="btn btn-primary">Search</button>
</form><br>




	<div class="btn-group">
	  <a href ="additem.jsp" class="button">Add</a>
	</div><br>
	
	
	
	
  <div id="table-scroll">
<table>
  <tr>
  	<th><input type="checkbox" id="selectall" /></th>
  	<th>ID</th>
    <th>Name</th>
    <th>Category</th>
    <th>Qty</th>
    <th>Manufacture</th>
    <th>Price</th>
    <th>Update</th>
    <th>Delete</th>
  </tr>
  <%
  	Stockproductservice service = new StockproductServiceIMPL();  	
	ArrayList<Stockproduct> productList = service.getpoducts();
	
	for(Stockproduct product : productList){
  %>
  <tr>
  	<div class="ex3">
  	<td>
  	<input type="checkbox" class="case" name="case" value="1" />
  	</td>
  	<td><%=product.getPid() %></td>
    <td><%=product.getPname() %></td>
    <td><%=product.getCategory() %></td>
    <td><%=product.getQty() %></td>
    <td><%=product.getManufacture() %></td>
    <td><%=product.getPrice() %></td>
    <td>
    </div>
        <form method="POST" action="SelectItemServlet">
				<input type="hidden" name="id" value="<%=product.getPid() %>">
				<button type="submit" class="btn btn-primary" >Update</button>
		</form>  
    </td>
    
    	<td>
    	<form method="post" action="DeleteProuductServlet">
    			<input type="hidden" name="delete" value="<%=product.getPid() %>">
				<button type="submit" class="btn btn-primary" >Delete</button>
		</form>    
  </tr>
  <% } %>

</table>
</div>
    

    
    

  </div>
  
  
  
 

</body>
</html>