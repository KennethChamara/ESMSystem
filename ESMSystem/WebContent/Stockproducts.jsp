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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="button.css">
<link rel="stylesheet" href="table.css">
<link rel="stylesheet" href="overflow.css">
<link rel="stylesheet" href="popup.css">


<title>Products</title>
</head>
<body>


<script type="text/javascript">
	function confirmdelete() {
    	if (confirm('Are you sure you want to Delete this Requst')) {
    		return true;
		} else {
   			return false;
		}
    }
	
	function confirmupdate() {
    	if (confirm('Are you sure you want to Update this Requst')) {
    		return true;
		} else {
   			return false;
		}
    }
</script>


	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

	<div class="container mt-3">

		<h2>Products</h2>

		<p>Search here</p>

		<form class="search" action="/action_page.php">

			<div class="form-row">
				<div class="col-lg-11 lg-11">
					<input type="text" class="form-control"
						placeholder="Products name or Products ID">
				</div>

				<div class="col-lg-1 lg-1">
					<button type="#" class="btn btn-primary">Search</button>
				</div>
			</div>
		</form>
		<br>






		<div class="form-row">
			<div class="col-lg-6 lg-6">
				<div class="btn btn-primary">
					<a href="additem.jsp" class="btn btn-primary">Add</a>
				</div>
				
				<div class="btn btn-primary">
					<form target="_blank" method="post"
					action="Stockproducts_PDF.jsp">
					<button type="submit" class="btn btn-primary">
						<i class="fa fa-download"> </i>Report
					</button>
				</form>
				</div>
				
			</div>
			
			
			
			

			
		</div>
		<br>
			
			
			
						






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

					for (Stockproduct product : productList) {
				%>
				<tr>
					<div class="ex3">
						<td><input type="checkbox" class="case" name="case" value="1" />
						</td>
						<td><%=product.getPid()%></td>
						<td><%=product.getPname()%></td>
						<td><%=product.getCategory()%></td>
						<td><%=product.getQty()%></td>
						<td><%=product.getManufacture()%></td>
						<td><%=product.getPrice()%></td>
						<td>
					</div>
					<form method="POST" action="SelectItemServlet" onsubmit="return confirmupdate()">
						<input type="hidden" name="id" value="<%=product.getPid()%>">
						<button type="submit" class="btn btn-primary">Update</button>
					</form>
					</td>

					<td>
						<form method="post" action="DeleteProuductServlet" onsubmit="return confirmdelete()">
							<input type="hidden" name="delete" value="<%=product.getPid()%>">
							<button type="submit" class="btn btn-danger">Delete</button>
						</form>
				</tr>
				<%
					}
				%>

			</table>
		</div>





	</div>





</body>
</html>