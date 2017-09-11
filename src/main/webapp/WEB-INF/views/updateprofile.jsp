<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Profile</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style>

#grad1{

	background: linear-gradient(to top, rgba(25, 115, 175, 0), rgba(25, 115, 175, 1))
}

</style>

</head>

<body id="grad1">
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
 
 <br>
 <br>
 <br>

	<br>

	<h1 style="margin: auto; width: 80%; text-align: center;">Update Profile</h1>

	<br>
	
	<form action="${pageContext.request.contextPath}/UpdateProfileToDB" method="post" style="margin: auto; width: 80%; text-align: center;">
	
		<input type="hidden" value="${profiledata.getId()}" name="profile" >
	
		<input type="text" placeholder="Username" value="${profiledata.getUsername()}" class="form-control" name="profile">
	
			
		<br>
		
		<input type="password" placeholder="Password" value="${profiledata.getPassword()}" class="form-control" name="profile">
	
		<br>
		
		<input type="email" placeholder="Email" value="${profiledata.getEmail()}" class="form-control" name="profile">
		
		<br>
		
		<input type="number" placeholder="Phone" value="${profiledata.getPhone()}" class="form-control" name="profile">
	
		<br>
		
		<textarea placeholder="Address" class="form-control" name="profile">${profiledata.getAddress()}</textarea>
		
		<br>
		
		<input type="submit" value="Update" class="btn btn-primary">
	
	</form>


  <br>
  <br>
  <br>

 <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</body>
</html>