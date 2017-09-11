<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
button {
    width: 100%;
}

</style>


<style>

#grad1{

	background: linear-gradient(to top, rgba(25, 115, 175, 0), rgba(25, 115, 175, 1))
}

</style>

</head>

<body id="grad1">
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
 
 <br/>
 <br/>
 <br/>




	<br>

	<h1 style="margin: auto; width: 80%; text-align: center;">Login to Your Account</h1>

	<br>
	
	<form action="login" method="post" style="margin: auto; width: 60%; text-align: center;">
	
    
    
    <input type="text" class="form-control" placeholder="Enter username" name="UserName"/>
	
    <br>   
  
    <input type="password" class="form-control" placeholder="Enter password" name="Password"/>
    
    <br>
		
	<button type="submit" class="btn btn-primary">Login</button>
    
    <br>
    
    
    <input type="checkbox" checked="checked"> Remember me

    
	</form>





</br>
</br>
</br>
</br>


<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>




</body>
</html>