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
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", sans-serif
}

</style>
</head>
<body class="w3-light-grey w3-content" style="max-width: 100%">
	<jsp:include page="/WEB-INF/include/navBar.jspf" />
	<!-- Sidebar/menu -->
	<nav class="w3-sidebar w3-collapse w3-white w3-animate-left"
		style="z-index: 3; width: 300px;" id="mySidebar">
		<br> <br> <br> <br>
		<div class="w3-container">
			<c:set var="team" value="${TEAMMEMBER[0]}" />
			<a href="" onclick="w3_close()"
				class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey"
				title="close menu"> <i class="fa fa-remove"></i>
			</a> <img
				src="${pageContext.request.contextPath}/resources/images/${team.TEAM_IMG}"
				style="width: 45%;" alt="팀사진" class="w3-round"><br> <br>
			<h4>
				<b>${team.TEAM_NAME}</b>
			</h4>
			<!-- <p class="w3-text-grey">by 팀 이름</p> -->
		</div>

		<div class="w3-bar-block">
			<a href=<c:url value='/team/openTeamInfo.do'/> onclick="w3_close()"
				class="w3-bar-item w3-button w3-padding"><i
				class="fa fa-th-large fa-fw w3-margin-right"></i>Team Info</a> <a
				href=<c:url value='/team/openTeamMember.do'/> onclick="w3_close()"
				class="w3-bar-item w3-button w3-padding w3-text-teal" id="all"
				value=""><i class="fa fa-user fa-fw w3-margin-right"></i>Member</a>
			<a href=<c:url value='/team/openTeamContact.do'/>
				onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i
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
			<a href="# "><img src="  " alt="로고" style="width: 65px;"
				class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
			<span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey"
				onclick="w3_open()"><i class="fa fa-bars"></i></span> <br> <br>
			<div class="w3-container">
				<br>
				<h1>
					<b>Team Member</b>
				</h1>
				<div class="w3-section w3-bottombar w3-padding-16">
					<span class="w3-margin-right">Filter:</span>
					<button class="w3-button w3-black" id="all2" value="">ALL</button>
					<button class="w3-button w3-white w3-hide-small" id="manager"
						value="팀장">
						<i class="fa fa-eye w3-margin-right"></i>Manager
					</button>
					<button class="w3-button w3-white" id="planning" value="기획">
						<i class="fa fa-diamond w3-margin-right"></i>Planning
					</button>
					<button class="w3-button w3-white w3-hide-small" id="design"
						value="디자인">
						<i class="fa fa-photo w3-margin-right"></i>Design
					</button>
					<button class="w3-button w3-white w3-hide-small" id="programmer"
						value="개발">
						<i class="fa fa-map-pin w3-margin-right"></i>Programmer
					</button>
				</div>
			</div>
		</header>

		<div class="w3-row-padding">
			<!-- Member -->
			<c:forEach items="${TEAMMEMBER}" var="tm">
				<div class="w3-third w3-container w3-margin-bottom"
					style="width: 20%; height: 20%;">
					<img id="${tm.TM_EMAIL}"
						src="${pageContext.request.contextPath}/resources/images/${tm.MEMBER_IMG}"
						alt="${tm.MEMBER_NAME}" style="width: 100%; height: 100%;"
						class="w3-hover-opacity" onclick="tm_detail(this)">
					<div class="w3-container w3-white">
						<p>
							<br> <b>${tm.MEMBER_NAME}</b>
						</p>
						<p>${tm.TM_ROLE}</p>
						<p>${tm.TM_EMAIL}</p>
					</div>
				</div>
			</c:forEach>
			<!-- Member End -->


		</div>

		<!-- Pagination -->
		<div class="w3-center w3-padding-32">
			<div class="w3-bar">
				<a href="#" class="w3-bar-item w3-button w3-hover-black">«</a> <a
					href="#" class="w3-bar-item w3-black w3-button">1</a> <a href="#"
					class="w3-bar-item w3-button w3-hover-black">2</a> <a href="#"
					class="w3-bar-item w3-button w3-hover-black">3</a> <a href="#"
					class="w3-bar-item w3-button w3-hover-black">4</a> <a href="#"
					class="w3-bar-item w3-button w3-hover-black">»</a>
			</div>
		</div>



		<!-- End page content -->
	</div>

	<!-- 모달1 -->
	<div id="modal01" class="w3-modal">
		<div class="w3-modal-content w3-animate-zoom" style="width: 250px;height:380px;">
			<div class="w3-container w3-black w3-display-container">
				<span class="w3-button w3-display-topright w3-large" onclick="x()">&times;</span>
				<h4>
					<label id='modal_member_name'></label><br>
				</h4>
			</div>
			<div class="w3-container"
				style="padding-left: 0px; padding-bottom: 0px;">
				<form id='frm1' action='../team/openSearchMember.do' method="post">
					<img id="img1" class="tm_img" width="250px">
					<button style="width: 250px" class="w3-button w3-black" type='button' id="modal_bt1"
						name='search_member' onclick="go_detail(this)">Info</button>
					<button style="width: 250px"
						onclick="document.getElementById('contact').style.display='block'"
						class="w3-button w3-black">Contact</button>
				</form>
			</div>
		</div>
	</div>
	<!-- Contact Modal -->
	<div id="contact" class="w3-modal">
		<div class="w3-modal-content w3-animate-zoom">
			<div class="w3-container w3-black">
				<span
					onclick="document.getElementById('contact').style.display='none'"
					class="w3-button w3-display-topright w3-large">x</span>
				<h1>Contact</h1>
			</div>
			<div class="w3-container">
				<p>Reserve a table, ask for today's special or just send us a
					message:</p>
				<form action="/action_page.php" target="_blank">
					<p>
						<input class="w3-input w3-padding-16 w3-border" type="text"
							placeholder="Name" required name="Name">
					</p>
					<p>
						<input class="w3-input w3-padding-16 w3-border" type="number"
							placeholder="How many people" required name="People">
					</p>
					<p>
						<input class="w3-input w3-padding-16 w3-border"
							type="datetime-local" placeholder="Date and time" required
							name="date" value="2017-11-16T20:00">
					</p>
					<p>
						<input class="w3-input w3-padding-16 w3-border" type="text"
							placeholder="Message \ Special requirements" required
							name="Message">
					</p>
					<p>
						<button class="w3-button" type="submit">SEND MESSAGE</button>
					</p>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/include/footer.jspf" />
	<form id="commonForm" name="commonForm"></form>
	<script>
		function tm_detail(element) {

			document.getElementById("modal01").style.display = "block";
			document.getElementById("img1").src = element.src;
			var midText = document.getElementById("modal_member_name");
			midText.innerHTML = element.alt;
			var searchByEmail = element.id;
			var sBE = document.getElementById("modal_bt1");
			sBE.setAttribute("alt", searchByEmail);
		}
		function go_detail(obj) {
			var s_email = obj.getAttribute("alt");
			$('#frm1')
					.append(
							"<input type='hidden' name='SEARCH_MEMBER_EMAIL' value='"+s_email+"'/>");
			var f = document.getElementById("frm1");
			f.submit();
		}
		function x() {
			document.getElementById("modal01").style.display = "none";
		}

		// Script to open and close sidebar
		function w3_open() {
			document.getElementById("mySidebar").style.display = "block";
			document.getElementById("myOverlay").style.display = "block";
		}
		function w3_close() {
			document.getElementById("mySidebar").style.display = "none";
			document.getElementById("myOverlay").style.display = "none";
		}
		function filter_p(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/team/openTeamMember.do' />");
			comSubmit.addParam("ROLE", obj.val());
			comSubmit.submit();
		}

		$("#all").on("click", function() {
			filter_p($(this));
		});

		$("#all2").on("click", function() {
			filter_p($(this));
		});

		$("#planning").on("click", function() {
			filter_p($(this));
		});

		$("#design").on("click", function() {
			filter_p($(this));
		});

		$("#manager").on("click", function() {
			filter_p($(this));
		});

		$("#programmer").on("click", function() {
			filter_p($(this));
		});
	</script>
</body>
</html>