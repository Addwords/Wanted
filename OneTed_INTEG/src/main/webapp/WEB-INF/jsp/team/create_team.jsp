<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%String USER=(String)session.getAttribute("LOGEMAIL"); %>
<!DOCTYPE html>
<html>
<head>
<title>Oneted</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html, body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", sans-serif
}

</style>
</head>
<body class="w3-light-grey w3-content" style="max-width: 100%;" >
<%
		if (session.getAttribute("LOGEMAIL") == null) {System.out.println("attribute null");%>			
			<%@include file="/WEB-INF/include/include-outnavbar.jspf" %><%
		}else{System.out.println("attribute exist");%>
			<%@include file="/WEB-INF/include/include-innavbar.jspf" %><%
		}
	%>
	<!-- Sidebar/menu -->
	<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3; width: 200px;" id="mySidebar">
		<br> <br> <br> <br>
		<div class="w3-container">
			<a href="" onclick="w3_close()"
				class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey"
				title="close menu"> <i class="fa fa-remove"></i>
			</a> <img src="../resources/images/team1.jpg"
				style="width: 45%;" alt="팀사진" class="w3-round" id='isrs'><br> <br>
			<h4>
				<b></b>
			</h4>
			<!-- <p class="w3-text-grey">by 팀 이름</p> -->
		</div>

		<div class="w3-bar-block" style="pointer-events: none; opacity: 0.4;">
			<a href=<c:url value='/team/openTeamInfo.do'/> onclick="w3_close()"	class="w3-bar-item w3-button w3-padding w3-text-teal">
				<i class="fa fa-th-large fa-fw w3-margin-right"></i>Team Info</a> 
			<a href=<c:url value='/team/openTeamMember.do'/> onclick="w3_close()" class="w3-bar-item w3-button w3-padding">
				<i class="fa fa-user fa-fw w3-margin-right"></i>Member</a> 
			<a href=<c:url value='/team/openTeamContact.do'/> onclick="w3_close()" class="w3-bar-item w3-button w3-padding">
				<i class="fa fa-envelope fa-fw w3-margin-right"></i>Board</a>
			<a href=<c:url value='/team/openTeamContact.do'/> onclick="w3_close()" class="w3-bar-item w3-button w3-padding">
				<i class="fa fa-envelope fa-fw w3-margin-right"></i>Chating</a>
		</div>
		<div class="w3-panel w3-large" style="pointer-events: none;opacity: 0.4;">
			<a href="http://fb.com" target="b">
			<i class="fa fa-facebook-official w3-hover-opacity"></i></a>
			<a href="https://www.instagram.com/" target="b">
			<i class="fa fa-instagram w3-hover-opacity"></i></a>
			<a href="https://www.snapchat.com/" target="b">
			<i class="fa fa-snapchat w3-hover-opacity"></i></a> 
			<a href="https://kr.pinterest.com/" target="b">
			<i class="fa fa-pinterest-p w3-hover-opacity"></i></a>
			<a href="https://twitter.com/" target="b">
			<i class="fa fa-twitter w3-hover-opacity"></i></a> 
			<a href="https://kr.linkedin.com/" target="b">
			<i class="fa fa-linkedin w3-hover-opacity"></i></a>
		</div>
	</nav>

	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>

	<!-- !PAGE CONTENT! -->
<!-- 	<div class="w3-main" style="margin-left: 300px"> -->

		<!-- Header -->
		<header id="portfolio">
			<a href="#"><img src=" " alt="로고" style="width: 65px;"
				class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
			<span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey"
				onclick="w3_open()"><i class="fa fa-bars"></i></span> <br> <br>
			<div class="w3-container">
				<br>
				<h1>
					<b>Team Info</b>
				</h1>
				<div class="w3-section w3-bottombar w3-padding-16"></div>
				<div class="w3-panel" style="margin-left:200px;">
					<div class="w3-row-padding" style="margin: 0-16px">
					<form action="${pageContext.request.contextPath}/team/createTeamp.do" method="post" enctype="multipart/form-data">
						<div class="w3-third">
							<h5>TEAM</h5>
							<img src="../resources/images/team1.jpg" style="width: 100%" alt="팀 사진" id="isr">
							<hr><input type="file" id="fup" name="TIMG">						
						</div>
						<div class="w3-twothird">
							<h5>TEAM INFORMATION</h5>
							<table class="w3-table w3-striped w3-white">
								<tr>
									<td><i class="fa fa-user w3-text-red w3-large"></i></td>
									<td>Leader<input type="hidden" name="USER" value="<%=USER %>"></td>
									<td><i><%=USER %></i></td>
								</tr>
								<tr>
									<td><i class="fa fa-users w3-text-yellow w3-large"></i></td>
									<td>Team Name</td>
									<td><i><input type='text' name="TNAME"></i></td>
								</tr>
								<tr>
									<td><i class="fa fa-bookmark w3-text-blue w3-large"></i></td>
									<td>Explane</td>
									<td><i><input type='text' name="TINFO"></i></td>
								</tr>

							</table><br><br>
			<button class="w3-button w3-black w3-padding-large w3-margin-bottom w3-margin-left w3-right" type="button" onclick="cancle()">취소</button>&nbsp;&nbsp;				
			<button class="w3-button w3-black w3-padding-large w3-margin-bottom w3-right">생성</button>
						</div>
						</form>
					</div>
				</div>
				<br>
			</div>
		</header>

		<div class="w3-row-padding">
	</div>
	<jsp:include page="/WEB-INF/include/footer.jspf" />
<script>
function cancle(){
	history.go(-1);
}
var upload = document.getElementById('fup');
var holder = document.getElementById('isr');
var holders = document.getElementById('isrs');

upload.onchange = function (e) {
e.preventDefault();

var file = upload.files[0],
  reader = new FileReader();


reader.onload = function (event) {
var img = new Image();
img.src = event.target.result;
if (img.width > 700 || img.height > 500) { // holder width
  img.width = 700;
  img.height = 500;
}

holder.src = img.src;
holders.src = img.src;
};
reader.readAsDataURL(file);

return false;
};
</script>
</body>
</html>