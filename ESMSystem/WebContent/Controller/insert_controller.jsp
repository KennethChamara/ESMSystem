<%@page import="CRUD.Insert_values"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	String bill_type = request.getParameter("bill_type");
	String month = request.getParameter("month");
	String date = request.getParameter("date");
	String amount = request.getParameter("amount");
	String paidBy = request.getParameter("paidBy");
	
	Insert_values obj_insert = new Insert_values();
	obj_insert.insert_values(bill_type,month,date,amount,paidBy);


%>

Finished

</body>
</html>