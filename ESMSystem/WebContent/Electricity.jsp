<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="common.User_Bean"%>
<%@page import="java.util.List"%>
<%@page import="CRUD.Read_Values"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Electricity</title>
		<link rel="stylesheet" type="text/css" href="expense_tab.css">
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  		<meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 15%;
  left: 0;
  background-color: #FFFFFF;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

		<span style="float: left; font-size:30px;cursor:pointer" onclick="openNav()">&#9776;  Other Expenses</span>
		<div id="mySidenav" class="sidenav">
  			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  			<a href="Rental.jsp"> Rental</a>
  			<a href="Electricity.jsp"> Electricity</a>
  			<a href="Internet.jsp"> Internet</a>
  			<a href="Water.jsp"> Water</a>
  			<a href="Other.jsp"> Other</a>
		</div>
		<script>
			function openNav() {
  			document.getElementById("mySidenav").style.width = "250px";
			}

			function closeNav() {
 			document.getElementById("mySidenav").style.width = "0";
			}
		</script>
			<br><br><br>
			<a href="Insert.jsp"><button type="button" class="btn-danger"> Insert Record</button> </a>
			<%
				Read_Values obj_read_values = new Read_Values();
			
				List<User_Bean> list = obj_read_values.get_values();
				
				Iterator<User_Bean> it_list = list.iterator();
				
			%>     
			<table>
				<thead>
					<tr>
						<th>Bill Type</th>
						<th>Month</th>
						<th>Date</th>
						<th>Amount</th>
						<th>Paid By</th>
						<th colspan="2">Action</th>
					</tr>
				</thead>
				<%
				while(it_list.hasNext()){
					User_Bean obj_User_Bean = new User_Bean();
					obj_User_Bean = it_list.next();
					
					if(obj_User_Bean.getBill_type()=="Electricity"){
						
				
				%>
			
				<tr>
						<td><%obj_User_Bean.getBill_type();%></td>
						<td><%obj_User_Bean.getMonth(); %></td>
						<td><%obj_User_Bean.getDate();%></td>
						<td><%obj_User_Bean.getAmount(); %></td>
						<td><%obj_User_Bean.getPaidBy(); %></td>
				<td>
						<a href="" class="del_btn">Edit</a>
						<a href="" class="edit_btn">Delete</a>
					</td>
				</tr>
				<%}} %>
			 </table>

</body>
</html>