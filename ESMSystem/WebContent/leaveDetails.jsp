<%@page import="model.listleave"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>
<style>
td {
	margin: 25px;
	padding: 15px;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css"
	rel="stylesheet" type="text/css" />
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>

</head>
<html>
<head>
<meta charset="ISO-8859-1">
<title>More details of leave</title>
</head>
<body>

	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="container mt-3">
		<div align="center">
			<h2 style="text-align: center;">Request leaves</h2>
			<%
				listleave leave = (listleave) request.getAttribute("listleave");
			%>
			<table align="center">
				<tr>
					<td><label>Employee Name : </label> <input
						class="form-control" type="text" readonly name="Name"
						value="<%=leave.getName()%>" /></td>

					<td><label>Posion : </label> <input class="form-control"
						type="text" readonly name="Posssion"
						value="<%=leave.getPossion()%>" /></td>
				</tr>
				<tr>
					<td><label>from : </label> <input class="form-control"
						type="text" readonly name="formDate"
						value="<%=leave.getStartDate()%>" /></td>
					<td><label>To : </label> <input class="form-control"
						type="text" readonly name="toDate" value="<%=leave.getEndDate()%>" /></td>
				</tr>
				<tr>
					<td colspan="2"><label>Leave Type : </label> <input
						class="form-control" type="text" readonly name="toDate"
						value="<%=leave.getLeaveType()%>" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="form-group shadow-textarea">
							<label for="exampleFormControlTextarea6">Reson for the
								Leave</label>
							<textarea class="form-control z-depth-1"
								id="exampleFormControlTextarea6" cols="80" rows="5"
								name="reason" readonly><%=leave.getReason()%></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<td style="text-align: center;"><form method="POST"
							action="ApproveLeaveServlet">
							<input type="hidden" name="ID" value="<%=leave.getLeaveID()%>">
							<button type="submit" class="btn btn-primary badge-pill"
								style="width: 200px;">Approve</button>
						</form></td>
					<td style="text-align: center;"><form method="POST"
							onsubmit="return confirmf()" action="denyRequestLeavesServlet">
							<input type="hidden" name="page" value="admin"> <input
								type="hidden" name="ID" value="<%=leave.getLeaveID()%>">
							<button type="submit" class="btn btn-danger badge-pill"
								style="width: 200px;">deny</button>
						</form></td>
				</tr>
			</table>
		</div>
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