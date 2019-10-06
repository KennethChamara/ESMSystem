<%@page import="model.leave"%>
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
	<div class="table-responsive">
		<div style="height: 450px; overflow-y: scroll;">
			<table class="table" style="background-color: #ffffff;">
				<thead class="thead-dark">
					<tr>
						<th scope="col">Leave ID</th>
						<th scope="col">Start Date</th>
						<th scope="col">End Date</th>
						<th scope="col">Type</th>
						<th scope="col">Edit</th>

					</tr>
				</thead>
				<%
					leaveService addleave = new leaveSeviceIMPL();
					ArrayList<leave> Listleave = addleave.getRequestedlevesOfAemployee("002ID");

					for (leave leave : Listleave) {
				%>
				<tbody>
					<tr>
						<td><%=leave.getLeaveID()%></td>
						<td><%=leave.getStartDate()%></td>
						<td><%=leave.getEndDate()%></td>
						<td><%=leave.getLeaveType()%></td>
						<td><form method="POST" action="selectLeaveRequestServlet">
								<input type="hidden" name="ID" value="<%=leave.getLeaveID()%>">
								<input type="hidden" name="page" value="user">
								<button type="submit" class="btn btn-primary btn-sm">
									<span class="glyphicon glyphicon-plus"></span> Edit
								</button>
							</form></td>
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