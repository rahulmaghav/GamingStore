<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart Page1</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>

</head>

<script>

var app = angular.module("myApp", []).controller("myCtrl", function($scope) {
    $scope.firstName = "John";
    
});


</script>

<body ng-app="myApp" ng-controller="myCtrl">


<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>


<br>
<br>
<br>
<br>

<h1>{{firstName}}</h1>



<a href="${flowExecutionUrl}&_eventId=viewAllProducts" class="btn btn-success" style=" float:left; margin-left:50px; margin-top:45px">Previous</a>

<h2 style="margin-left:250px;">Page1 </h2>

<a href="${flowExecutionUrl}&_eventId=submitBillingAndShipping" class="btn btn-success" style="float:right ;margin-right:50px; margin-top:10px">Next</a>

<br>
<br>
<br>
<br>

<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</body>
</html>