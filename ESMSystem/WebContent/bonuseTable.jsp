<%@page import="model.Bonuse"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.bonuseServiceIMPL"%>
<%@page import="service.bonuseService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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

<title>Bonus Table</title>
</head>
<body>


	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>



	<div class="container mt-3">



		<div class="col-sm-12"
			style="background-color: #ffffff; color: #111111;">
			<h1 style="text-align: center;">Bonus Table</h1>
			<table class="table" style="background-color: #ffffff;">
				<thead class="thead-dark">
					<tr>
						<th scope="col">B_ID</th>
						<th scope="col">E_ID</th>
						<th scope="col">Employee Name</th>
						<th scope="col">Type</th>
						<th scope="col">Salary</th>
						<th scope="col">Rate</th>
						<th scope="col">Bonus</th>
						<th scope="col">Net Salary</th>
						
						<th scope="col">Update</th>
						<th scope="col">Delete</th>

					</tr>
					<%
						bonuseService service = new bonuseServiceIMPL();
						ArrayList<Bonuse> BonuseList = service.getbounce();

						for (Bonuse bonuse : BonuseList) {
					%>
					<tr>
						<td><%=bonuse.getBid()%></td>
						<td><%=bonuse.getEid()%></td>
						<td><%=bonuse.getEname() %></td>
						<td><%=bonuse.getType()%></td>
						<td><%=bonuse.getSalary()%></td>
						<td><%=bonuse.getRate()%>%</td>
						<td><%=bonuse.getAmount()%></td>
						<td><%=bonuse.getNetsalary()%></td>
						<td><form method="post" action="SelectBonusServelet">
								<input type="hidden" name="id" value="<%=bonuse.getBid()%>">
								<button type="submit" class="btn btn-primary">Update</button>
							</form></td>
						<td>
							<form method="post" action="DeleteBonusServlet">
								<input type="hidden" name="id" value="<%=bonuse.getBid()%>">
								<button type="submit" class="btn btn-primary">Delete</button>
							</form>
						</td>
					</tr>
					<%
						}
					%>
				
			</table>
		</div>
		<div class="col-sm-2"></div>
	</div>
















</body>
</html>