<%@page import="CRUD.Edit_values"%>
<%@page import="common.User_Bean"%>
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
	String bill_ID = request.getParameter("bill_ID");
	String bill_type = request.getParameter("bill_type");
	String month = request.getParameter("month");
	String date = request.getParameter("date");
	String amount = request.getParameter("amount");
	String paidBy = request.getParameter("paidBy");
	
	User_Bean obj_User_Bean = new User_Bean();
	obj_User_Bean.setBill_ID(bill_ID);
	obj_User_Bean.setBill_type(bill_type);
	obj_User_Bean.setMonth(month);
	obj_User_Bean.setDate(date);
	obj_User_Bean.setAmount(amount);
	obj_User_Bean.setPaidBy(paidBy);
	
	Edit_values obj_Edit_values = new Edit_values();
	obj_Edit_values.edit_user(obj_User_Bean);


%>
<script type="text/javascript">

window.location.href = "/ESMSystem/Insert.jsp"

</script>


</body>
</html>