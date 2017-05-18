<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title>Oneted</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
#tn {
	float: right;
}

#mimg {
	width: 400px;
	height: 300px;
}

body, h1, h2, h3, h4, h5, h6 {
	font-family: "Montserrat", sans-serif
}

.w3-row-padding img {
	margin-bottom: 12px
}
/* Set the width of the sidebar to 120px */
.w3-sidebar {
	width: 120px;
	background: #222;
}
/* Add a left margin to the "page content" that matches the width of the sidebar (120px) */
#main {
	margin-left: 120px
}
/* Remove margins from "page content" on small screens */
@media only screen and (max-width: 600px) {
	#main {
		margin-left: 0
	}
}
</style>
<body class="w3-white">
	<%
		if (session.getAttribute("LOGEMAIL") == null) {
			System.out.println("attribute null");
	%>
	<%@include file="/WEB-INF/include/include-outnavbar.jspf"%>
	<%
		} else {
			System.out.println("attribute exist");
	%>
	<%@include file="/WEB-INF/include/include-innavbar.jspf"%>
	<%
		}
	%>
	<!-- Icon Bar (Sidebar - hidden on small screens) -->
	<nav class="w3-sidebar w3-bar-block w3-small w3-hide-small w3-center">
		<!-- Avatar image in top left corner -->
		<c:forEach items='${teamone}' var='cd'>
			<img src="../resources/images/${cd.TIMG }" width="60" height="60">
		</c:forEach>
		<!--   <img src="/w3images/avatar_smoke.jpg" style="width:100%"> -->
		<a href=<c:url value='/team/openTeamList.do'/>
			class="w3-bar-item w3-button w3-padding-large w3-black"> <i
			class="fa fa-home w3-xxlarge"></i>
			<p>HOME</p>
		</a> <a href="#about"
			class="w3-bar-item w3-button w3-padding-large w3-hover-black"> <i
			class="fa fa-user w3-xxlarge"></i>
			<p>ABOUT</p>
		</a> <a href="#photos"
			class="w3-bar-item w3-button w3-padding-large w3-hover-black"> <i
			class="fa fa-eye w3-xxlarge"></i>
			<p>PHOTOS</p>
		</a> <a href="#contact"
			class="w3-bar-item w3-button w3-padding-large w3-hover-black"> <i
			class="fa fa-envelope w3-xxlarge"></i>
			<p>CONTACT</p>
		</a>
	</nav>

	<!-- Navbar on small screens (Hidden on medium and large screens) -->
	<div class="w3-top w3-hide-large w3-hide-medium" id="myNavbar">
		<div
			class="w3-bar w3-black w3-opacity w3-hover-opacity-off w3-center w3-small">
			<a href="#" class="w3-bar-item w3-button"
				style="width: 25% !important">HOME</a> <a href="#about"
				class="w3-bar-item w3-button" style="width: 25% !important">ABOUT</a>
			<a href="#photos" class="w3-bar-item w3-button"
				style="width: 25% !important">PHOTOS</a> <a href="#contact"
				class="w3-bar-item w3-button" style="width: 25% !important">CONTACT</a>
		</div>
	</div>

	<!-- Page Content -->
	<div class="w3-padding-large" id="main">
		<!-- Header/Home -->
		<header class="w3-container w3-padding-32 w3-center w3-black"
			id="home">

			<c:forEach items="${teamone}" var="dto">
				<h1 class="w3-jumbo">${dto.TNAME }</h1>
				<img src="../resources/images/${dto.TIMG }" alt="pic" id="mimg">
				<h2 id="tn">팀장 : ${dto.EMAIL }</h2>
			</c:forEach>
		</header>

		<!-- About Section -->
		<div class="w3-content w3-justify w3-text-grey w3-padding-64"
			id="about">
			<h1>팀원들 정보</h1>

		</div>

		<!-- Portfolio Section -->
		<div class="w3-padding-64 w3-content" id="photos">
			<h1>자료공유</h1>

		</div>

		<!-- Contact Section -->
		<div class="w3-padding-64 w3-content w3-text-grey" id="contact">
			<h1>뭔지 몰라</h1>
			<!-- End Contact Section -->
		</div>

		<!-- Footer -->
		<footer class="w3-content w3-padding-64 w3-text-grey w3-xlarge">
			<a href="http://fb.com" target="b"><i
				class="fa fa-facebook-official w3-hover-opacity"></i></a> <a
				href="http://instagram.com" target="b"><i
				class="fa fa-instagram w3-hover-opacity"></i></a> <a
				href="http://snapchat.com" target="b"><i
				class="fa fa-snapchat w3-hover-opacity"></i></a> <a
				href="http://twitter.com" target="b"><i
				class="fa fa-twitter w3-hover-opacity"></i></a> <a
				href="http://linkedin.com" target="b"><i
				class="fa fa-linkedin w3-hover-opacity"></i></a>
			<p class="w3-medium">
				Powered by <a href="#" target="_blank" class="w3-hover-text-green">oneted.com</a>
			</p>
			<!-- End footer -->
		</footer>

		<!-- END PAGE CONTENT -->
	</div>

</body>
</html>
