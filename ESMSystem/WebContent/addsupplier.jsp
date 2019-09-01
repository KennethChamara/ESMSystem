
<!DOCTYPE html>
<html lang="en">
<head>
<title>Insert title here</title>
<meta charset="UTF-8">

  <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.4/css/bootstrap.min.css" rel="stylesheet">
 <link rel="stylesheet" type="text/css" href="custom.css" />
	<script src="https://kit.fontawesome.com/d6b8fe8225.js"></script>


	    


   



</head>
<body >
			<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
<div class="container contact-form">
	<h1>Add Supplier Details</h1>
	<hr class="hrcolor">

	<div class="row">
   
       <div class="col-md-6">
       	<p>Hint:add valid details into form,otherwise It makes some error</p>
       	<p>Dont add Supplier details who already exist in the Database</p>
       	
       </div>

       <div class="col-md-6">
       
       <form method="POST" action="AddSupplierdetailsServlet">
       	
         <div class="form-group box">
         	<label>Full Name</label><br>
         		<input type="text" class="form-control"name="FullName" placeholder="Supplier Full name">
         </div>

         <div class="form-group">
         	<label>Company Name</label>
         	<input type="text" class="form-control" name="CompanyName" placeholder="Supplier company Name">
         </div>

         <div class="form-group">
         	<label>Address</label>
         	<input type="text" class="form-control" name="address" placeholder="Supplier Company Address">
         </div>


 <div class="form-group">
         	<label>Phone Number</label>
         	<input type="text" class="form-control" name="phonenumber" placeholder="Phone number">
         </div>


<div class="form-group">
         	<label>Email Address</label>
         	<input type="text" class="form-control" name="emailaddress"placeholder="email address">
         </div>










         <div class="form-group">
         <label></label>
         	<button class="btn btn-primary btn-block">Send</button>
         	<input type="reset" class="btn btn-primary btn-block" value="Reset" class="reset-button">
         </div>
			
			
			</form>
			
       </div>

    </div>

</div>



 
</body>
</html>