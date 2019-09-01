<%@page import="model.Income" %>
<%@page import="service.IncomeService" %>
<%@page import="java.util.*" %>

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
  
<title>Calculate Income</title>
</head>
<body>

	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<br/>
	<div class="container">
		<div class="row">
			<form action="NewFile.jsp" align="center">
				<h2 align="center">Total Incomes</h2><br/>
						<%
							double total=0;
							double ptotal=0;
							double etotal=0;
							double stotal=0;
							String p = "Project Income";
							String e = "e-Shop Income";
							String s = "Social Media Income";
							List<Income> list=IncomeService.getAllIncomes();
							
										for(Income inc : list){
											total=total+inc.getIamount();
										}
										for(Income i:list){
											String type = i.getItype();
											if(type.equalsIgnoreCase(p)){
												double val=i.getIamount();
												ptotal=ptotal+val;
											}
											else if(type.equalsIgnoreCase(e)){
												double val=i.getIamount();
												etotal=etotal+val;
											}else if(type.equalsIgnoreCase(s)){
												double val=i.getIamount();
												stotal=stotal+val;
											}else{
												return;
											}
										}
						%> 
						
					<div>
						<table class="table">
							<tr>
								<th><h3>Project Income</h3></th>
								<th><h3>Social Media Income</h3></th>
								<th><h3>e-Shop Income</h3></th>
								<th><h3>Total Income</h3></th>
							</tr>
							<tr>
								<th><h4><%= ptotal%></h4></th>
								<th><h4><%= stotal%></h4></th>
								<th><h4><%= etotal%></h4></th>
								<th><h4><%= total%></h4></th>
							</tr>
						</table>
					</div>
					<button type="submit" class="btn btn-primary">View Income Summary</button>
			</form>
		</div>
	</div>

</body>
</html>