<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

  
  <div class="container">
  <h2>Employees Salary</h2>           
  <table class="table table-bordered">
    <thead>
      <tr>
        <th></th>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Email</th>
        <th>Amount</th>
        <th>Edit</th>
      </tr>
    </thead>
    <tbody>
      <tr>
      <td><input type="checkbox" name="delete" value="delete"> </td>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
      <tr>
       <td><input type="checkbox" name="delete" value="delete"> </td>
        <td>Mary</td>
        <td>Moe</td>
        <td>mary@example.com</td>
      </tr>
      <tr>
       <td><input type="checkbox" name="delete" value="delete"> </td>
        <td>July</td>
        <td>Dooley</td>
        <td>july@example.com</td>
      </tr>
    </tbody>
  </table>
  		<div class="row">
  		<div class="col-sm-4"></div>
  		<div class="col-sm-4">
    <button type="button" class="btn btn-primary">Primary</button>
    <button type="button" class="btn btn-danger">Danger</button>
  	    </div>
  	    <div class="col-sm-4">
    </div>
	</div>
	

</body>
</html>