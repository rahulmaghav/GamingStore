<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign Up</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
 
 <br/>
 <br/>
 <br/>


<div class="container">
  <h1>Sign Up</h1>
  <form action="index" method="post">
    
    <div class="form-group">
   
   <b>Name:</b><input type="text" class="form-control" placeholder="Enter name" name="Name"/><br/>
   <b>Email:</b><input type="email" class="form-control" placeholder="Enter email" name="Email"/><br/>
   <b>Phone Number:</b><input type="text" class="form-control" placeholder="Enter number" name="Phone Number"/>
   <b>Address:</b><input type="text" class="form-control" placeholder="Enter address" name="Address"/><br/>
   </div> 
   
   
   
    <button type="submit" class="btn btn-default">Submit</button>
  
  </form>
</div>


</br>
</br>
</br>
</br>


<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>





</body>
</html>