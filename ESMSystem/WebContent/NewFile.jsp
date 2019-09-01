<%@page import="java.sql.Connection" %>
<%@page import="model.Income" %>
<%@page import="service.IncomeService" %>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager" %>
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
  <link rel="stylesheet" href="income.css">
<style>
</style>
  
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
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<br/>
	
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<h2 align="center">Add Incomes</h2><hr/>
				<form action="IncomeSaveServlet" method="post" name="myform" onsubmit="return validate()">
					<div class="form-group">
						<label>Name :</label>
      					<input type="text" class="form-control" name="incName" placeholder="Enter Income Name" required>
      					
					</div>
					
					<div class="form-group">
						<label>Category :</label>
							<select class="form-control" name="type">
								<option>Project Income</option>
								<option>Social Media Income</option>
								<option>e-Shop Income</option>
							</select>
					</div>
					
					
					<div class="form-group">
						<label>Amount :</label>
      					<input type="text" class="form-control" name="amount" placeholder="Enter amount" >
						<span id="numloc" style="color:red"></span>
					</div><br/>
			
						<button type="submit" class="btn btn-primary">Submit</button>
    					<button type="reset" class="btn btn-info">Reset</button>
				</form><br/>
			</div>
			<div class="vl"></div>
			<div class="col-md-8">
				<h2 align="center">Income Summary</h2>
					
					<div class="table-responsive">
						<table  class="table" id="table1"> 
					<thead>	<tr>
							<th id="A">Id</th>
							<th>Name</th>
							<th>Type</th>
							<th>Amount</th>
							<th>Edit</th>
							<th>Delete</th>
					</tr></thead>
					<tbody>
						<%
							List<Income> list=IncomeService.getAllIncomes();
										for(Income i:list){
						%>  
					         <tr>
					         	<td id="A"><%= i.getId() %></td>
					         	<td><%= i.getIname() %>+</td>
					         	<td><%= i.getItype() %></td>
					         	<td><%= i.getIamount() %></td>
					         	<td><a  href="IncomeEditServlet?id=<%= +i.getId() %>">edit</a></td>
					         	<td><a  href="IncomeDeleteServlet?id=<%= +i.getId() %>">delete</a></td>
					         </tr> 
					       <% }
						%>
					</tbody>
					</table>
					</div>
					<form action="incomeCalc.jsp" align="right">
					<button type="submit" class="btn btn-primary">Calculate Total Income</button>
					</form>
			</div>
		</div>
	</div>
	
	
</body>
</html>