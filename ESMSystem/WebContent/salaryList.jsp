<!DOCTYPE html>
<%@page import="model.Salary"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.IsalaryService"%>
<%@page import="service.SalaryServiceImpl"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	//In case, if User session is not set, redirect to Login page.
	if ((request.getSession(false).getAttribute("Admin") == null)) {
%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
	}
%>

<html lang="en">

<head>
  <title>List Salary</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="front.css">
</head>
<body>
<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
 	<div class="row" style="margin-top:40px">
	 <div class="col-sm-1"></div>
	  <div class="col-sm-10">
	
  <div class="container">
   <jsp:include page="/search_salary.jsp"></jsp:include>
   <div class="col-lg-7 lg-7">
  <h2>Employees Salary</h2> </div>
    
  <table class="table table-bordered" style="background-color: #ffffff;" >
  
    <thead class="thead-dark">
      <tr>
        <th></th>
        <th>Name</th>
        <th>Month</th>
        <th>Amount</th>
        <th>Edit</th>
        <th>Delete</th>
      </tr>
    </thead>
   
    <tbody >
    
   
      <%
            	IsalaryService isalaryeService = new SalaryServiceImpl();
                        	ArrayList<Salary> arrayList = isalaryeService.getSalarys();
                        	
                        	for(Salary salary : arrayList){
            %>
      <tr>
      <td><input type="checkbox" name="select" value="<%=salary.getSalaryID()%>"/> </td>
        <td><%= salary.getEmpName() %></td>
        <td><%= salary.getMonth() %></td>
        <td><%= salary.getAmount() %></td>
        <td><form method="post" action="GetSalaryServlet">
         <button class="btn btn-primary" type="submit"  name="salaryID" value="<%=salary.getSalaryID() %>">Edit</button>
         </form>
         </td>
         <td> <form method="post" action="DeleteSalaryServlet" name="DeleteFrom" onsubmit="return deleteConfrometion()">
    <button type="submit" name="delete" value="<%=salary.getSalaryID()%>" class="btn btn-danger badge-pill">Delete</button>
    </form></td>
        
      </tr>
      <%} %> 
      
    </tbody>
 	
  </table>
 
  		<div class="row">
  		<div class="col-sm-4"></div>
  		<div class="col-sm-4">
  		
  	<div class="btnFlex">
  	
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
    </div>
  	    </div>
  	    <div class="col-sm-4">
    </div>
	</div>
	</div>
	</div>
	</div>
	<script type="text/javascript">
	document.getElementById("nvTwo").classList.add('active');

	document.getElementById("nvThree").classList.remove('active');
	document.getElementById("nvOne").classList.remove('active');
	</script>

</body>
</html>