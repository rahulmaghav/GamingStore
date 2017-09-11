<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View One Category</title>

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

	<h1 style="margin: auto; width: 80%; text-align: center;">View One Category</h1>

	<br>
	
	<table class="table table-striped" style="margin: auto; width: 80%;">
	
		<thead>
			<tr>
			<th>Name</th>
			<th>Description</th>
			
			</tr>
		</thead>
		
		<tbody>
			<tr>
			<td>${categorydata.getName()}</td>
			<td>${categorydata.getDescription()}</td>
			
			</tr>
			
		</tbody>
	
	</table>
	<a href="${pageContext.request.contextPath}/categoryproducts/${categorydata.getName()}"" class="btn btn-primary">View Products</a>
	<%-- <input type="button" class="btn btn-success" style=" float:left; margin-left:50px; margin-top:23px"><a href="categoryproducts/${categorydata.getName()}">View Products</a></input>
 --%>
  <br>
  <br>
  <br>

 <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</body>
</html>