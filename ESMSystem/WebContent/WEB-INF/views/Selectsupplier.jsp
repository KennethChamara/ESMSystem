<%@page import="model.SupplierDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.4/css/bootstrap.min.css" rel="stylesheet">
 <link rel="stylesheet" type="text/css" href="custom.css" />
	<script src="https://kit.fontawesome.com/d6b8fe8225.js"></script>

<title>Insert title here</title>
</head>
<body>
		<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

<%
	SupplierDetails mks = (SupplierDetails) request.getAttribute("details");		//fetching values from SelectmarksServlet
%>
	
	<div class="container contact-form">
	<h1> Supplier Details Update/Delete</h1>
	<hr class="hrcolor">

	<div class="row">
   
       <div class="col-md-6">
       	<p>Hint:</p>
       	<p>Dont add Supplier details greater than the limit size </p>
       	
       </div>

       <div class="col-md-6">
       
       <form method="POST" action="UpdateSupplierServlet">
       	
         <div class="form-group box">
         	<label>Full Name</label><br>
         		<input type="text" class="form-control"name="FullName" value="<%=mks.getFullName()%>">
         </div>

         <div class="form-group">
         	<label>Company Name</label>
         	<input type="text" class="form-control" name="CompanyName" value="<%=mks.getCompanyName()%>">
         </div>

         <div class="form-group">
         	<label>Address</label>
         	<input type="text" class="form-control" name="address" value="<%=mks.getAddress()%>">
         </div>


 <div class="form-group">
         	<label>Phone Number</label>
         	<input type="text" class="form-control" name="phonenumber" value="<%=mks.getPhonenumber()%>">
         </div>


<div class="form-group">
         	<label>Email Address</label>
         	<input type="text" class="form-control" name="emailaddress" value="<%=mks.getEmailaddress()%>">
         </div>


	



         <div class="form-group">
         <label></label>
         <input type="hidden" name="supplierId"
			value="<%=mks.getSupplierId()%>" />
         	<button class="btn btn-primary btn-block">Update</button>
         </div>
			
			</form>
			
			
			<form method="post" action="Supplierdeleteservlet">	
			<div class="form-group">
         	<label></label>
         	<input type="hidden" name="supplierId"
				value="<%=mks.getSupplierId()%>" />
         	<button class="btn btn-primary btn-block">Delete</button>
         </div>
			
			</form>
			
       </div>

    </div>

</div>
	
	
	
	
	
	
	
	
	
	
	



</body>
</html>