<%@page import="model.Income" %>
<%@page import="model.IncomeService" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<% 
		Income income = (Income) request.getAttribute("i");
	%>
		
        <div class="container">
        	<div class="row">
        	
        		<form action='IncomeEditServlet2' method='get'>
        			<h2 align="center">Add Incomes</h2>
					
        	<table>
        		<tr><td></td><td><input type="hidden" name="id" value="<%=income.getId() %>"/></td></tr>
        		<tr><td>Name :</td><td><input type='text' name='name' value="<%=income.getIname() %>"/></td></tr>
        		<tr><td>Category :</td><td>
        			<select name='type' style='width:150px'>
        				<option>Project Income</option>
        				<option>Social Media Income</option>
        				<option>e-Shop Income</option>
        			</select>
        		</td></tr>
        		<tr><td>Amount :</td><td><input type='text' name='amount' value="<%=income.getIamount() %>"/></td></tr>
        		<tr><td colspan='2'><input type='submit' value='Edit & Save '/></td></tr>
        	</table>
        </form>
        	</div>
        </div>
       

</body>
</html>