<!DOCTYPE html>
<html lang="en">
<head>
  <title>SalaryTab</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />
  <script type="text/javascript" src="https://formden.com/static/cdn/formden.js"></script>
  <link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />

</head>
<body>
<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
<div class="container mt-3">
  <!-- Search form -->
	<jsp:include page="/search_salary.jsp"></jsp:include>
  <br>
  <!-- Nav tabs -->


  <!-- Tab panes -->
  <div class="tab-content">
    <div id="home" class="container tab-pane active"><br>
     <jsp:include page="/salaryList.jsp"></jsp:include>
       
      
    </div>
  
    
  </div>
</div>

</body>
</html>