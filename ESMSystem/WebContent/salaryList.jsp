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
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

  
  <div class="container">
  <h2>Employees Salary</h2>           
  <table class="table table-bordered">
    <thead>
      <tr>
        <th></th>
        <th>Name</th>
        <th>Month</th>
        <th>Amount</th>
        <th>Edit</th>
      </tr>
    </thead>
    <tbody>
      <%
            	IsalaryService isalaryeService = new SalaryServiceImpl();
                        	ArrayList<Salary> arrayList = isalaryeService.getSalarys();
                        	
                        	for(Salary salary : arrayList){
            %>
      <tr>
      <td><input type="checkbox" name="delete" value="delete"> </td>
        <td><%= salary.getEmpName() %></td>
        <td><%= salary.getMonth() %></td>
        <td><%= salary.getAmount() %></td>
        <td> <button class="btn btn-primary" type="submit" value="<%= salary.getSalaryID() %>">Edit</button></td>
        
      </tr>
      <%} %>
    </tbody>
  </table>
  		<div class="row">
  		<div class="col-sm-4"></div>
  		<div class="col-sm-4">
    <button type="button" class="btn btn-primary">Primary</button>
    <button type="button" class="btn btn-danger">Danger</button>
  	    </div>
  	    <div class="col-sm-4">
    </div>
	</div>
	</div>

</body>
</html>