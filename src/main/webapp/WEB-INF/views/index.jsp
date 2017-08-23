<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>GamingX</title>
 <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body >

<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
 
 <br/>
 <br/>
 <br/>
 
  <div class="container">
  
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">

      <div class="item active">
        <img src="Resources/images/gta5.jpg/" alt="GTA 5" style="width:100%;">
        <div class="carousel-caption">
          <h3></h3>
          <p></p>
        </div>
      </div>


      <div class="item">
        <img src="Resources/images/farcry4.jpg/" alt="Farcry 4" style="width:100%;">
        <div class="carousel-caption">
          <h3></h3>
          <p></p>
        </div>
      </div>
    
      <div class="item">
        <img src="Resources/images/counterstrike.jpg" alt="Counterstrike" style="width:100%;">
        <div class="carousel-caption">
          <h3></h3>
          <p></p>
        </div>
      </div>
  
    </div>


    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

<br></br>  





<div class="container">
  <table style="width:100%">
  <tr>
  
  <th><img class="img-responsive"  src="Resources/images/callofduty.jpg" alt="Call of Duty" width="200" height="345"></th> 
  
  <th><img class="img-responsive"  src="Resources/images/nfs.jpg"  alt="NeedForSpeed" width="200" height="345"></th> 
  
  <th><img class="img-responsive"  src="Resources/images/fifa17.jpg"  alt="FIFA 17" width="200" height="345"></th> 
   
   </tr>
   </table>

</div>
  
  <br></br>





 <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>


</body>
</html>
