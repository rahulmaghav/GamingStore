<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart Page4</title>
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

<script>

var app = angular.module("myApp", []).controller("myCtrl", function($scope,$http) {
   
    
   $scope.data=[];
    
    $http(	{
    			method: 'POST',
	      		url: '/Gamingstore/DeleteCartItems',
	      		 headers : {'Content-Type':'application/x-www-form-urlencoded'}
    			}).then(function(response){
			    	console.log(response.data);
			    
			    	
			    	
    			});
    
    $scope.Delete=function(arg){
    	
    	alert(arg);
    	
    	var json={"id":arg};
    	
    	console.log( JSON.stringify(json) );
    	
    	$http(	{
			method: 'POST',
      		url: '/Gamingstore/deletefromcart',
      		data:JSON.stringify(json),
      		 headers : {'Content-Type':'application/json'}
			}).then(function(response){
		    	console.log(response.data);
		    
		    	//Fetch Again
		    	$http(	{
	    			method: 'POST',
		      		url: '/Gamingstore/getAllCartItems',
		      		 headers : {'Content-Type':'application/x-www-form-urlencoded'}
	    			}).then(function(response){
				    	console.log(response.data);
				    
				    	$scope.data = response.data;
				    	
	    			});
		    	
			});
    	
    }
    
});


</script>

<body id="grad1" ng-app="myApp" ng-controller="myCtrl">

<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

<br>
<br>
<br>
<br>







<a href="viewproduct" class="btn btn-success" style=" float:left; margin-left:50px; margin-top:45px">Buy More</a>

<h1 style="margin: auto; width: 80%; text-align: center;">Thank You </h1>
<h1 style="margin: auto; width: 80%; text-align: center;">Your Order is confirmed</h1>

<a href="${pageContext.request.contextPath}/" class="btn btn-success" style="float:right ;margin-right:50px; margin-top:10px">Home</a>

<br>
<br>
<br>
<br>

<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</body>
</html>