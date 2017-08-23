<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Product</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

	<br>

	<h1 style="margin: auto; width: 80%; text-align: center;">Update Product</h1>

	<br>
	
	
	
	<form action="${pageContext.request.contextPath}/UpdateProductToDB" method="post" style="margin: auto; width: 80%; text-align: center;"  enctype="multipart/form-data">
	
		<input type="hidden" value="${productdata.getPid()}" name="product" >
	
		<input type="text" placeholder="Name" value="${productdata.getName()}" class="form-control" name="product">
	
		<br>
		
		<textarea placeholder="Description" class="form-control" name="product">${productdata.getDescription()}</textarea>
	
		<br>
		<br>
		<br>
		<!--<input type="text" placeholder="Category" value="${productdata.getCategory()}" class="form-control" name="product">-->
	
	 <select>
			<c:forEach items="${catnames }" var="x">
			<option value="${x.getName()}" title="${x.getDescription()}" >${x.getName()} </option>
		</c:forEach>
		</select>
	   
	    <br>
		<br>
	    <br>
		
		<input type="number" placeholder="Price" value="${productdata.getPrice()}" class="form-control" name="product">
	
		<br>
		
      <img src="${productdata.getImage()}" style="width:20%;">		
		<input type="file" name="file" accept="image/jpg" class="form-control"  style="width:100%;">
		
		<br>
		
			
		
		<br>
	 	<br>
	    <br>
		
		<input type="submit" value="Update" class="btn btn-primary">
	
	</form>

</body>
</html>