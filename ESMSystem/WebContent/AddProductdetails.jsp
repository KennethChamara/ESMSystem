<%@page import="service.SupplierAnalyseServiceIMPL"%>
<%@page import="service.SupplierAnalyseService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.SupplierDetails"%>

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
	<h1>Add Purchased Product Details</h1>
	<hr class="hrcolor">

	<div class="row">
   
       <div class="col-md-6">
       	<p>Hint:add valid details into form,otherwise It makes some errors</p>
       	<p>Dont Duplicates details  already exist in the Database</p>
       	
       </div>

       <div class="col-md-6">
       
       <form method="POST" action="AddProductServlet">
       	
         <div class="form-group box">
         
         
         <div class="form-group">
         	<label>Company Name</label>
         	<select name="CompanyName" class="form-control">
         	 <%
         	SupplierAnalyseService service = new SupplierAnalyseServiceIMPL();  //create marksAnalyserviceImpl object
		 		 	ArrayList<SupplierDetails> suppList = service.getSupplierdetailsList();    //calling getstudentmarks method in marksanalyserviceIMPL
		 		 		
		 		 		 for(SupplierDetails m: suppList ){
		 		 			 
		 %>
         	
         	
         		<option value="<%=m.getCompanyName()%>"><%=m.getCompanyName()%></option>
  				
  				 <% } %>
			</select>
         		
         </div>
         
          <div class="form-group">
         	<label>Product Name</label><br>
         		<input type="text" class="form-control" name="ProductName" placeholder="productname">
         </div>

         

         <div class="form-group">
         	<label>Unit Price</label>
         	<input type="text" class="form-control" name="unitprice" placeholder="Add unit price">
         </div>


 <div class="form-group">
         	<label>Quantity</label>
         	<input type="text" class="form-control" name="quantity" placeholder="Purchased quantity for a product">
         </div>


<div class="form-group">
         	<label>Discount</label>
         	<input type="text" class="form-control" name="discount"placeholder="discount ">
         </div>



   <!-- 
<div class="form-group">
         	<label>Product Description</label>
         	<textarea  class="form-control" rows="4" placeholder="Brief introduction about the product.ex:what kind of product his is" name="description"></textarea>
         </div>
         
-->
         
         
         
         
         
         
         
         
         
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
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         