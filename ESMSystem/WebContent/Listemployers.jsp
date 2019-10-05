<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="service.EmployeeService"%>
<%@page import="service.EmployeeServiceIMPL"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.EmployeeDetails"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>


	<div class="container mt-3">
		<div class="form-row">
			<div class="col-lg-10 lg-10">
				<h1 style="text-align: center;">Employee Details</h1>
			</div>
					<form action="SearchEmpServlet" method="post" name="searchForm">
			<input type="search" name="empSearch" />
			<button type="submit"></button>
			</form>
			<div class="col-lg-2 lg-2">
	
				<form target="_blank" method="post" action="EmployeePDF.jsp">
					<input type="hidden" name="ID" value="003ID">
					<button type="submit" class="btn btn-primary badge-pill"
						style="width: 150px">
						<i class="fa fa-download"> </i>Report
					</button>
				</form>
				
			</div>
		</div>

		<div class="table-responsive">
			<table class="table table-bordered"
				style="background-color: #ffffff;">
				<thead class="thead-dark">
					<tr>
						<th style="width: 100px">Name</th>
						<th>Email</th>
						<th style="width: 80px">Gender</th>
						<th style="width: 110px">Address</th>
						<th style="width: 150px">Designation</th>
						<th>Delete</th>
						<th>Select</th>
					</tr>
				</thead>

				<tbody>
					<%
					String search;
					if(request.getAttribute("search")!=null){
				 search=request.getAttribute("search").toString();
					}else{
				search=null;
					}
						EmployeeService ser = new EmployeeServiceIMPL();
						ArrayList<EmployeeDetails> empLi = ser.getemployeedetailsList(search);

						for (EmployeeDetails m : empLi) {
					%>
					<tr>
						<td style="width: 100px"><%=m.getEmpName()%></td>
						<td><%=m.getEmpEmail()%></td>
						<td style="width: 80px"><%=m.getEmpGender()%></td>
						<td style="width: 110px"><%=m.getEmpAddress()%></td>
						<td style="width: 150px"><%=m.getEmpDesignation()%></td>

						<td>
							<form method="POST" action="employeedelete" onsubmit="return deleteValidation();">
								<input type="hidden" id="dlt" name="empID" value="<%=m.getEmpID()%>">
								<button type="submit" class="btn btn-danger badge-pill">Delete</button>
							</form>
						</td>
						<td>
							<form method="POST" action="SelectEmployee">
								<input type="hidden" name="empID" value="<%=m.getEmpID()%>">
								<button type="submit" class="btn btn-success badge-pill">Select</button>
							</form>
						</td>




					</tr>
					<%
						}
					%>
				</tbody>

			</table>
		</div>
	</div>

<script type="text/javascript">
function deleteValidation(){
var z = confirm("Do you want to proceed?");
if (z == true) {
  return true;
} else {
	return false;
}
}
</script>
</body>
</html>