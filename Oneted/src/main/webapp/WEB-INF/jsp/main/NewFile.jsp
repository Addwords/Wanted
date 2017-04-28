<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Oneted</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<!--   <link rel="stylesheet" href="./css/w3.css"> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
.modal{
z-index:3;
display:none;
padding-top:100px;
position:fixed;
left:0; top:0;width:100%;height:100%;
overflow:auto;
background-color: rgba( 255, 255, 255, 0.9);}
    .navbar {
      margin-bottom: 50px;
      border-radius: 0;
    }
    
 
     .jumbotron {
      margin-bottom: 0;
    }
   
    
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
  </style>
</head>
<body>
  
<div class="jumbotron">
  <div class="container text-center">
    <h1><font></font> One ted</h1>      
    <p>TEAM PROJECT</p>
    <form class="form-inline">search:
    <input type="text" class="form-control" size="50" placeholder="search">
    <button type="button" class="btn btn-danger">Sign Up</button>
  </form>
  </div>
</div>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Page 1-1</a></li>
            <li><a href="#">Page 1-2</a></li>
            <li><a href="#">Page 1-3</a></li>
          </ul>
        </li>
        <li><a href="#">Page 2</a></li>
        <li><a href="#">Page 3</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container">    
  <div class="row">
  
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading">팀명</div>
        <div class="panel-body"><img src="resources/images/avatar2.png" class="img-responsive" style="width:100%" alt="Image" onclick="onClick(this)"></div>
        <div class="panel-footer">여기에 상세설명</div>
      </div>
    </div>
    
  </div>
</div><br>

<div class="container">    
  <div class="row">
    
        <div id="modal01" class="modal w3-padding-0"> 
    <span class="w3-button w3-light-grey w3-xlarge w3-display-topright" onclick="ajwidl()">X</span>
    <div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
      <img id='profimg' width='60' height='60' onclick='msgo()'><label id='mid'></label><br>
	<!--  ↗해당 아이디로 쪽찌 보내기 링크 -->
      <img id="img01" class="detimg"> <!--해당 이미지-->
    </div>
  </div>
  </div>
</div><br><br>

<script>
function onClick(element){
	  document.getElementById("modal01").style.display = "block";
	  document.getElementById("img01").src = element.src;
	  
}
function ajwidl(){
	document.getElementById("modal01").style.display = "none";
}

</script>
</body>
</html>
