<!DOCTYPE html>
<html lang="en">
<head>
  <title>goSports.com</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   
 
     
</head>
<body  >
 
<jsp:include page="navbar.jsp"/>

<div class="container" >
  <div id="myCarousel" class="carousel slide" data-ride="carousel" >
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="1" class="active" ></li>
      <li data-target="#myCarousel" data-slide-to="2" ></li>
      <li data-target="#myCarousel" data-slide-to="3" ></li>
      <li data-target="#myCarousel" data-slide-to="4" ></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

      
    <div class="carousel-inner" >

      <div class="item active">
        <img src="resources/bolt.jpg" alt="bolt" style="width:100%; length:300%">  
      </div>

      <div class="item">
        <img src="resources/messi.jpg" alt="messi" style="width:100%;length:300%"> 
      </div>
    
      <div class="item ">
        <img src="resources/michaelphelps.jpg" alt="michaelphelps" style="width:300%;length:300%">  
      </div>
      
      <div class="item ">
        <img src="resources/virat.jpg" alt="michaelphelps" style="width:100%;length:300%">  
      </div>
      
      <div class="item">
        <img src="resources/football.jpg" alt="michaelphelps" style="width:100%;length:300%">  
      </div>
      
    </div>

    
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

  
  
</body>
</html>
 <br><br><br>
<jsp:include page="/WEB-INF/Views/footer.jsp"></jsp:include>

