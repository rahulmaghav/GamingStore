<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">



</head>
<body>



<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
    
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="${pageContext.request.contextPath}/">GamingX</a>
    </div>
    
    
    <div class="collapse navbar-collapse" id="myNavbar">
      
      <%-- <ul class="nav navbar-nav">
        <li class="active"><a href="${pageContext.request.contextPath}/">Home</a></li>
      </ul> --%>
       
       
       <ul class="nav navbar-nav">
        <li class="active"><a href="${pageContext.request.contextPath}/">Home</a></li>

        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Categories<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="${pageContext.request.contextPath}/viewcategory">View All</a></li>

        <%
			Authentication auth2 = SecurityContextHolder.getContext().getAuthentication();
		    if (auth2 != null && !auth2.getName().equals("anonymousUser"))
		    {    
			if(request.isUserInRole("ROLE_ADMIN") ){
		    		%>
		    
		    <li><a href="${pageContext.request.contextPath}/addcategory">Add Category</a></li>		    		
		    		<%
		    	}
		    }
		%>



            
          </ul>
        </li>

        
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Products<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="${pageContext.request.contextPath}/viewproduct">View All</a></li>
            
            
           	<%
			Authentication auth1 = SecurityContextHolder.getContext().getAuthentication();
		    if (auth1 != null && !auth1.getName().equals("anonymousUser"))
		    {    
			if(request.isUserInRole("ROLE_SUPPLIER") ){
		    		%>
		    
		    <li><a href="${pageContext.request.contextPath}/addproduct">Add Product</a></li>		    		
		    		<%
		    	}
		    }
			%>
            
           
          </ul>
        </li>

            
            
           	<%
			Authentication auth5 = SecurityContextHolder.getContext().getAuthentication();
		    if (auth5 != null && !auth5.getName().equals("anonymousUser"))
		    {    
			if(request.isUserInRole("ROLE_ADMIN") ){
		    		%>

        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Profiles<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="${pageContext.request.contextPath}/viewprofile">View All</a></li>

		    
		    		    		
		    		<%
		    	}
		    }
			%>
            
           
          </ul>
        </li>


      </ul>
      
       
       
      <ul class="nav navbar-nav navbar-right">
        
        
       <!--  <li><a href="cart">View Cart</a></li>
        <li><a href="addprofile"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="loginpage"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
 -->        
        
        
        <%
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		    if (auth != null && !auth.getName().equals("anonymousUser"))
		    {    
		
		    	String currUser=auth.getName();
		    	
		    	request.setAttribute("currUser", currUser);
		    		%>
        <li><a href="${pageContext.request.contextPath}/cart">View Cart</a></li>
        <li><a ><span class="glyphicon glyphicon-user"></span> Welcome ${ currUser}</a></li>
        <li><a href="${pageContext.request.contextPath}/logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
		    
		    		
		    		<%
		    }
		    
		    else
		    	{
		    	%>
		    	 <li><a href="${pageContext.request.contextPath}/cart">View Cart</a></li>
		         <li><a href="${pageContext.request.contextPath}/addprofile"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
		         <li><a href="${pageContext.request.contextPath}/loginpage"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
	    	
		    	<%
		    	}
		    
			%>
        
        
         <!-- <li><a href="cart">View Cart</a></li>
        <li><a href="addprofile"><span class="glyphicon glyphicon-user"></span> Welcome</a></li>
        <li><a href="loginpage"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
 -->    
       </ul>
    
    </div>
  
  </div>
</nav>


</body>
</html>