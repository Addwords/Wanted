<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--   <%@ include file="/WEB-INF/include/include-header.jspf" %> --%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Oneted</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <style>
  .col-sm-4{
  width: 30%;
  }
.panel-body{
width: 100%;
height: 80%;
margin: auto;
}
.img-responsive{
width: 400px;
height: 300px;
}
.detimg{
width: 400px;
height: 300px;
}

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
<%--   <%@ include file="/WEB-INF/include/include-body.jspf" %> --%>
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
   <c:forEach items="${tlist}" var="dto">
   
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading">${dto.TNAME }</div>
        <div class="panel-body"><img src="resources/images/${dto.TIMG }" class="img-responsive" id="${dto.TSEQ}" alt="${dto.EMAIL }" onclick="onClick(this)"></div>
        <div class="panel-footer"><a href='#'>${dto.EMAIL } <img src='resources/images/mail.png' width='30' height='30'></a></div>
        <div class="panel-footer">${dto.TINFO }</div>
      </div>
    </div>
     </c:forEach>
  </div>
</div><br>

<div class="container">    
  <div class="row">
    
    <div id="modal01" class="modal w3-padding-0"> 
    <span class="w3-button w3-light-grey w3-xlarge w3-display-topright" onclick="ajwidl()">X</span>
    <div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
<!--     													↙인재풀 상세페이지 -->
      <form id='frm' action=<c:url value='/team/openTeamDetail.do'/> method="post">
						<!--     ▲▲▲▲▲▲▲  경로문제!!! -->
      <img id='profimg' width='60' height='60' onclick='msgo()' src='resources/images/avatar2.png'><label id='mid'></label><br>

      <img id="img01" class="detimg" onclick="ajwidl()"> <!--해당 이미지-->
      <p id='seq'></p>
      <p>상세상세2</p>
      <p>상세상세3</p>
      <!--  생성된 팀의 상세페이지로 가기-->
      <input type='button' id="idxt" name='det' value='자세히' alt="" onclick="godetail(this)">
      
    </form>
    </div>
  </div>
  </div>
</div><br><br>

<script>

function onClick(element){
	
	  document.getElementById("modal01").style.display = "block";
	  document.getElementById("img01").src = element.src;
	  var midText = document.getElementById("mid");
	  midText.innerHTML = element.alt;
	  var se = element.id;
	  var seqText = document.getElementById("seq");
	  seqText.innerHTML = se;
	  var seqParam = document.getElementById("idxt");
	  seqParam.setAttribute("alt",se);
	  //$('#frm').append("<input type='text' name='idx' id='idx' value='"+se+"'/>");
	  
}

function ajwidl(){
	document.getElementById("modal01").style.display = "none";
}

function godetail(obj){
	var tet = obj.getAttribute("alt");
	console.log(tet);
	var logi = obj.alt;
	$('#frm').append("<input type='hidden' name='IDX' id='IDX' value='"+tet+"'/>");
	var forming = document.getElementById("frm");
	forming.submit();
}

</script>
</body>
</html>
