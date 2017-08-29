<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Profile</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<script type="text/javascript">
	
	$(document).ready(function() {
		
		$('#checkBoxAll').click(function() {
			
			if($(this).is(":checked"))
				$('.chkCheckBoxId').prop('checked', true);
			else
				$('.chkCheckBoxId').prop('checked', false);
		});
	});

</script>



</head>
<body>
<br>

	<h1 style="margin: auto; width: 80%; text-align: center;">View Profile</h1>

	<form method="post" action="${pageContext.request.contextPath}/DeleteProfiles">
	
	<input type="submit" class="btn btn-danger" value="Delete" onclick="return confirm('Are you sure you want to delete this profile?');" style="margin-left: 135px;">	
	
	<br>
	<br>



	<br>
	
	<table class="table table-striped" style="margin: auto; width: 80%;">
	
		<thead>
			<tr>
            <th><input type="checkbox" id="checkBoxAll"></th> 
			<th>Username</th>
			<th>Password</th>
			<th>Email</th>
			<th>Phone</th>
			<th>Address</th>
			<th>View</th>
			<th>Update</th>
			<th>Delete</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${profiledata}" var="x">
			<tr>
			<td><input type="checkbox" class="chkCheckBoxId" name="delete" value="${x.getId()}"></td>
			<td>${x.getUsername()}</td>
			<td>${x.getPassword()}</td>
			<td>${x.getEmail()}</td>
			<td>${x.getPhone()}</td>
			<td>${x.getAddress()}</td>
			<td><a href="ViewOneProfile/${x.getId()}" class="btn btn-primary">View</a></td>
			<td><a href="UpdateOneProfile/${x.getId()}" class="btn btn-success">Update</a></td>
			<td><a href="DeleteOneProfile/${x.getId()}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this profile?');">Delete</a></td>
			</tr>
			</c:forEach>
		</tbody>
	
	</table>


</body>
</html>