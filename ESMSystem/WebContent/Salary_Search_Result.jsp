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
  <title>Salary Search</title>
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
  <h2>Search Result</h2>  </div>         
  <table class="table table-bordered" style="background-color: #ffffff;">
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
    <tbody>
      <%
      System.out.println("error in Search jsp1");
                      String result = (String) request.getAttribute("result");
      System.out.println("error in Search jsp2"); 
      SalaryServiceImpl isalaryeService = new SalaryServiceImpl();
  	ArrayList<Salary> arrayList = isalaryeService.searchSalary(result);
  	 System.out.println("error in Search jsp3");      	
                        	for(Salary salary : arrayList){
                        		System.out.println("error in Search jsp 4");  
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
  	
   <a href="salaryList.jsp"> <button type="button" class="btn btn-primary">Back</button></a>
    <button type="button" class="btn btn-primary">Next</button>
    </div>
  	    </div>
  	    <div class="col-sm-4">
    </div>
	</div>
	</div>
	</div>
	</div>
	<script type="text/javascript">
	document.getElementById("nvTwo").classList.remove('active');
	document.getElementById("nvThree").classList.add('active');
	document.getElementById("nvOne").classList.remove('active');</script>
	

</body>
</html>