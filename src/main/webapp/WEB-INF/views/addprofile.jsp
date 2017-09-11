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

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>

<style>

#grad1{

	background: linear-gradient(to top, rgba(25, 115, 175, 0), rgba(25, 115, 175, 1))
}

</style>


</head>
<body  id="grad1" ng-app="">

<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
 
 
    <br>
    <br>
    <br>

	<h1 style="margin: auto; width: 80%; text-align: center;">Add Profile</h1>

	<br>
	
	<form:form name="myForm" action="${pageContext.request.contextPath}/AddProfileToDB" method="post" style="margin: auto; width: 80%; text-align: center;" modelAttribute="Profile"  novalidate="novalidate" >
	
		<form:input path="username" type="text" placeholder="UserName" class="form-control" name="username" ng-model="username" ng-minlength="5" ng-maxlength="20" ng-pattern="/^[a-zA-Z0-9_]*$/" required="required"/>
	    <form:errors path="username"/>
	     <span style="color:red" ng-show="myForm.username.$touched && myForm.username.$invalid"> Username Required</span>

  <span style="color:red" ng-show="myForm.username.$error.minlength"> Your UserName Should Contain Atleast 5 Characters</span>
  <span style="color:red" ng-show="myForm.username.$error.maxlength"> Your UserName Should Contain Atmost 20 Characters</span>
  <span style="color:red" ng-show="myForm.username.$error.pattern"> only Lowercase,uppercase characters, digits and underscore are allowed </span>
	    
		<br>
		
		<form:input path="password" type="password" placeholder="Password" class="form-control" name="password" ng-model="password" ng-minlength="8" ng-maxlength="20"   ng-pattern="/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$@!%*?&_])[A-Za-z0-9$@!%*?&_]*$/" required="required"/>
	    <form:errors path="password"/>
	
	<span style="color:red" ng-show="myForm.password.$touched && myForm.password.$invalid">Password is required.</span>

<span style="color:red" ng-show="myForm.password.$error.minlength"> Your Password Should Contain Atleast 8 Characters</span>
<span style="color:red" ng-show="myForm.password.$error.maxlength"> Your Password Should Contain Atmost 20 Characters</span>
<span style="color:red" ng-show="myForm.password.$error.pattern"> Password should contain atleast 1 lowercase,1 uppercase,1 number,1 special character</span>


	
		<br>
		
		<form:input path="confirmpassword" type="password" placeholder="ConfirmPassword" class="form-control" name="confirmpassword"/>
	    <form:errors path="confirmpassword"/>
		
		<br>
		
		<form:input path="email" type="email" placeholder="Email" class="form-control" name="email" ng-model="email"  ng-pattern="/^[[a-zA-Z0-9]{2,20}@[a-zA-Z]{2,20}\.[a-zA-Z]{2,20}(\.[a-zA-Z]{2,20}){0,1}$/" required="required"/>
	    <form:errors path="email"/>
		
       <span style="color:red" ng-show="myForm.email.$touched && myForm.email.$invalid">Email is required.</span>

          
         <span style="color:red" ng-show="myForm.email.$error.pattern"> Invalid Email</span>
		
		<br>
		
		<form:input path="phone" type="number" placeholder="Phone" class="form-control" name="phone" ng-model="phone" ng-minlength="10" ng-maxlength="10" ng-pattern="/^[789][0-9]*$/" required="required"/>
	    <form:errors path="phone"/>
         <span style="color:red" ng-show="myForm.phone.$touched && myForm.phone.$invalid">Phone Number is required.</span>

          <span style="color:red" ng-show="myForm.phone.$error.minlength">
        Your Phone Should Contain Atleast 10 Characters</span>
        <span style="color:red" ng-show="myForm.phone.$error.maxlength">
        Your Phone Should Contain Atmost 10 Characters</span>
         <span style="color:red" ng-show="myForm.phone.$error.pattern">
        Phone should start with 7,8,9 </span>

		<br>
		
		<form:textarea path="address" placeholder="Address" class="form-control" name="address" ng-model="address" ng-minlength="5" ng-pattern="/^[A-Za-z0-9$@!%*?&_]*$/" required="required"></form:textarea>
		<form:errors path="address"/>
		<span style="color:red" ng-show="myForm.address.$touched && myForm.address.$invalid">Address is required.</span>

          <span style="color:red" ng-show="myForm.address.$error.minlength">
        Your Address Should Contain Atleast 5 Characters</span>
        
         <span style="color:red" ng-show="myForm.address.$error.pattern">
       Invalid Address</span>
 
       <br>
       <br>
       
       <h3>Select ROLE</h3>
        <form:select path="role">
			<option value="ROLE_USER">ROLE_USER</option>
			<option value="ROLE_SUPPLIER">ROLE_SUPPLIER</option>
		</form:select>
	    <form:errors path="role"/>
		
		<br>
		<br>
		
		<input type="submit" value="Add" class="btn btn-danger" ng-disabled=" myForm.username.$invalid || myForm.password.$invalid || myForm.email.$invalid || myForm.phone.$invalid || myForm.address.$invalid"/>
	
	</form:form>





  <br>
  <br>
  <br>





 <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</body>
</html>