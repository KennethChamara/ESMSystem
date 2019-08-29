<%@page import="service.SupplierAnalyseServiceIMPL"%>
<%@page import="service.SupplierAnalyseService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.SupplierDetails"%>
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
			<div class="col-sm-2">
		</div>
		<div class="col-sm-8"
			style="background-color: #ffffff; color: #111111;">
			<h1 style="text-align: center;">Supplier Details</h1>
				<table class="table" style="background-color:#ffffff;">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Company Name</th>
				<th scope="col">Supplier Name</th>
				<th scope="col">Address</th>
				<th scope="col">Phone Number</th>
				<th scope="col">Email Address</th>
				
				
			</tr>			
	</thead>
		<%
		SupplierAnalyseService service = new SupplierAnalyseServiceIMPL();  //create marksAnalyserviceImpl object
		 	ArrayList<SupplierDetails> suppList = service.getSupplierdetailsList();    //ca
			
		 	for(SupplierDetails m: suppList ){
	 			 
		%>
	<tbody>	
		<tr>
				<th scope="row"><%=m.getCompanyName() %></th>
				<td><%=m.getFullName() %></td>
				<td><%=m.getAddress()%></td>
				<td><%=m.getPhonenumber()%></td>
				<td><%=m.getEmailaddress()%></td>
				<td><%=m.getAddress()%></td>
				<td>
				<form method="POST" action="selectsupplierdetails">
				<input type="hidden" name="supplierid" value="<%=m.getSupplierId() %>">
				<button type="submit" class="btn btn-primary badge-pill" >Update/Delete</button>
				</form> </td>
				
				
				
			
					</tr>		
		</tbody>
			<%} %>	
	</table>
		</div>
		<div class="col-sm-2">
		<button><a href="supplier.jsp">Back</a></button>
		</div>
	</div>
		
				
				



</body>
</html>