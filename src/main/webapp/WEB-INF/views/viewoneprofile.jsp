<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View One Profile</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

	<br>

	<h1 style="margin: auto; width: 80%; text-align: center;">View One Profile</h1>

	<br>
	
	<table class="table table-striped" style="margin: auto; width: 80%;">
	
		<thead>
			<tr>
			<th>Username</th>
			<th>Password</th>
			<th>Email</th>
			<th>Phone</th>
			<th>Address</th>
			
			</tr>
		</thead>
		
		<tbody>
			<tr>
			<td>${profiledata.getUsername()}</td>
			<td>${profiledata.getPassword()}</td>
			<th>${profiledata.getEmail()}</th>
			<th>${profiledata.getPhone()}</th>
			<th>${profiledata.getAddress()}</th>
			
			</tr>
			
		</tbody>
	
	</table>
	

</body>
</html>