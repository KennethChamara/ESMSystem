<%@page import="common.User_Bean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<title>Other Expenses</title>
		<link rel="stylesheet" type="text/css" href="main_style.css">
		<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

</head>
<body>
		<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
		
		<h1 style="text-align: center;">Other Expenses Details</h1>
		<div class="container">
			<div class="box">
				<div class="icon">
					<a href="Rental.jsp"><i class="fa fa-home" aria-hidden="true"></i></a></div>
				<br><br><br><br><br><br>
						<h1 style="text-align: center;">Rental</h1>
			</div>
			<div class="box">
				<div class="icon">
					<a href="Electricity.jsp"><i class="fa fa-bolt" aria-hidden="true"></i></a></div>
				<br><br><br><br><br><br>
						<h1 style="text-align: center;">Electricity</h1>
			</div>	
			<div class="box">
				<div class="icon">
					<a href="Internet.jsp"><i class="fa fa-internet-explorer" aria-hidden="true"></i></a></div>
				<br><br><br><br><br><br>
						<h1 style="text-align: center;">Internet</h1>
			</div>
			<div class="box">
				<div class="icon">
					<a href="Water.jsp"><i class="fa fa-tint" aria-hidden="true"></i></a></div>
				<br><br><br><br><br><br>
						<h1 style="text-align: center;">Water</h1>
			</div>	
			<div class="box">
				<div class="icon">
					<a href="Other.jsp"><i class="fa fa-money" aria-hidden="true"></i></a></div>
				<br><br><br><br><br><br>
						<h1 style="text-align: center;">Other</h1>
			</div>
			<div class="box">
				<div class="icon">
				<%
						User_Bean obj_user_bean = new User_Bean();
				
				%>
					<a href="Create_PDF.jsp"><i class="fa fa-file-pdf-o" aria-hidden="true"></i></a></div>
				<br><br><br><br><br><br>
						<h1 style="text-align: center;font-size:40px;">Generate Report</h1>
						<!--Controller/pdf_controller.jsp?bill_Type=<%//=obj_user_bean.getBill_ID() %>-->
			</div>			
		</div>

</body>
</html>