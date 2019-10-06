<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="employees.css">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script type="text/javascript">

function validateName() {
	var type = document.forms["myForm"]["empname"].value;
	if (type == "") {
		document.getElementById("name").style.border = "solid 2px red";
		return false;
	} else {
		  var regName = /^[a-zA-Z]+ [a-zA-Z]+$/;
		  
		    if(!regName.test(type)){
		        alert('Please enter full name (first & last name).');
		      //  document.getElementById('empname').focus();
		        return false;
		    }else{
		    	
		    	document.getElementById("name").style.border = "0px";
				return true;
		    	
	    }
		
	}
	
	 
	    
}

function validateGender() {
	var type = document.forms["myForm"]["Gender"].value;
	if (type == "") {
		document.getElementById("gender").style.border = "solid 2px red";
		return false;
	} else {
		document.getElementById("gender").style.border = "0px";
		return true;
	}
}

function validateAddress() {
	var type = document.forms["myForm"]["Address"].value;
	if (type == "") {
		document.getElementById("address").style.border = "solid 2px red";
		return false;
	} else {
		document.getElementById("address").style.border = "0px";
		return true;
	}
}

function validateDesignaton() {
	var type = document.forms["myForm"]["Designaton"].value;
	if (type == "") {
		document.getElementById("designaton").style.border = "solid 2px red";
		return false;
	} else {
		document.getElementById("designaton").style.border = "0px";
		return true;
	}
}
</script>
</head>
<body>


	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

	<div class="container mt-4">
		<h1>New Employee Registration</h1>



		<form method="POST" name="myForm"
			onsubmit="return validateName() && validateGender() && validateAddress() && validateDesignaton()"
			action="addemployerdetails">


			<!-- <input type="text" name="Emp_ID" id="name" placeholder="Emp_ID"/>-->


			<div class="form-row">
				<div class="col-lg-2 lg-2"></div>
				<div class="col-lg-8 lg-8">
					<input type="text" style="margin-top: 45px; width: 75%;"
						name="empname" id="name" placeholder="Name" />
				</div>
				<div class="col-lg-2 lg-2"></div>
			</div>
			<div class="form-row">
				<div class="col-lg-2 lg-2"></div>
				<div class="col-lg-8 lg-8">
					<input type="text" style="margin-top: 45px; width: 75%;"
						name="Email" id="email" placeholder="Email" />
				</div>
				<div class="col-lg-2 lg-2"></div>
			</div>
			<div class="form-row">
				<div class="col-lg-2 lg-2"></div>
				<div class="col-lg-8 lg-8">
					<input type="text" style="margin-top: 45px; width: 75%;"
						name="Gender" id="gender" placeholder="Gender" />
				</div>
				<div class="col-lg-2 lg-2"></div>
			</div>
			<div class="form-row">
				<div class="col-lg-2 lg-2"></div>
				<div class="col-lg-8 lg-8">
					<input type="text" style="margin-top: 45px; width: 75%;"
						name="Address" id="address" placeholder="Address" />
				</div>
				<div class="col-lg-2 lg-2"></div>
			</div>
			<div class="form-row">
				<div class="col-lg-2 lg-2"></div>
				<div class="col-lg-8 lg-8">
					<input type="text" style="margin-top: 45px; width: 75%;"
						name="Designaton" id="designaton" placeholder="Designaton" />
				</div>
				<div class="col-lg-2 lg-2"></div>
			</div>
			<div class="form-row">
				<div class="col-lg-2 lg-2"></div>
				<div class="col-lg-8 lg-8">
					<button type="submit" class="btn btn-primary badge-pill"
						style="margin-top: 45px; width: 75%;">Submit</button>
				</div>
				<div class="col-lg-2 lg-2"></div>
			</div>



			<p>
				By clicking Register, you agree on our <a href="#">terms and
					condition</a>.
			</p>

		</form>
	</div>



	<!--  <div class="wrapper" style="position:relative ; right: 450px">
    <form class="form-signin" action="curremp" method="post">       
      <h2 class="form-signin-heading">Proceed current Employees</h2>
      <input type="text" class="form-control" name="Emp_ID" placeholder="Employee ID"/>
      <input type="password" class="form-control" name="password" placeholder="Password"/>      
      <label class="checkbox">
        <input type="checkbox" value="remember-me" id="rememberMe" name="rememberMe"> Remember me
      </label>
       <input type="submit" value="insert"/>
    </form>
  </div>
  -->
	<!-- 
  			<div class="pemp">
  			<form method="post" action="Listemployee" style="position:relative ; left:1030px ; top:-300px; background-color:#4CAF50; border: 1px solid green; color:white; padding:9px 120px; text-decoration:none; display:inline-block; font-size:16px; curser:pointer;">
  				<button type="submit" class="button" >List Employee</button>
 	</form>
  				<a href="index.jsp" class="button" style="positon:relative; top:-300px ; right:1250px">previous</a>
  			
  			
  			
  			</div>
			 -->

</body>
</html>