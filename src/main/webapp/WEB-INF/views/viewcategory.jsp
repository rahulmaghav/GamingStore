<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Category</title>
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

	<h1 style="margin: auto; width: 80%; text-align: center;">View Category</h1>


	<form method="post" action="${pageContext.request.contextPath}/DeleteCategories">
	
	
	<%
			Authentication auth1 = SecurityContextHolder.getContext().getAuthentication();
		    if (auth1 != null && !auth1.getName().equals("anonymousUser"))
		    {    
			if(request.isUserInRole("ROLE_ADMIN") ){
		    		%>
		    
	<input type="submit" class="btn btn-danger" value="Delete" onclick="return confirm('Are you sure you want to delete this category?');" style="margin-left: 135px;">	

		    		
		    		<%
		    	}
		    }
			%>
	
	
		
	<br>
	<br>

	<br>
	
	<table class="table table-striped" style="margin: auto; width: 80%;">
	
		<thead>
			<tr>
			<th><input type="checkbox" id="checkBoxAll"></th> 
			<th>Name</th>
			<th>Description</th>
			<th>View</th>
            <%
			Authentication auth2 = SecurityContextHolder.getContext().getAuthentication();
		    if (auth2 != null && !auth2.getName().equals("anonymousUser"))
		    {    
		    	if(request.isUserInRole("ROLE_ADMIN") ){
		    		%>
		    

				<th>Update</th>
			    <th>Delete</th>
	    		
		    		<%
		    	}
		    }
			%>



<!-- 			<th>Update</th>
			<th>Delete</th>
 -->
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${categorydata}" var="x">
			<tr>
			<td><input type="checkbox" class="chkCheckBoxId" name="delete" value="${x.getCatid()}"></td>
			<td>${x.getName()}</td>
			<td>${x.getDescription()}</td>
			<td><a href="${pageContext.request.contextPath}/ViewOneCategory/${x.getCatid()}" class="btn btn-primary">View</a></td>

            <%
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		    if (auth != null && !auth.getName().equals("anonymousUser"))
		    {    
		    	if(request.isUserInRole("ROLE_ADMIN") ){
		    		%>
		    

			<td><a href="${pageContext.request.contextPath}/UpdateOneCategory/${x.getCatid()}" class="btn btn-success">Update</a></td>
			<td><a href="${pageContext.request.contextPath}/DeleteOneCategory/${x.getCatid()}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this category?');">Delete</a></td>
		    		
		    		<%
		    	}
		    }
			%>


			</tr>
			</c:forEach>
		</tbody>
	
	</table>

  <br>
  <br>
  <br>

 <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</body>
</html>