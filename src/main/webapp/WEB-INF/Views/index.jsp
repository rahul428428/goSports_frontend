<!DOCTYPE html>
<html lang="en">
<head>
  <title>goSports.com</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 
   
 
     
</head>
<body  >
 
<%@ include file="navbar.jsp" %>

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
 <div class="container" style="margin-top:20px"> 
    <a href="searchbyCategory1">  <img src="resources/running_shoes_0.jpg"   alt="running shoes"  style="width:30%; height:295px"> </a>
    <a href="searchbyCategory3"> <img src="resources/adidasfootbalsoesadd.jpg"   alt="running shoes"  style="width:30%; height:295px ; margin-left:50px"> </a>
    <a href="searchbyCategory3"> <img src="resources/nikefootads.jpg"   alt="running shoes"  style="width:30%;height:295px ; margin-left:55px"></a>
    <a href="searchbyCategory9">  <img src="resources/BadmintonBanner.jpg"   alt="running shoes"  style="width:30%;height:295px ; margin-top:20px"></a>
    <a href="searchbyCategory9"> <img src="resources/tennisad.jpg"   alt="running shoes"  style="width:30%; height:295px ; margin-left:50px ;margin-top:20px"> </a>
    <a href="searchbyCategory10"> <img src="resources/boxing ad.jpg"   alt="running shoes"  style="width:30%; height:295px ; margin-left:50px ;margin-top:20px"> </a>
    <img src="resources/nikatracksuits.jpg"   alt="running shoes"  style=" margin-top:20px">
    <a href="searchbyCategory13" > <img src="resources/cricket_upto_40.jpg"   alt="running shoes"  style=" margin-top:20px ; margin-left:100px"> </a>
    <a href="searchbyCategory12"> <img src="resources/bb_stand_50.jpg"   alt="running shoes"  style=" margin-top:20px ;width:30%; width: 300px"> </a>
    <a href="viewproduct261" ><img src="resources/kamachi_treadmill_new.jpg"   alt="running shoes"  style=" margin-top:20px"></a>
  </div>
  
</body>
</html>
 <br><br><br>
<jsp:include page="/WEB-INF/Views/footer.jsp"></jsp:include>

