<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<title>ONETED</title>
<!-- <meta charset="UTF-8"> -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">

<style>
	body,h1 {font-family: "Raleway", sans-serif}
	body, html {height: 100%}
	.bgimg {
	    background-image: url('${pageContext.request.contextPath}/resources/images/main.jpg');
	    min-height: 100%;
	    background-position: center;
	    background-size: cover;
	}
	#open_search{display:none; padding: 10px;}
 	#search{color: black;font-size:14pt;} 
/* 	#cs{background-color: black; height:20px;} */
</style>
<body>
	<%
		if (session.getAttribute("LOGEMAIL") == null) {System.out.println("attribute null");%>			
			<%@include file="/WEB-INF/include/include-outnavbar.jspf" %><%
		}else{System.out.println("attribute exist");%>
			<%@include file="/WEB-INF/include/include-innavbar.jspf" %><%
		}
	%>
	<nav class="w3-sidebar w3-bar-block w3-black w3-animate-right w3-top w3-text-light-grey w3-large" style="z-index:3;width:250px;font-weight:bold;display:none;right:0;" id="mySidebar">
	  <a href="../team/createTeam.do" onclick="w3_close()" class="w3-bar-item w3-button w3-center w3-padding-16">Make Team</a> 
	  <a href="../team/createProject.do" onclick="w3_close()" class="w3-bar-item w3-button w3-center w3-padding-16">Make Project</a> 
	  <a href="../team/myteam_list.do" onclick="w3_close()" class="w3-bar-item w3-button w3-center w3-padding-16">My Team</a>
	  <a href="../team/myproject_list.do" onclick="w3_close()" class="w3-bar-item w3-button w3-center w3-padding-16">My Project</a>
<!-- 	  <a href="#" onclick="w3_close()" class="w3-bar-item w3-button w3-center w3-padding-16">LogOut</a> -->
</nav>
<div class="bgimg w3-display-container w3-animate-opacity w3-text-white">
  <div class="w3-display-topleft w3-padding-large w3-xlarge">
    Logo
  </div>
  <div class="w3-display-middle" style="text-align: center;">
    <h1 class="w3-jumbo w3-animate-top"><span style="color:  #ff0000;">ONE </span>TED</h1>
    <hr class="w3-border-gray" style="margin:auto;width:40%">
	<!--   검색부분      -->
    <div id="open_search" class="w3-animate-zoom">
    <form action=<c:url value='/team/searchList.do'/>> 
    <input type="text" size="40" autofocus id="search" name="search" placeholder="Search...">
    </form>
    <span class="w3-button w3-large w3-hover-red" onclick="csearch()">&times;</span>
    </div>
    
    <p class="w3-large w3-center"><span id="total" style="text-decoration:underline; font-size: 30px">20</span> PEOPLE are waiting.</p>
  </div>
  <div class="w3-display-bottomleft w3-padding-large">
    Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">CENTER_602</a>
  </div>
  
</div>
  	  <div class="w3-overlay w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<script type="text/javascript">
function csearch(){
	document.getElementById('open_search').style.display='none'
}
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