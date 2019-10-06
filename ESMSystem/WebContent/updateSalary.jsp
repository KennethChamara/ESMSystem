<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="model.Salary"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%
	//In case, if User session is not set, redirect to Login page.
	if ((request.getSession(false).getAttribute("Admin") == null)) {
%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
	}
%>

<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="front.css">
<title>Add Salary</title>
</head>
<body>
		<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

	<%
		Salary salary = (Salary) request.getAttribute("salary");
	%>

	 <div class="row" style="margin-top:40px">
	 <div class="col-sm-2"></div>
	  <div class="col-sm-8">
	<div class="container">
	
  <h2>Add Salary</h2>
  <form action="UpdateSalaryServlet" name="myForm" method="post" onsubmit="return validateForm()">
    <div class="form-group">
      <label for="usr">Employee:</label>
      <input type="text" class="form-control" id="usr" value="<%=salary.getEmpName() %>" name="usr">
      <p id="msgEmp"></p>
    </div>
    
     <div class="form-group">
      <label for="month">Month:</label>
      <input type="text" class="form-control" id="month" value="<%=salary.getMonth() %>" name="month">
    </div>
    
    <div class="form-group">
      <label for="date">Date:</label>
      <input type="text" class="form-control" id="date" value="<%=salary.getDate() %>" name="date">
   p<p id="msgDate"></p>
    </div>
    
   
    <div class="form-group">
      <label for="amount">Amount:</label>
      <input type="text" class="form-control" id="amount" value="<%=salary.getAmount() %>" name="amount">
      <p id="msgSal"></p>
    </div>
    
    
    <button type="submit" class="btn btn-primary" value="<%=salary.getSalaryID() %>" name="btn">UPDATE</button>
    <button type="reset" class="btn btn-primary">Reset</button>
   <a href="salaryList.jsp"> <button type="button" class="btn btn-primary">Back</button></a>
  </form>
  </div>
  
 </div>	
	</div>
	
</body>
</html>