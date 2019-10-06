<%@page import="model.Income" %>
<%@page import="model.IncomeCalc" %>
<%@page import="service.IncomeService" %>
<%@page import="java.util.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">	
	
	<!-- Isolated Version of Bootstrap -->
		<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />
	
	<!--  jQuery -->
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
	

	<!-- Bootstrap Date-Picker Plugin -->
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

	<link rel="stylesheet" href="front.css">		
	<link rel="stylesheet" href="income.css">

</head>
<body>

	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<br/>
	<div class="container" style="height:525px">
		<div class="row">
			<div class="col-md-7 col-sm-7 col-xs-7">
			
				<h4 align="center">Incomes Calculated Monthly by Category</h4><hr/>
				
				<div class="table-responsive">
				<div class="tableFixHead" style="width:600px">
					
					<table  class="table" id="table1">
					<thead class="th">	
						<tr>
							<th>Income Categories</th>
							<th>Month</th>
							<th>Year</th>
							<th>Total Incomes</th>
						</tr>
					</thead>
					<tbody class="tb">
						<%
							List<IncomeCalc> list=IncomeService.getOrderdIncomes();
							for(IncomeCalc i : list){
								String value = i.getMonth();
								String found = i.findMonth(value);
						%>
						<tr>
					         <td class="td"><%= i.getType() %></td>
					         <td class="td"><%= found %></td>
					         <td class="td"><%= i.getYear() %></td>
					         <td class="td"><%= i.getTotal() %></td>
					     </tr>
					       <% } %>	
					</tbody>
			</table>
					
				</div>
			</div><br/>

				<form action="totalIncomePDF.jsp">
						<button type="submit" class="btn btn-primary">Download PDF</button>
				</form>
			
			</div>
			<div class="col-md-5 col-sm-5 col-xs-5">
				<h4 align="center">Incomes Calculated Monthly</h4><hr/>
				
				<div class="table-responsive">
					<div class="tableFixHead" style="width:400px">
						<table  class="table" id="table1">
					<thead>	
						<tr>
							<th>Month</th>
							<th>Year</th>
							<th>Total Income</th>
						</tr>
					</thead>
					<tbody>
						<%
							List<IncomeCalc> list2=IncomeService.getTotalIncomes();
							for(IncomeCalc i : list2){
								String value = i.getMonth();
								String found = i.findMonth(value);
						%>
						<tr>
					         <td class="td"><%= found %></td>
					         <td class="td"><%= i.getYear() %></td>
					         <td class="td"><%= i.getTotal() %></td>
					     </tr>
					       <% } %>
					</tbody>
				</table>
					</div>
				</div><br/>
				
					<form action="totalIncomePDF2.jsp">
						<button type="submit" class="btn btn-primary">Download PDF</button>
					</form>
				
			</div>
		</div>
	</div>
</body>
</html>