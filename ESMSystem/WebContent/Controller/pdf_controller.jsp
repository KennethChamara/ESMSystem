<%@page import="common.Create_PDF"%>
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
	String bill_Type = request.getParameter("bill_Type");

	Create_PDF obj_PDF = new Create_PDF();

	obj_PDF.generatePDF();

%>
<script type="text/javascript">

window.location.href = "/ESMSystem/OtherExpenses.jsp"

</script>

</body>
</html>