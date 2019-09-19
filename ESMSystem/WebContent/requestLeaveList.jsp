<%@page import="model.listleave"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.leaveSeviceIMPL"%>
<%@page import="service.leaveService"%>
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
<title>List Requested Leave</title>
</head>
<body>
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	
	
	
	<div class="row">
		<div class="col-sm-2"><a href="LeaveTab.jsp">
		<button type="button" class="btn btn-success badge-pill"
			style="position: fixed; left: 25px; top: 70px; width: 150px;">Back</button>
	</a></div>
		<div class="col-sm-8">
			<div class="container mt-3 col-sm-12">
				<h1 style="text-align: center;">Request leaves</h1>
				<table class="table" style="background-color: #ffffff;">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Employee Name</th>
							<th scope="col">Number of date</th>
							<th scope="col">Possion</th>
							<th scope="col">Approve</th>
							<th scope="col">deny</th>
							<th scope="col">More</th>

						</tr>
					</thead>
					<%
						leaveService addleave = new leaveSeviceIMPL();
						ArrayList<listleave> Listleave = addleave.getleves();

						for (listleave leave : Listleave) {
					%>
					<tbody>
						<tr>
							<th scope="row"><%=leave.getName()%></th>
							<td><%=leave.getNoOfDate()%></td>
							<td><%=leave.getPossion()%></td>

							<td>
								<form method="POST" action="ApproveLeaveServlet">
									<input type="hidden" name="ID"
										value="<%=leave.getLeaveID()%>">
									<button type="submit" class="btn btn-primary badge-pill">Approve</button>
								</form>
							</td>
							<td>
								<form method="POST" action="denyRequestLeavesServlet">
									<input type="hidden" name="ID"
										value="<%=leave.getLeaveID()%>">
									<button type="submit" class="btn btn-danger badge-pill">deny</button>
								</form>
							</td>

							<td>
								<form method="POST" action="selectLeaveRequestServlet">
									<input type="hidden" name="ID"
										value="<%=leave.getLeaveID()%>">
									<button type="submit" class="btn btn-primary btn-sm">
										<span class="glyphicon glyphicon-plus"></span> More
									</button>
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
		<div class="col-sm-2"></div>
	</div>


</body>
</html>