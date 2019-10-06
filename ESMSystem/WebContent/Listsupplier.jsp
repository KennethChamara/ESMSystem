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
	<div class="row"style="margin-top:10px;">
		<div class="col-sm-1">
			<a href="supplier.jsp">
				<button type="button" class="btn btn-primary badge-pill">
					Back</button>
			</a>
		</div>
		<div class="col-sm-10"
			style="background-color: #ffffff; color: #111111;">
			<h1 style="text-align: center;">Supplier Details</h1>
			<div style="height: 560px; overflow-y: scroll">
				<table class="table table-hover" style="background-color: #ffffff;">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Company</th>
							<th scope="col">Supplier Name</th>
							<th scope="col">Address</th>
							<th scope="col">Phone</th>
							<th scope="col">Email Address</th>
							<th scope="col">Update/Delete</th>

						</tr>
					</thead>
					<%
						SupplierAnalyseService service = new SupplierAnalyseServiceIMPL(); 
						ArrayList<SupplierDetails> suppList = service.getSupplierdetailsList(); //ca

						for (SupplierDetails m : suppList) {
					%>
					<tbody>
						<tr>
							<th scope="row"><%=m.getCompanyName()%></th>
							<td class=="success"><%=m.getFullName()%></td>
							<td><%=m.getAddress()%></td>
							<td><%=m.getPhonenumber()%></td>
							<td><%=m.getEmailaddress()%></td>

							<td>
								<form method="POST" action="selectsupplierdetails">
									<input type="hidden" name="supplierid"
										value="<%=m.getSupplierId()%>">
									<button type="submit" class="btn btn-primary badge-pill">Update/Delete</button>
								</form>
							</td>




						</tr>
					</tbody>
					<%
						}
					%>
				</table>

			</div>
			</div>
		</div>
	</div>





	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>