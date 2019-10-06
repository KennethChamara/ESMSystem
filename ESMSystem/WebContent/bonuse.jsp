<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
   <link rel="stylesheet" href="benefits.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
.center{
    margin-left: 350px;
    margin-top: 50px;
}
</style>
<title>Bonuse</title>
</head>
<body>

	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	

	 
	<div class="container mt-3">
  <br>
   <div class="btn-group">
			<a href="bonuse.jsp"><button type="button" >Bonus</button></a>
			<button>Loan</button>
			<button>Insurance</button>
			<button>Promotion</button>
		</div>
  
  <br>  <br>
  
  <h2><b>Bonus</b></h2>
  
  
  <p>A bonus is extra money that an employee receives on top of his or her wages or salary. 
  The person may receive the extra payment for good performance. 
  Sometimes, all employees in a company receive extra money at a certain time of the year.</p>
  
  
   
    
    <div class= "center">
    
    <a href="addBonuse.jsp">  <button type="button" class="btn btn-primary" style = "padding:20px 50px ;">Add Bonus</button> </a>
    <a href="bonuseTable.jsp">  <button type="button" class="btn btn-primary" style = "padding:20px 75px;">Change</button> </a>
   
   
   
    
    </div>
      <br> <br>
    <p>Hint : Click the Add Bonus buttons and Enter the bonus.</p>
  	<p>Hint : Click the Change button and change bonus.</p>
    </div>

	
</body>
</html>