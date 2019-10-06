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
<title>Insert title here</title>
</head>
<body>
	<div style="height: 430px; overflow-y: scroll;">
	<div class="table-responsive">
		<table class="table table-bordered" style="background-color: #ffffff;">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Employee Name</th>
					<th scope="col">Number of date</th>
					<th scope="col">Possion</th>
					<th scope="col">deny</th>
					<th scope="col">More</th>

				</tr>
			</thead>
			<%
				leaveService addleave = new leaveSeviceIMPL();
				ArrayList<listleave> Listleave = addleave.getleves(2);

				for (listleave leave : Listleave) {
			%>
			<tbody>
				<tr>
					<th scope="row"><%=leave.getName()%></th>
					<td><%=leave.getNoOfDate()%></td>
					<td><%=leave.getPossion()%></td>

					<td>
						<form method="POST" action="denyRequestLeavesServlet">
							<input type="hidden" name="ID" value="<%=leave.getLeaveID()%>">
							<button type="submit" class="btn btn-danger badge-pill">deny</button>
						</form>
					</td>

					<td>
						<form method="POST" action="selectLeaveRequestServlet">
							<input type="hidden" name="ID" value="<%=leave.getLeaveID()%>">
							<input type="hidden" name="page" value="admin">
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
</body>
</html>