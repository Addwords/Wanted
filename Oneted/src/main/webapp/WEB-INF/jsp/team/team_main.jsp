<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
  <%
		if (session.getAttribute("LOGEMAIL") == null) {System.out.println("attribute null");%>			 
			<%@include file="/WEB-INF/include/include-outnavbar.jspf" %><%
		}else{System.out.println("attribute exist");%>
			<%@include file="/WEB-INF/include/include-innavbar.jspf" %><%
		}
 	%> 
  <title>Oneted</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
.col-sm-4{width: 30%; height: 70%;}
.tn{background-color:orange;}
.pn{background-color:skyblue;}
.panel-body{width: 100%;margin: auto;}
.img-responsive{width: 400px;height: 310px;}
.detimg{width: 400px;height: 300px;}
.modal{z-index:3;display:none;padding-top:100px;position:fixed;
left:0; top:0;width:100%;height:100%;overflow:auto;
background-color: rgba( 255, 255, 255, 1);}
.navbar {margin-bottom: 50px;border-radius: 0;}
.jumbotron {margin-bottom: 0;}
footer{background-color: #f2f2f2;padding: 25px;}
ft{margin-top: 5px;}
#open_search{display: none;}
  </style>

</head>
<body>
<div class="jumbotron">
  <div class="container text-center">
    <h1><a href="../main.jsp" style="text-decoration:none;"><font color="red">ONE</font>TED</a></h1>
    <p>TEAM PROJECT</p>
    <div id="open_search" class="w3-animate-zoom">
    <form action="../team/searchList.do">
    <input type="text" size="40" autofocus id="search" name="search" placeholder="Search...">
    </form>
    <span class="cs w3-button w3-large w3-hover-red" onclick="csearch()">&times;</span>
    </div>
  </div>
</div>

<!-- <nav class="navbar navbar-inverse"> -->
<!--   <div class="container-fluid"> -->
<!--     <div class="navbar-header"> -->
<!--       <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar"> -->
<!--         <span class="icon-bar"></span> -->
<!--         <span class="icon-bar"></span> -->
<!--         <span class="icon-bar"></span>                         -->
<!--       </button> -->
<!--     </div> -->
<%-- <%@include file="/WEB-INF/include/include.jspf" %> --%>

<!--   </div> -->
<!-- </nav> -->
<nav class="w3-sidebar w3-bar-block w3-black w3-animate-right w3-top w3-text-light-grey w3-large" style="z-index:3;width:250px;font-weight:bold;display:none;right:0;" id="mySidebar">
	  <a href="../team/createTeam.do" onclick="w3_close()" class="w3-bar-item w3-button w3-center w3-padding-16">Make Team</a> 
	  <a href="../team/createProject.do" onclick="w3_close()" class="w3-bar-item w3-button w3-center w3-padding-16">Make Project</a> 
	  <a href="../team/myteam_list.do" onclick="w3_close()" class="w3-bar-item w3-button w3-center w3-padding-16">My Team</a>
	  <a href="../team/myproject_list.do" onclick="w3_close()" class="w3-bar-item w3-button w3-center w3-padding-16">My Project</a>
	  <a href="#" onclick="w3_close()" class="w3-bar-item w3-button w3-center w3-padding-16">LogOut</a>
</nav>
<div class="container">   
  <div class="row">
<!--   <h1><a href=<c:url value='/team/openTeamList.do'/> >[Team List]</a> &nbsp; &nbsp; &nbsp;<a href=<c:url value='/team/openProjectList.do'/> >[Project List]</a></h1> -->
  <br>
   <c:forEach items="${tlist}" var="dto">
    <div class="col-sm-4 w3-animate-zoom">
      <div class="panel panel-primary">
        <div class='tn'><div class="panel-heading"><strong>${dto.TNAME }</strong></div></div>
        <div class="panel-body">
        <img src="../resources/images/${dto.TIMG }"
         class="img-responsive" id="${dto.TID}" alt="${dto.EMAIL }" 
         onclick="onClick(this)">
         </div>
        <div class="panel-footer"><a href='#'>팀장  ${dto.EMAIL } <img src='../resources/images/mail.png' width='30' height='30'></a></div>
        <div class="panel-footer">${dto.TINFO }</div>
      </div>
    </div>
     </c:forEach>
     
     <c:forEach items="${plist}" var="dtos">
    <div class="col-sm-4 w3-animate-zoom">
      <div class="panel panel-primary">
        <div class='pn'><div class="panel-heading"><strong>${dtos.PNAME }</strong></div></div>
        <div class="panel-body">
        <img src="../resources/images/${dtos.PIMG }"
         class="img-responsive" id="${dtos.PID}" alt="${dtos.EMAIL }" 
         onclick="onClick2(this)">
         </div>
        <div class="panel-footer"><a href='#'>리더  ${dtos.EMAIL } <img src='../resources/images/mail.png' width='30' height='30'></a></div>
        <div class="panel-footer">${dtos.PINFO }</div>
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
      <form id='frm1' action='../team/openTeamDetail.do' method="post">
						<!--     ▲▲▲▲▲▲▲  경로문제!!! -->
      <a><img id='profimg1' width='60' height='60' src='../resources/images/avatar2.png'><label id='mid1'></label></a><br>

      <img id="img01" class="detimg" onclick="ajwidl()"> <!--해당 이미지-->
      <p>상세상세2</p>
      <p>상세상세3</p>
      <!--  생성된 팀의 상세페이지로 가기-->
      <input type='button' id="idxt1" name='det' value='자세히' alt="" onclick="godetail(this)">
      
    </form>
    </div>
  </div> 
<!--   모달1끝 -->

  <div id="modal02" class="modal w3-padding-0"> 
    <span class="w3-button w3-light-grey w3-xlarge w3-display-topright" onclick="ajwidl2()">X</span>
    <div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
<!--     													↙인재풀 상세페이지 -->
      <form id='frm2' action='../team/openProjectDetail.do' method="post">
						<!--     ▲▲▲▲▲▲▲  경로문제!!! -->
      <img id='profimg2' width='60' height='60' src='../resources/images/avatar2.png'><label id='mid2'></label><br>

      <img id="img02" class="detimg" onclick="ajwidl2()"> <!--해당 이미지-->
      <p>상세상세2</p>
      <p>상세상세3</p>
      <!--  생성된 팀의 상세페이지로 가기-->
      <input type='button' id="idxt2" name='det' value='자세히' alt="" onclick="godetail2(this)">
      
    </form>
    </div>
  </div>
<!--   모달2끝 -->
  </div>
  <div class="w3-overlay w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>
  
</div><br><br>

<script>
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}

