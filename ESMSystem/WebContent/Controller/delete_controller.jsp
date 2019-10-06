<%@page import="CRUD.Delete_values"%>
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
	
	Delete_values obj_Delete_values = new Delete_values();
	obj_Delete_values.delete_value(bill_ID);

%>
<script type="text/javascript">

window.location.href = "/ESMSystem/Insert.jsp"

</script>


</body>
</html>