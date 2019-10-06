<%@page import="java.util.List" %>
<%@page import="model.Income" %>
<%@page import="service.IncomeService" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

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
<script>
   
</script>
<title>Income Management</title>

</head>
<body>

<script src="incomeJS.js"></script>
<jsp:include page="/WEB-INF/header.jsp"></jsp:include><br/>

	<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-3 col-xs-3">
				
					<h2 align="center">Add Incomes</h2><hr/>
					
					<form action="IncomeSaveServlet" method="post" onsubmit="return IncomeValidate()" name="incForm">
					
						<div class="form-group">
							<label class="control-label">Name :</label>
							<input type="text" class="form-control" name="incName" placeholder="Enter Income Name">
							<span id="nameloc" style="color:red"></span>
						</div>
						
						<div class="form-group">
							<label class="control-label">Category :</label>
								<select class="form-control" name="type">
									<option>Project Income</option>
									<option>Social Media Income</option>
									<option>e-Shop Income</option>
								</select>
						</div>
						
						<div class="form-group">
							<label class="control-label">Amount :</label>
							<input type="text" class="form-control" name="amount" placeholder="Enter amount">
							<span id="numloc" style="color:red"></span>
						</div>
						
						<div class="form-group">
							<label class="control-label" for="date">Date :</label>
							<input class="form-control" autocomplete="off" id="date" name="date" placeholder="MM/DD/YYYY" type="text"/>
							<span id="dateloc" style="color:red"></span>
						</div>
						
						<!--  <div class="form-group">
      						<label for="month">Month:</label>
     
							<select name="month" class="form-control">
  								<option value="Janury">January</option>
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
     					</div> -->
						
						<div class="form-group">
							<button type="submit" class="btn btn-primary">Submit</button>
    						<button type="reset" class="btn btn-info">Reset</button>
						</div>
						
					</form>
				</div>
		
				<div class="col-md-9 col-sm-9 col-xs-9">
								
					<h2 align="center">Income Summary</h2><hr/>
						
						<div class="table-responsive">
						<div class="tableFixHead">
							<table  class="table" id="table1">
								<thead class="th">	<tr>
											<th>Name</th>
											<th>Type</th>
											<th>Amount</th>
											<th>Date</th>
											<th>Edit</th>
											<th>Delete</th>
								</tr></thead>
								<tbody class="tb">
									<%
										List<Income> list=IncomeService.getAllIncomes();
										for(Income i:list){
									%>
										<tr>
					         				<td class="td"><%= i.getIname() %></td>
					         				<td class="td"><%= i.getItype() %></td>
					         				<td class="td"><%= i.getIamount() %></td>
					         				<td class="td"><%= i.getIdate() %></td>
					         				<td class="td"><a  href="IncomeEditServlet?id=<%= +i.getId() %>">edit</a></td>
					         				<td class="td"><a  href="IncomeDeleteServlet?id=<%= +i.getId() %>">delete</a></td>
					         			</tr>
					         		<% } %>	
								</tbody>
							</table>
						</div>
						</div><br/>
						<form action="incomeCalc.jsp">
							<button type="submit" class="btn btn-primary">Calculate Total Income</button>
							<p>*When click this button you can get the calculated total incomes</p>
						</form>

					</div>
			</div>
		</div>

</body>
</html>