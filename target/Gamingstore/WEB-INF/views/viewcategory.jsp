<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Category</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>


	<br>

	<h1 style="margin: auto; width: 80%; text-align: center;">View Category</h1>

	<br>
	
	<table class="table table-striped" style="margin: auto; width: 80%;">
	
		<thead>
			<tr>
			<th>Name</th>
			<th>Description</th>
			<th>View</th>
			<th>Update</th>
			<th>Delete</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${categorydata}" var="x">
			<tr>
			<td>${x.getName()}</td>
			<td>${x.getDescription()}</td>
			<td><a href="ViewOneCategory/${x.getCatid()}" class="btn btn-primary">View</a></td>
			<td><a href="UpdateOneCategory/${x.getCatid()}" class="btn btn-success">Update</a></td>
			<td><a href="DeleteOneCategory/${x.getCatid()}" class="btn btn-danger">Delete</a></td>
			</tr>
			</c:forEach>
		</tbody>
	
	</table>


</body>
</html>