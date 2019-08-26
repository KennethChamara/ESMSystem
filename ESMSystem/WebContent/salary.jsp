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
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	 
	<div class="container">
  <h2>Add Salary</h2>
  <form action="">
    <div class="form-group">
      <label for="usr">Employee:</label>
      <input type="text" class="form-control" id="usr" placeholder="Enter name" name="usr">
    </div>
    
    <div class="form-group">
      <label for="usr">Date:</label>
      <input type="text" class="form-control" id="usr" placeholder="Enter date" name="usr">
    </div>
    
    <div class="form-group">
      <label for="usr">Month:</label>
      <input type="text" class="form-control" id="usr" placeholder="Enter Month" name="usr">
    </div>
    
    <div class="form-group">
      <label for="usr">Amount:</label>
      <input type="text" class="form-control" id="usr" placeholder="Enter amount" name="usr">
    </div>
    
    
    

    <button type="submit" class="btn btn-primary">Submit</button>
    <button type="reset" class="btn btn-primary">Reset</button>
  </form>
  </div>


</body>
</html>