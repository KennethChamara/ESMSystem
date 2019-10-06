<%@page import="model.listleave"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.leaveSeviceIMPL"%>
<%@page import="service.leaveService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Request leaves</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
</head>
<body>
<div style="height: 430px; overflow-y: scroll;">
	<table class="table table-bordered" style="background-color: #ffffff;">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Employee Name</th>
				<th scope="col">Number of date</th>
				<th scope="col">Designation</th>
				<th scope="col">Approve</th>
				<th scope="col">deny</th>
				<th scope="col">More</th>

			</tr>
		</thead>

		<tbody>
			<%
				leaveService addleave = new leaveSeviceIMPL();
				ArrayList<listleave> Listleave = addleave.getleves(1);

				for (listleave leave : Listleave) {
			%>
			<tr>
				<th scope="row"><%=leave.getName()%></th>
				<td><%=leave.getNoOfDate()%></td>
				<td><%=leave.getPossion()%></td>

				<td>
					<form method="POST" action="ApproveLeaveServlet">
						<input type="hidden" name="ID" value="<%=leave.getLeaveID()%>">
						<button type="submit" class="btn btn-primary badge-pill">Approve</button>
					</form>
				</td>
				<td>
					<form method="POST" action="denyRequestLeavesServlet" onsubmit="return confirmf()">
                        <input type="hidden" name="ID" value="<%=leave.getLeaveID()%>">
                        <input type="hidden" name="page" value="admin">
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
			<%
				}
			%>
		</tbody>

	</table>
</div>
<script type="text/javascript">
	function confirmf() {
    	if (confirm('Are you sure you want to deny this Requst')) {
    		return true;
		} else {
   			return false;
		}
    }
</script>
</body>
</html>