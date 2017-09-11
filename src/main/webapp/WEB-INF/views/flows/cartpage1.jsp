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



<style>

#grad1{

	background: linear-gradient(to top, rgba(25, 115, 175, 0), rgba(25, 115, 175, 1))
}

</style>

</head>

<script>

var app = angular.module("myApp", []).controller("myCtrl", function($scope,$http) {
       
    $scope.data = [];
    
    $http(	{
    			method: 'POST',
	      		url: '/Gamingstore/getAllCartItems',
	      		 headers : {'Content-Type':'application/x-www-form-urlencoded'}
    			}).then(function(response){
			    	console.log(response.data);
			    
			    	$scope.data = response.data;
			    	
    			});
    
    $scope.currDel = -1;
    
    $scope.currDelSet = function(arg){
    	$scope.currDel = arg;
    }
    
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


<a href="${pageContext.request.contextPath}/viewproduct" class="btn btn-success" style=" float:left; margin-left:50px; margin-top:45px">Previous</a>

<h2 style="margin-left:250px;">Page1 </h2>

<a href="${flowExecutionUrl}&_eventId=submitBillingAndShipping" class="btn btn-success" style="float:right ;margin-right:50px; margin-top:10px">Next</a>

<br>
<br>
<br>
<br>

<table class="table table-striped" style="margin: auto; width: 90%; text-align: center;">

	<thead>
		<tr>
		<th>Name</th>
		<th>Description</th>
		<th>Category</th>
		<th>Image</th>
		<th>Qty</th>
		<th>Price</th>
		<th>Sub-Total</th>
		<th>Delete</th>
		</tr>
	</thead>
	
	<tbody>
		<tr ng-repeat="x in data">
		<th>{{x.pname}}</th>
		<th>{{x.pdesc}}</th>
		<th>{{x.pcat}}</th>
		<th><img src='{{x.pimg}}' width="100"></th>
		<th>{{x.qty}}</th>
		<th>{{x.pprice}}</th>
		<th>{{x.pprice * x.qty}}</th>
		<!-- <th><button ng-click="Delete(x.id)" class="btn btn-danger">Delete</button></th> -->
		
		
		<!-- Trigger the modal with a button -->
  <th><button type="button" class="btn btn-danger" ng-click="currDelSet(x.id)" data-toggle="modal" data-target="#myModal">Delete</button></th>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
      
      <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         <h4 class="modal-title">Confirm Delete</h4>
      </div>
        
    
    <div class="modal-body">
          <p>Confirm Delete</p>
     </div>
        
        
        <div class="modal-footer">
          <button type="button" ng-click="Delete(currDel)"class="btn btn-default" data-dismiss="modal">YES</button>

         <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        </div>
      
      </div>
      
    </div>
  </div>
		
		
		
		</tr>
	</tbody>

</table>
<br>
<br>
<br>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</body>
</html>