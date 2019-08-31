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
  
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	
	<div class="container">
		<div class="row">
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
											if(type.equals(p)){
												double val=i.getIamount();
												ptotal=ptotal+val;
											}
											else if(type.equals(e)){
												double val=i.getIamount();
												etotal=etotal+val;
											}else if(type.equals(s)){
												double val=i.getIamount();
												stotal=stotal+val;
											}
										}
						%> 
						
						<h3>Total Income : </h3><hr/>
						<h4><%= total%></h4><hr/>
						
						<h3>Project Income : </h3><hr/>
						<h4><%= ptotal%></h4><hr/>
						
						<h3>Social Media Income : </h3><hr/>
						<h4><%= etotal%></h4><hr/>
						
						<h3>e-Shop Income : </h3><hr/>
						<h4><%= stotal%></h4><hr/>
		</div>
	</div>

</body>
</html>