<!DOCTYPE html>
<%@page import="model.Salary"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.IsalaryService"%>
<%@page import="service.SalaryServiceImpl"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
  <h2>Employees Salary</h2> 
    
  <table class="table table-bordered" >
  
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
    <button type="submit" name="delete" value="<%=salary.getSalaryID()%>" class="btn btn-danger">Delete</button>
    </form></td>
        
      </tr>
      <%} %> 
      
    </tbody>
 	
  </table>
 
  		<div class="row">
  		<div class="col-sm-4"></div>
  		<div class="col-sm-4">
  		
  	<div class="btnFlex">
  	
    <form method="post" class="form-inline md-form mr-auto mb-4" action="GetMonthlySalaryServlet">
				<input type="search" class="form-control mr-sm-2" name="year" placeholder="Year"/>	
				<input type="search" class="form-control mr-sm-2" name="month" placeholder="month"/>
				<button type="submit" class="btn aqua-gradient btn-rounded btn-sm my-0">search</button>
			</form>
    </div>
  	    </div>
  	    <div class="col-sm-4">
    </div>
	</div>
	</div>
	</div>
	</div>
	

</body>
</html>