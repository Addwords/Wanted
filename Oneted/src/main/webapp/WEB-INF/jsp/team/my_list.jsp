<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String id = (String)session.getAttribute("id"); %>
<!DOCTYPE html>
<html>
<title>MY TEAM</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
</style>
<body class="w3-light-grey">

<!-- w3-content defines a container for fixed size centered content, 
and is wrapped around the whole page content, except for the footer in this example -->
<div class="w3-content" style="max-width:1400px">

<!-- Header -->
<header class="w3-container w3-center w3-padding-32"> 
  <h1><b>MY TEAM</b></h1>
  <p>환영합니다! <span class="w3-tag"><%=id %></span></p>
</header>
<%@include file="/WEB-INF/include/include.jspf" %>
<nav class="w3-sidebar w3-bar-block w3-black w3-animate-right w3-top w3-text-light-grey w3-large" style="z-index:3;width:250px;font-weight:bold;display:none;right:0;" id="mySidebar">
	  <a href="../team/createTeam.do" onclick="w3_close()" class="w3-bar-item w3-button w3-center w3-padding-16">Make Team</a> 
	  <a href="../team/createProject.do" onclick="w3_close()" class="w3-bar-item w3-button w3-center w3-padding-16">Make Project</a> 
	  <a href="../team/myteam_list.do" onclick="w3_close()" class="w3-bar-item w3-button w3-center w3-padding-16">My Team</a>
	  <a href="../team/myproject_list.do" onclick="w3_close()" class="w3-bar-item w3-button w3-center w3-padding-16">My Project</a>
	  <a href="#" onclick="w3_close()" class="w3-bar-item w3-button w3-center w3-padding-16">LogOut</a>
</nav>
<!-- Grid -->
<div class="w3-row">

<!-- Blog entries -->
<div class="w3-col l8 s12">
  <!-- Blog entry -->
  <c:forEach items="${myteam}" var="mdto">
  <div class="w3-card-4 w3-margin w3-white">
    <img src="../resources/images/${mdto.TIMG}" alt="팀이미지" style="width:300px; height:200px;">
    <div class="w3-container">
      <h3><b>${mdto.TNAME}</b></h3>
      <h5>Title description, <span class="w3-opacity">April 7, 2014</span></h5>
    </div>
  </div>
  </c:forEach>
  
  <c:forEach items="${myproject}" var="mdtos">
  <div class="w3-card-4 w3-margin w3-white">
    <img src="../resources/images/${mdtos.PIMG}" alt="팀이미지" style="width:300px; height:200px;">
    <div class="w3-container">
      <h3><b>${mdtos.PNAME}</b></h3>
      <h5>Title description, <span class="w3-opacity">April 7, 2014</span></h5>
    </div>
  </div>
  </c:forEach>
  <hr>

  <!-- Blog entry -->
<!-- END BLOG ENTRIES -->
</div>

<!-- Introduction menu -->
<div class="w3-col l4">
  <!-- About Card -->
  <div class="w3-card-2 w3-margin w3-margin-top">
  <img src="../resources/images/avatar2.png" style="width:60px; height:60px;" alt="프로필 이미지">
    <div class="w3-container w3-white">
      <h4><b>My Profile</b></h4>
      <p>나의 정보(간단히)</p>
    </div>
  </div><hr>
  
  <!-- 즐겨찾기 -->
  <div class="w3-card-2 w3-margin">
    <div class="w3-container w3-padding">
      <h4>즐겨찾기☆</h4>
    </div>
    <ul class="w3-ul w3-hoverable w3-white">
      <li class="w3-padding-16">
        <img src="/w3images/workshop.jpg" alt="팀 이미지" class="w3-left w3-margin-right" style="width:50px">
        <span class="w3-large">Lorem</span><br>
        <span>Sed mattis nunc</span>
      </li>
      
    </ul>
  </div>
  <hr> 
 
  <!-- Labels / tags -->
  <div class="w3-card-2 w3-margin">
    <div class="w3-container w3-padding">
      <h4>빅데이터(할수있으면)</h4>
    </div>
    <div class="w3-container w3-white">
    <p><span class="w3-tag w3-black w3-margin-bottom">Travel</span> <span class="w3-tag w3-light-grey w3-small w3-margin-bottom">New York</span> <span class="w3-tag w3-light-grey w3-small w3-margin-bottom">London</span>
      <span class="w3-tag w3-light-grey w3-small w3-margin-bottom">IKEA</span> <span class="w3-tag w3-light-grey w3-small w3-margin-bottom">NORWAY</span> <span class="w3-tag w3-light-grey w3-small w3-margin-bottom">DIY</span>
      <span class="w3-tag w3-light-grey w3-small w3-margin-bottom">Ideas</span> <span class="w3-tag w3-light-grey w3-small w3-margin-bottom">Baby</span> <span class="w3-tag w3-light-grey w3-small w3-margin-bottom">Family</span>
      <span class="w3-tag w3-light-grey w3-small w3-margin-bottom">News</span> <span class="w3-tag w3-light-grey w3-small w3-margin-bottom">Clothing</span> <span class="w3-tag w3-light-grey w3-small w3-margin-bottom">Shopping</span>
      <span class="w3-tag w3-light-grey w3-small w3-margin-bottom">Sports</span> <span class="w3-tag w3-light-grey w3-small w3-margin-bottom">Games</span>
    </p>
    </div>
  </div>
  
<!-- END Introduction Menu -->
</div>

<!-- END GRID -->
</div><br>

<!-- END w3-content -->
</div>
  <div class="w3-overlay w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<script>
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}

function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}
</script>
</body>
</html>
