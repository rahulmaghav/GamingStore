<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>

<style>

#grad1{

	background: linear-gradient(to top, rgba(25, 115, 175, 0), rgba(25, 115, 175, 1))
}

</style>


</head>
<body  id="grad1" ng-app="" >

<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>


<br>
<br>
<br>

	<h1 style="margin: auto; width: 80%; text-align: center;">Add Category</h1>

	<br>
	
	<form:form name="myForm" action="${pageContext.request.contextPath}/AddCategoryToDB" method="post" style="margin: auto; width: 80%; text-align: center;" modelAttribute="Category" novalidate="novalidate">
	
		<form:input  path="name" type="text" placeholder="Name" class="form-control" name="name" ng-model="name" required="required"/>
	    <form:errors path="name"/>
	    <span style="color:red" ng-show="myForm.name.$touched && myForm.name.$invalid"> Name Required</span>
		<br>
		
		<form:textarea path="description" placeholder="Description" class="form-control" name="description" ng-model="description" required="required"></form:textarea>
	    <form:errors path="description"/>
	    <span style="color:red" ng-show="myForm.description.$touched && myForm.description.$invalid"> Description Required</span>
		<br>
		
		<input type="submit" value="Add" class="btn btn-danger" ng-disabled=" myForm.name.$invalid || myForm.description.$invalid">
	
	</form:form>

  <br>
  <br>
  <br>

 <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</body>
</html>