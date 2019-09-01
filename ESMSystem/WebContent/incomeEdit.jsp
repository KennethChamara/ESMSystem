<%@page import="model.Income" %>
<%@page import="service.IncomeService" %>

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
  <link rel="stylesheet" href="/ITP_Final_Project/income.css" type="text/css">
  
  
   <script type="text/javascript">
  	function validate(){
  		var num=document.myform.amount.value;
  		
  		if(num==""||num==null){
  			document.getElementById("numloc").innerHTML="Plese enter the income amount";
  			return false;
  		}
  		else{
  			if(isNaN(num)){
  	  			document.getElementById("numloc").innerHTML="Enter numeric value only";
  	  			return false;
  	  		}else{
  	  			return true;
  	  		}
  		}
  		
  	}
  </script>

<title>Insert title here</title>
</head>
<body>

	<jsp:include page="/WEB-INF/header.jsp"></jsp:include><br/>
	<% 
		Income income = (Income) request.getAttribute("i");
	%>
		
        <div class="container">
        	<div class="row">
        	
        		<form action='IncomeEditServlet2' method='get' class="form-horizontal col-lg-8 col-md-8 col-sm-8 col-xs-12" name="myform"onsubmit="return validate()" align="center">
        			<h2 align="center">Edit Income</h2><hr/>
					
        	<table>
        		<tr><td></td><td><div class="form-group"><input type="hidden" name="id" value="<%=income.getId() %>"/></div></td></tr>
        		<tr><td>Name :</td><td><div class="form-group"><input type='text' class="form-control" name='name' value="<%=income.getIname() %>"/></div></td></tr>
        		<tr><td>Category :</td><td><div class="form-group">
        			<select name='type' class="form-control" style='width:150px'>
        				<option>Project Income</option>
        				<option>Social Media Income</option>
        				<option>e-Shop Income</option>
        			</select>
        		</div></td></tr>
        		<tr><td>Amount :</td><td><div class="form-group"><input type='text' class="form-control" name='amount' value="<%=income.getIamount() %>"/><span id="numloc" style="color:red"></span></div></td></tr>
        		<tr><td colspan='2'><div class="form-group"><input type='submit' class="btn btn-primary" value='Edit & Save '/></div></td></tr>
        	</table>
        </form>
        	</div>
        		
        	</div>
        
       

</body>
</html>