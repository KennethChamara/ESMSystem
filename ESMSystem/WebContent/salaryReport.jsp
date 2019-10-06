<!DOCTYPE html>
<%@page import="model.Salary"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.IsalaryService"%>
<%@page import="service.SalaryServiceImpl"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="en">

<head>
<title>Salary Report</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="row" style="margin-top: 40px">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">

			<div class="container">
			
				<div style="float: right; margin-bottom: 10px;">
					<form method="post" class="form-inline md-form mr-auto mb-4" action="GetMonthlySalaryServlet">
						<input type="search" class="form-control mr-sm-2" name="year" placeholder="Year"/>	
						<select class="custom-select border-primary badge-pill" name="month"
							style="width: 200px" name="month">
							<option value="">This month</option>
							<option value="January">January</option>
							<option value="February">February</option>
							<option value="March">March</option>
							<option value="April">April</option>
							<option value="May">May</option>
							<option value="June">June</option>
							<option value="July">July</option>
							<option value="August">August</option>
							<option value="September">September</option>
							<option value="October">October</option>
							<option value="November">November</option>
							<option value="December">December</option>
						</select>

						<button class="btn btn-outline-success badge-pill" type="submit"
							style="width: 150px">Search</button>
					</form>
				</div>
			
		
				<h2>Monthly Salary</h2>

				<table class="table table-bordered">
					<thead>
						<tr>
							<th></th>
							<th>Name</th>
							<th>Month</th>
							<th>Amount</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
						<%
							System.out.println("error in Search jsp1");
							String year = (String) request.getAttribute("year");
							String month = (String) request.getAttribute("month");
							
							SalaryServiceImpl isalaryeService = new SalaryServiceImpl();
							ArrayList<Salary> arrayList = isalaryeService.searchSalaryMonthly(year,month);
							System.out.println("error in Search jsp3");
							for (Salary salary : arrayList) {
								
						%>
						<tr>
							<td><input type="checkbox" name="select"
								value="<%=salary.getSalaryID()%>" /></td>
							<td><%=salary.getEmpName()%></td>
							<td><%=salary.getMonth()%></td>
							<td><%=salary.getAmount()%></td>
							<td><form method="post" action="GetSalaryServlet">
									<button class="btn btn-primary" type="submit" name="salaryID"
										value="<%=salary.getSalaryID()%>">Edit</button>
								</form></td>
							<td>
								<form method="post" action="DeleteSalaryServlet" name="DeleteFrom" onsubmit="return deleteConfrometion()">
									<button type="submit" name="delete"
										value="<%=salary.getSalaryID()%>" class="btn btn-danger badge-pill" style="width: 100px; margin-bottom: 10px;">Delete</button>
								</form>
							</td>

						</tr>
						<%
							}
						%>
					</tbody>
				</table>
				<div class="row">
					<div class="col-sm-4"></div>
					<div class="col-sm-4">

						<div class="btnFlex">

							<a href="salaryList.jsp"><button type="button" class="btn btn-primary">Back</button></a>
							<a href="Reports/Monthly_Salary_report_PDF.jsp?year=<%=year%>&month=<%=month %>"  target="_blank"><button class="btn btn-danger badge-pill" style="width: 100px; margin-bottom: 10px;"><i class="fa fa-download"> </i>PDF</button></a>
						</div>
					</div>
					<div class="col-sm-4"></div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>