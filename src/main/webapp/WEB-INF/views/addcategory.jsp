<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Category</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<br>

	<h1 style="margin: auto; width: 80%; text-align: center;">Add Category</h1>

	<br>
	
	<form action="AddCategoryToDB" method="post" style="margin: auto; width: 80%; text-align: center;">
	
		<input type="text" placeholder="Name" class="form-control" name="category">
	
		<br>
		
		<textarea placeholder="Description" class="form-control" name="category"></textarea>
	
		<br>
		
		<input type="submit" value="Add" class="btn btn-danger">
	
	</form>


</body>
</html>