function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}

function onClick(element){
	
	  document.getElementById("modal01").style.display = "block";
	  document.getElementById("img01").src = element.src;
	  var midText = document.getElementById("mid1");
	  midText.innerHTML = element.alt;
	  var se = element.id;
	  var seqParam = document.getElementById("idxt1");
	  seqParam.setAttribute("alt",se);
	  
}

function onClick2(element){
	
	  document.getElementById("modal02").style.display = "block";
	  document.getElementById("img02").src = element.src;
	  var midText = document.getElementById("mid2");
	  midText.innerHTML = element.alt;
	  var se = element.id;
	  var seqParam = document.getElementById("idxt2");
	  seqParam.setAttribute("alt",se);
	  
}

function ajwidl(){
	document.getElementById("modal01").style.display = "none";
}

function ajwidl2(){
	document.getElementById("modal02").style.display = "none";
}

function godetail(obj){
	var tet = obj.getAttribute("alt");
	console.log(tet);
	//var logi = obj.alt;
	$('#frm1').append("<input type='hidden' name='IDX' id='IDX' value='"+tet+"'/>");
	var forming = document.getElementById("frm1");
	forming.submit();
}

function godetail2(obj){
	var tet = obj.getAttribute("alt");
	console.log(tet);
	var logi = obj.alt;
	$('#frm2').append("<input type='hidden' name='IDX2' id='IDX2' value='"+tet+"'/>");
	var forming = document.getElementById("frm2");
	forming.submit();
}

</script>
</body>
</html>
