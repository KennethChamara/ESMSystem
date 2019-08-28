<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>Add Salary</title>
</head>
<body>


	 <div class="row" style="margin-top:40px">
	 <div class="col-sm-2"></div>
	  <div class="col-sm-8">
	<div class="container">
	
  <h2>Add Salary</h2>
  <form action="AddSalaryServlet" method="post">
    <div class="form-group">
      <label for="usr">Employee:</label>
      <input type="text" class="form-control" id="usr" placeholder="Enter name" name="usr">
    </div>
    
     <div class="form-group">
      <label for="month">Month:</label>
      <input type="text" class="form-control" id="month" placeholder="Enter Month" name="month">
    </div>
    
    <div class="form-group">
      <label for="date">Date:</label>
      <input type="text" class="form-control" id="date" placeholder="Enter date" name="date">
    </div>
    
   
    
    <div class="form-group">
      <label for="amount">Amount:</label>
      <input type="text" class="form-control" id="amount" placeholder="Enter amount" name="amount">
    </div>
    
    
    <button type="submit" class="btn btn-primary">Submit</button>
    <button type="reset" class="btn btn-primary">Reset</button>
  </form>
  </div>
  
 </div>	
	</div>
	
</body>
</html>