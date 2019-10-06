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
<link rel="stylesheet" href="front.css">
<link rel="stylesheet" href="button.css">


<script>
function Validate(){
	var item = document.incForm.itemname.value;
	var category = document.incForm.category.value;
	var qnt = document.incForm.Quntity.value;
	var manufacture = document.incForm.manufacture.value;
	var price = document.incForm.price.value;

	if(item==""||item==null){
		document.getElementById("itemmsg").innerHTML="*Plese enter the item name";
		return false;
	}else if(category==""||category==null){
		document.getElementById("cat").innerHTML="*Plese enter the category";
		return false;
	}else if(qnt==""||qnt==null){
		document.getElementById("qntt").innerHTML="*Plese enter the Quentitye";
		return false;
	}else if(manufacture==""||manufacture==null){
		document.getElementById("manu").innerHTML="*Plese enter the Manufacture";
		return false;
	}else if(price==""||price==null){
		document.getElementById("pri").innerHTML="*Plese enter the Price";
		return false;
	}else{
		return true;
	}	
}


</script>


<title>Add Item</title>
</head>
<body>


	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	

			<div class="btn btn-primary mt-3">			
	 		<a href ="Stockproducts.jsp" class="btn btn-primary">Back</a>
			</div>
			
	<div class="container mt-3">
	


		<h2>Add Item</h2>

		<form method="post" name="incForm" onsubmit = "return Validate();" action="AddItemPoductServlet">

			<div class="form-group">
				<label for="item">Item name:</label> <input type="text"
					class="form-control" id="item" placeholder="Enter name"
					name="itemname">
					<span id="itemmsg" style="color:red"></span>
					
			</div>

			<div class="form-group">
				<label for="category">Category:</label> <input type="text"
					class="form-control" id="category" placeholder="Enter category"
					name="category" >
					<span id="cat" style="color:red"></span>
					
			</div>

			<div class="form-group">
				<label for="qnt">Quntity:</label> <input type="text"
					class="form-control" id="qnt" placeholder="Enter qnt" name="Quntity">
				<p id="demo"></p>
				<span id="qntt" style="color:red"></span>
			
					
			</div>

			<div class="form-group">
				<label for="manufacture">Manufacture:</label> <input type="text"
					class="form-control" id="manufacture"
					placeholder="Enter manufacture" name="manufacture">
					<span id="manu" style="color:red"></span>
					
			</div>

			<div class="form-group">
				<label for="price">Price:</label> <input type="text"
					class="form-control" id="price" placeholder="Enter price"
					name="price">
					<span id="pri" style="color:red"></span>
					
			
			</div>


			<div class="form-group">
				<label for="image">Image:</label><br> <input type="file"
					class="btn btn-primary" value="fileupload" id="fileupload"
					placeholder="Attach" name="fileupload">
			</div>
			

			<button type="submit" class="btn btn-primary">Submit</button>

			<button type="reset" class="btn btn-primary">Reset</button>
			

			
			
		</form>
	</div>

</body>
</html>