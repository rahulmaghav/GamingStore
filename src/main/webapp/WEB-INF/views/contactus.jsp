<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Contact Us</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



</head>
<body>

<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

</br>
</br>


	<br>

	<h1 style="margin: auto; width: 80%; text-align: center;">Contact Us</h1>

	<br>
	
	<form action="" method="post" style="margin: auto; width: 60%; text-align: center;">
	
    
    
    <input type="text" class="form-control" placeholder="Enter name" name="Name"/>
	
    <br>   
  
    <input type="email" class="form-control" placeholder="Enter email" name="Email"/>
    
    <br>


    <input type="text" class="form-control" placeholder="Enter phone number" name="Phone Number"/>
    
    <br>

    <textarea placeholder="Enter message" class="form-control" name="Message"></textarea>
	
	<br>
	

		
	<button type="submit" class="btn btn-success">Submit</button>
    
    <br>
    
    
	</form>



</br>
</br>
</br>
</br>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>






</body>
</html>