<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Profile</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

	<br>

	<h1 style="margin: auto; width: 80%; text-align: center;">Add Profile</h1>

	<br>
	
	<form:form action="AddProfileToDB" method="post" style="margin: auto; width: 80%; text-align: center;" modelAttribute="Profile">
	
		<form:input path="username" type="text" placeholder="UserName" class="form-control" name="profile"/>
	    <form:errors path="username"/>
	    
		<br>
		
		<form:input path="password" type="password" placeholder="Password" class="form-control" name="profile"/>
	    <form:errors path="password"/>
	
		<br>
		
		<form:input path="confirmpassword" type="password" placeholder="ConfirmPassword" class="form-control" name="profile"/>
	    <form:errors path="confirmpassword"/>
		
		<br>
		
		<form:input path="email" type="email" placeholder="Email" class="form-control" name="profile"/>
	    <form:errors path="email"/>
		<br>
		
		<form:input path="phone" type="number" placeholder="Phone" class="form-control" name="profile"/>
	    <form:errors path="phone"/>
		<br>
		
		<form:textarea path="address" placeholder="Address" class="form-control" name="profile"></form:textarea>
		<form:errors path="address"/>
		<br>
		
		<input type="submit" value="Add" class="btn btn-danger"/>
	
	</form:form>






</body>
</html>