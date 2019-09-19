<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</head>
<body>
				<h2>Insert Attendence</h2>
				<formctt method="post" action="InsertAttendenceServlet">
					<div class="form-row">
						<div class="col-md-3 mb-3">
							<label for="validationServer02">Employee ID</label> <select
								class="custom-select border-primary badge-pill"
								id="inputGroupSelect02" style="width: 200px">
								<option selected>Choose...</option>
								<option value="1">One</option>
								<option value="2">Two</option>
								<option value="3">Three</option>
							</select>
						</div>
						<div class="col-md-3 mb-3">
							<label for="validationServer02">In Time</label> <input
								type="time" class="form-control border-primary badge-pill"
								id="validationServer02" required style="width: 200px">
						</div>
						<div class="col-md-3 mb-3">
							<label for="validationServer02">Out Time</label> <input
								type="time" class="form-control border-primary badge-pill"
								id="validationServer02" required style="width: 200px">
						</div>
						<div class="col-md-3 mb-3">
							<div style="position: absolute; right: 80px; bottom: 0;">
								<button class="btn btn-outline-primary badge-pill" type="submit"
									style="width: 150px">Insert</button>
							</div>
						</div>
					</div>

				</form>


				<table class="table table-bordered">
					<thead class="thead-dark">
						<tr>
							<th></th>
							<th>Employee ID</th>
							<th>In Time</th>
							<th>Out Time</th>
							<th>Update</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="checkbox" name="delete" value="delete">
							</td>
							<td>EP180615</td>
							<td><input type="time"
								class="form-control border-primary badge-pill"
								id="validationServer02" placeholder="Last name" required
								style="width: 200px" value="16:32"></td>
							<td><input type="time"
								class="form-control border-primary badge-pill"
								id="validationServer02" placeholder="Last name" value="16:32"
								required style="width: 200px"></td>
							<td><button class="btn btn-outline-success badge-pill"
									type="submit" style="width: 150px">Update</button></td>
							<td><button class="btn btn-outline-danger badge-pill"
									type="submit" style="width: 150px">Delete</button></td>
						</tr>



					</tbody>
				</table>
				<div class="row">
					<div class="col-sm-4"></div>
					<div class="col-sm-4">
						<button type="button" class="btn btn-primary">Primary</button>
						<button type="button" class="btn btn-danger">Danger</button>
					</div>
					<div class="col-sm-4"></div>
			
			</div>
</body>
</html>