<%@page import="model.Income" %>
<%@page import="service.IncomeService" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	
	<!--  jQuery -->
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
	

	<!-- Bootstrap Date-Picker Plugin -->
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

	<link rel="stylesheet" href="front.css">

<script>

</script>

<title>Insert title here</title>
</head>
<body>

<script src="incomeJS.js"></script>
<jsp:include page="/WEB-INF/header.jsp"></jsp:include><br/>

		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sd-3">
				<h2 align="left">Available Data</h2><hr/>
							<div class="table-responsive">
							
								<table  class="table" id="table1" style="border: 1px solid #ddd !important;">
									<tbody>
									<%
										Income income = (Income) request.getAttribute("i");
									%>
											<tr><th>Name :</th></tr>
											<tr><td><%= income.getIname() %></td></tr>
											<tr><th>Category :</th></tr>
					         				<tr><td><%= income.getItype() %></td></tr>
					         				<tr><th>Amount :</th></tr>
					         				<tr><td><%= income.getIamount() %></td></tr>
					         				<tr><th>Date :</th></tr>
					         				<tr><td><%= income.getIdate() %></td></tr>
									</tbody>
								</table>
							</div>
				</div>
			<div class="col-md-9 col-sd-9">
			<h2 align="left">Edit Income</h2><hr/>
			<form action='IncomeEditServlet2' method='get' onsubmit="return incomeEditValidate()" name="incEditForm">
					
        				<div class="form-group">
        					<input type="hidden" name="id" value="<%=income.getId() %>"/>
        				</div>
        				
        				<div class="form-group">
        					<label class="control-label">Name :</label>
        					<input type='text' class="form-control" name="name" value="<%=income.getIname() %>"/>
        					<span id="nameloc" style="color:red"></span>
        				</div>
        				
        				<div class="form-group">
        					<label class="control-label">Category :</label>
        					<select name="type" class="form-control">
        						<option style="font-weight:bold;color:#09C;"><%=income.getItype() %></option>
        						<option>Project Income</option>
        						<option>Social Media Income</option>
        						<option>e-Shop Income</option>
        					</select>
        				</div>
        				
        				<div class="form-group">
        					<label class="control-label">Amount :</label>
        					<input type="text" class="form-control" name="amount" value="<%=income.getIamount() %>"/>
        					<span id="numloc" style="color:red"></span>
        				</div>
        				
        				<div class="form-group">
							<label class="control-label" for="date">Date :</label>
							<input class="form-control" id="date" name="date" value="<%=income.getImonth() %>" placeholder="MM/DD/YYY" type="text"/>
							<span id="dateloc" style="color:red"></span>
						</div>
						
						<!--  <div class="form-group">
      						<label for="month">Month:</label>
     
							<select name="month" class="form-control">
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
     					</div> -->
        				
        				<div class="form-group">
        					<input type="submit" class="btn btn-primary" value="Edit & Save"/>
        				</div>
        			
			</form>
		</div></div></div>
</body>
</html>