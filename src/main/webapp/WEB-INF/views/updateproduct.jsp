<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Product</title>

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


	<h1 style="margin: auto; width: 80%; text-align: center;">Update Product</h1>

	<br>
	
	
	
	<form:form action="${pageContext.request.contextPath}/UpdateProductToDB" method="post" style="margin: auto; width: 80%; text-align: center;"  enctype="multipart/form-data" modelAttribute="Product">
	
		<form:input path="pid" type="hidden" name="product" />
	    <form:errors path="pid"/>
	
		<form:input path="name" type="text" placeholder="Name" class="form-control" name="product"/>
		<form:errors path="name"/>
		<br>
		
		<form:textarea path="description" placeholder="Description" class="form-control" name="product"></form:textarea>
	    <form:errors path="description"/>
		<br>
		<br>
		<br>
		<!--<input type="text" placeholder="Category" value="${productdata.getCategory()}" class="form-control" name="product">-->
	
	
	 <form:select path="category" >
			<c:forEach items="${catnames }" var="x">
			<option value="${x.getName()}" title="${x.getDescription()}" >${x.getName()} </option>
		</c:forEach>
		</form:select>
	   <form:errors path="category"/>
	    <br>
		<br>
	    <br>
		
		<form:input  path="price" type="number" placeholder="Price" class="form-control" />
	    <form:errors path="price"/>
		<br>
		
		<form:input path="image" type="hidden"/>
		
      <img src="${Product.getImage()}" style="width:20%;">		
		<form:input path="theImage" type="file" name="file" accept="image/jpg" class="form-control"  style="width:100%;"/>
		<form:errors path="theImage"/>
		<br>
		
			
		

        <form:input path="suppliername" type="text" placeholder="Supplier Name" class="form-control" name="suppliername" />
	    <form:errors path="suppliername"/>
	    
		<br>

        <form:input path="quantity" type="number" placeholder="Quantity" class="form-control" name="quantity" />
	    <form:errors path="quantity"/>
	   	<br>



		<br>
	 	<br>
	    <br>
		
		<input type="submit" value="Update" class="btn btn-primary">




	
	</form:form>


  <br>
  <br>
  <br>


 <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</body>
</html>