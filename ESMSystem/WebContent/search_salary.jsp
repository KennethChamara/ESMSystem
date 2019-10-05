<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">


<title>Salary_Search</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">


<link rel="stylesheet"
	href="https://formden.com/static/cdn/bootstrap-iso.css" />

<link rel="stylesheet"
	href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="search.css">

</head>
<body>


	<div class="topnav">
		<a id="nvOne" class="active" href="salary.jsp">ADD Salary</a> <a id="nvTwo" 
			href="salaryList.jsp">Salary Details</a> 
			<a id="nvThree" href="Salary_Search_Result.jsp">Search
			Details</a>
		<div class="Search">
			<form class="form-inline md-form mr-auto mb-4" method="post" action="SearchSalServlet">
				<input name="searchatb" class="form-control mr-sm-2" type="text" placeholder="Search"
					aria-label="Search">
				<button class="btn aqua-gradient btn-rounded btn-sm my-0"
					type="submit">Search</button>
			</form>
		</div>

	</div>



</body>
</html>