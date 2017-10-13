<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View One Product</title>

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

	<h1 style="margin: auto; width: 80%; text-align: center;">View One Product</h1>

	<br>
	
	<table class="table table-striped" style="margin: auto; width: 80%;">
	
		<thead>
			<tr>
			<th>Name</th>
			<th>Description</th>
			<th>Category</th>
			<th>Price</th>
			<th>Image</th>
			<th>Quantity</th>
			</tr>
		</thead>
		
		<tbody>
			<tr>
			<td>${productdata.getName()}</td>
			<td>${productdata.getDescription()}</td>
			<td>${productdata.getCategory()}</td>
			<td>${productdata.getPrice()}</td>
			<td><img src="${productdata.getImage()}" style="height:50px; width:50px;"></td>
			<td>${productdata.getQuantity()}</td>
			</tr>
			
		</tbody>
	
	</table>
	
	
	<form action="${pageContext.request.contextPath}/AddCartToDB" method="post">
	
		<input type="hidden" value="${productdata.getPid()}" name="id">
		
		<br>
		<br>
		<input type="number" placeholder="Quantity" class="form-control" name="quantity" style="margin: auto;  width: 10%; text-align: center;">
		<br>    
    	<button type="submit" class="btn btn-success" style=" float:left; margin-left:50px; margin-top:23px">AddToCart</button>	
	
	</form>
	
  <br>
  <br>
  <br>

 <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</body>
</html>