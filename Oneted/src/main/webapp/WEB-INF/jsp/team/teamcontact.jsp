<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>Oneted</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html, body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", sans-serif
}
/* .w3-third w3-container w3-margin-bottom { */
/* 	width: 390px; */
/* 	height: 520px; */
/* } */
</style>
</head>
<body class="w3-light-grey w3-content" style="max-width: 100%">
	<jsp:include page="/WEB-INF/include/navBar.jspf" />
	<!-- Sidebar/menu -->
	<nav class="w3-sidebar w3-collapse w3-white w3-animate-left"
		style="z-index: 3; width: 300px;" id="mySidebar">
		<br> <br> <br> <br>
		<div class="w3-container">
			<a href="" onclick="w3_close()"
				class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey"
				title="close menu"> <i class="fa fa-remove"></i>
			</a> <img
				src="${pageContext.request.contextPath}/resources/images/${TEAMCONTACT.TEAM_IMG}"
				style="width: 45%;" alt="팀사진" class="w3-round"><br> <br>
			<h4>
				<b>${TEAMCONTACT.TEAM_NAME}</b>
			</h4>
			<!-- <p class="w3-text-grey">by 팀 이름</p> -->
		</div>

		<div class="w3-bar-block">
			<a href=<c:url value='/team/openTeamInfo.do'/> onclick="w3_close()"
				class="w3-bar-item w3-button w3-padding"><i
				class="fa fa-th-large fa-fw w3-margin-right"></i>Team Info</a> <a
				href=<c:url value='/team/openTeamMember.do'/> onclick="w3_close()"
				class="w3-bar-item w3-button w3-padding"><i
				class="fa fa-user fa-fw w3-margin-right"></i>Member</a> <a
				href=<c:url value='/team/openTeamContact.do'/> onclick="w3_close()"
				class="w3-bar-item w3-button w3-padding w3-text-teal"><i
				class="fa fa-envelope fa-fw w3-margin-right"></i>Contact</a>
		</div>
		<div class="w3-panel w3-large">
			<a href="http://fb.com" target="b"><i
				class="fa fa-facebook-official w3-hover-opacity"></i></a> <a
				href="https://www.instagram.com/" target="b"><i
				class="fa fa-instagram w3-hover-opacity"></i></a> <a
				href="https://www.snapchat.com/" target="b"><i
				class="fa fa-snapchat w3-hover-opacity"></i></a> <a
				href="https://kr.pinterest.com/" target="b"><i
				class="fa fa-pinterest-p w3-hover-opacity"></i></a> <a
				href="https://twitter.com/" target="b"><i
				class="fa fa-twitter w3-hover-opacity"></i></a> <a
				href="https://kr.linkedin.com/" target="b"><i
				class="fa fa-linkedin w3-hover-opacity"></i></a>
		</div>
	</nav>

	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>

	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 300px">

		<!-- Header -->
		<header id="portfolio">
			<a href="#"><img src="  " alt="로고" style="width: 65px;"
				class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
			<span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey"
				onclick="w3_open()"><i class="fa fa-bars"></i></span> <br> <br>
			<div class="w3-container">
				<br>
				<h1>
					<b>Team Contact</b>
				</h1>
				<div class="w3-section w3-bottombar w3-padding-16"></div>
				<!-- Contact Section -->
				<div class="w3-container w3-padding-32" id="contact">
					<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Contact</h3>
					<p>Lets get in touch and talk about your and our next project.</p>
					<form action="/action_page.php" target="_blank">
						<input class="w3-input" type="text" placeholder="Name" required
							name="Name"> <input class="w3-input w3-section"
							type="text" placeholder="Email" required name="Email"> <input
							class="w3-input w3-section" type="text" placeholder="Subject"
							required name="Subject"> <input
							class="w3-input w3-section" type="text" placeholder="Comment"
							required name="Comment">
						<button class="w3-button w3-black w3-section" type="submit">
							<i class="fa fa-paper-plane"></i> SEND MESSAGE
						</button>
					</form>
				</div>
			</div>
		</header>

		<div class="w3-row-padding">
			<!-- Member -->

			<!-- Member End -->


		</div>
		<!-- Pagination -->
		<!-- 		<div class="w3-center w3-padding-32"> -->
		<!-- 			<div class="w3-bar"> -->
		<!-- 				<a href="#" class="w3-bar-item w3-button w3-hover-black">«</a> <a -->
		<!-- 					href="#" class="w3-bar-item w3-black w3-button">1</a> <a href="#" -->
		<!-- 					class="w3-bar-item w3-button w3-hover-black">2</a> <a href="#" -->
		<!-- 					class="w3-bar-item w3-button w3-hover-black">3</a> <a href="#" -->
		<!-- 					class="w3-bar-item w3-button w3-hover-black">4</a> <a href="#" -->
		<!-- 					class="w3-bar-item w3-button w3-hover-black">»</a> -->
		<!-- 			</div> -->
		<!-- 		</div> -->
		<!-- End page content -->
	</div>
	<jsp:include page="/WEB-INF/include/footer.jspf" />
	<script>
		// Script to open and close sidebar
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