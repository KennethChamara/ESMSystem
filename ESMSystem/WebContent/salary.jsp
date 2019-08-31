<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<% //In case, if User session is not set, redirect to Login page.
if((request.getSession(false).getAttribute("admin")== null) )
{
%>
<jsp:forward page="index.jsp"></jsp:forward>
<%} %>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />
  <script type="text/javascript" src="https://formden.com/static/cdn/formden.js"></script>
  <link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />
   <link rel="stylesheet" href="front.css">
   
   <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- Isolated Version of Bootstrap, not needed if your site already uses Bootstrap -->
<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

<!-- Bootstrap Date-Picker Plugin -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
<title>Add Salary</title>
</head>
<body>
	<script src="front.js"></script>
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

	 <div class="row" style="margin-top:40px">
	 <div class="col-sm-2"></div>
	  <div class="col-sm-8">
	<div class="container">
	
  <h2>Add Salary</h2>
  <form name="myForm" action="AddSalaryServlet" method="post" onsubmit="return validateForm()">
    <div class="form-group">
      <label for="usr">Employee:</label>
      <input type="text" class="form-control" id="usr" placeholder="Enter name" name="usr" >
    </div>
    
     <div class="form-group">
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
     
    </div>
    
    <div class="form-group">
      <label for="date">Date:</label>
      <div class="bootstrap-iso">
 
       <div class="input-group">
        <div class="input-group-addon">
         <i class="fa fa-calendar">
         </i>
        </div>
        <input class="form-control" id="date" name="date" placeholder="MM/DD/YYYY" type="text" />
       </div>
      </div>
  
     <div class="form-group">
      <div class="col-sm-10 col-sm-offset-2">
       <input name="_honey" style="display:none" type="text"/>
    
      </div>

</div>
  
    </div>
    
   
    
    <div class="form-group">
      <label for="amount">Amount:</label>
      <input type="text" class="form-control" id="amount" placeholder="Enter amount" name="amount" >
    </div>
    
    
    <button type="submit" class="btn btn-primary">Submit</button>
    <button type="reset" class="btn btn-primary">Reset</button>
  </form>
  </div>
  
 </div>	
	</div>
	
	
	 

	
</body>
</html>