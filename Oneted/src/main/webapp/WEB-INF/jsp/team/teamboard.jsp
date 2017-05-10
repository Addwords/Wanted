<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="/resources/tld/el-function.tld" prefix="moutil" %>
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

<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<!-- 5grid -->
<script src="${pageContext.request.contextPath}/5grid/viewport.js"></script>
<!-- [if lt IE 9]><script src="5grid/ie.js"></script><![endif] -->

<script src="${pageContext.request.contextPath}/5grid/ie.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/5grid/core.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/style.css" />
<link href='http://fonts.googleapis.com/css?family=Lustria'
	rel='stylesheet' type='text/css'>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.slidertron-1.0.js"></script>
<style>
html, body, h1, h2, h3, h4, h5, h6 {
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
			<a href="" onclick="w3_close()"
				class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey"
				title="close menu"> <i class="fa fa-remove"></i>
			</a> <img
				src="${pageContext.request.contextPath}/images/${TEAMCONTACT.TEAM_IMG}"
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
				href=<c:url value='/team/teamBoardList.do'/> onclick="w3_close()"
				class="w3-bar-item w3-button w3-padding w3-text-teal"><i
				class="fa fa-envelope fa-fw w3-margin-right"></i>Contact</a>
		</div>
		<div class="w3-panel w3-large">
			<a style="color: black;" href="http://fb.com" target="b"><i
				class="fa fa-facebook-official w3-hover-opacity"></i></a> <a
				style="color: black;" href="https://www.instagram.com/" target="b"><i
				class="fa fa-instagram w3-hover-opacity"></i></a> <a
				style="color: black;" href="https://www.snapchat.com/" target="b"><i
				class="fa fa-snapchat w3-hover-opacity"></i></a> <a
				style="color: black;" href="https://kr.pinterest.com/" target="b"><i
				class="fa fa-pinterest-p w3-hover-opacity"></i></a> <a
				style="color: black;" href="https://twitter.com/" target="b"><i
				class="fa fa-twitter w3-hover-opacity"></i></a> <a style="color: black;"
				href="https://kr.linkedin.com/" target="b"><i
				class="fa fa-linkedin w3-hover-opacity"></i></a>
		</div>
	</nav>
	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>
	<!-- !PAGE CONTENT! -->
	<div class="5grid">
		<div class="1u-first"></div>
		<header class="10u">
			<h1>
				<span>Team</span>Name
			</h1>
			<p>News Feed</p>
		</header>
		<div class="1u"></div>
		<!-- ****************************************************************************************************************** -->
		<!-- 		<div class="1u-first"></div> -->
		<!-- 		<div id="slider" class="10u"> -->
		<!-- 			<a href="#" class="previous-button">&lt;</a> <a href="#" -->
		<!-- 				class="next-button">&gt;</a> -->
		<!-- 			<div class="shadow"></div> -->
		<!-- 			<div class="viewer"> -->
		<!-- 				<ul class="reel"> -->
		<!-- 					<li class="slide"> -->
		<!-- 						<h2>This is the first slide.</h2> -->
		<!-- 						<p>Lorem ipsum dolor sit amet nullam.</p> <a class="link" -->
		<!-- 						href="http://nodethirtythree.com/#slidertron-slide-1">Full -->
		<%-- 							story ...</a> <img src="${pageContext.request.contextPath}/images/1.jpg" alt="" /> --%>
		<!-- 					</li> -->
		<!-- 					<li class="slide"> -->
		<!-- 						<h2>This is the second slide.</h2> -->
		<!-- 						<p>Lorem ipsum dolor sit amet nullam.</p> <a class="link" -->
		<!-- 						href="http://nodethirtythree.com/#slidertron-slide-2">Full -->
		<%-- 							story ...</a> <img src="${pageContext.request.contextPath}/images/2.jpg" alt="" /> --%>
		<!-- 					</li> -->
		<!-- 					<li class="slide"> -->
		<!-- 						<h2>This is the third slide.</h2> -->
		<!-- 						<p>Lorem ipsum dolor sit amet nullam.</p> <a class="link" -->
		<!-- 						href="http://nodethirtythree.com/#slidertron-slide-3">Full -->
		<%-- 							story ...</a> <img src="${pageContext.request.contextPath}/images/3.jpg" alt="" /> --%>
		<!-- 					</li> -->
		<!-- 					<li class="slide"> -->
		<!-- 						<h2>This is the fourth slide.</h2> -->
		<!-- 						<p>Lorem ipsum dolor sit amet nullam.</p> <a class="link" -->
		<!-- 						href="http://nodethirtythree.com/#slidertron-slide-4">Full -->
		<%-- 							story ...</a> <img src="${pageContext.request.contextPath}/images/4.jpg" alt="" /> --%>
		<!-- 					</li> -->
		<!-- 					<li class="slide"> -->
		<!-- 						<h2>This is the fifth slide.</h2> -->
		<!-- 						<p>Lorem ipsum dolor sit amet nullam.</p> <a class="link" -->
		<!-- 						href="http://nodethirtythree.com/#slidertron-slide-5">Full -->
		<%-- 							story ...</a> <img src="${pageContext.request.contextPath}/images/5.jpg" alt="" /> --%>
		<!-- 					</li> -->
		<!-- 					<li class="slide"> -->
		<!-- 						<h2>This is the sixth slide.</h2> -->
		<!-- 						<p>Lorem ipsum dolor sit amet nullam.</p> <a class="link" -->
		<!-- 						href="http://nodethirtythree.com/#slidertron-slide-6">Full -->
		<%-- 							story ...</a> <img src="${pageContext.request.contextPath}/images/6.jpg" alt="" /> --%>
		<!-- 					</li> -->
		<!-- 					<li class="slide"> -->
		<!-- 						<h2>This is the seventh slide.</h2> -->
		<!-- 						<p>Lorem ipsum dolor sit amet nullam.</p> <a class="link" -->
		<!-- 						href="http://nodethirtythree.com/#slidertron-slide-7">Full -->
		<%-- 							story ...</a> <img src="${pageContext.request.contextPath}/images/7.jpg" alt="" /> --%>
		<!-- 					</li> -->
		<!-- 					<li class="slide"> -->
		<!-- 						<h2>This is the eighth slide.</h2> -->
		<!-- 						<p>Lorem ipsum dolor sit amet nullam.</p> <a class="link" -->
		<!-- 						href="http://nodethirtythree.com/#slidertron-slide-8">Full -->
		<%-- 							story ...</a> <img src="${pageContext.request.contextPath}/images/8.jpg" alt="" /> --%>
		<!-- 					</li> -->
		<!-- 				</ul> -->
		<!-- 			</div> -->
		<!-- 			<div class="indicator"> -->
		<!-- 				<ul> -->
		<!-- 					<li class="active">1</li> -->
		<!-- 					<li>2</li> -->
		<!-- 					<li>3</li> -->
		<!-- 					<li>4</li> -->
		<!-- 					<li>5</li> -->
		<!-- 					<li>6</li> -->
		<!-- 					<li>7</li> -->
		<!-- 					<li>8</li> -->
		<!-- 				</ul> -->
		<!-- 			</div> -->
		<!-- 		</div> -->
		<!-- 		<div class="1u"></div> -->
		<!-- 		<script type="text/javascript"> -->
		<!-- // 			$('#slider').slidertron({ -->
		<!-- // 				viewerSelector : '.viewer', -->
		<!-- // 				reelSelector : '.viewer .reel', -->
		<!-- // 				slidesSelector : '.viewer .reel .slide', -->
		<!-- // 				advanceDelay : 3000, -->
		<!-- // 				speed : 'slow', -->
		<!-- // 				navPreviousSelector : '.previous-button', -->
		<!-- // 				navNextSelector : '.next-button', -->
		<!-- // 				indicatorSelector : '.indicator ul li', -->
		<!-- // 				slideLinkSelector : '.link' -->
		<!-- // 			}); -->
		<!-- 		</script> -->
		<!-- ****************************************************************************************************************** -->
		<!-- Post Block -->
		<div class="1u-first"></div>
		<!-- Post Start -->
		<div class="10u post">
			<section>
				<form id="board" name="board">
					<h2><input type="text" size="44" id="title" name="TITLE" style="border-style:hidden;" placeholder="Write down your idea"></h2>
					<p><textarea rows="4" cols="96" style="width: 789px; border-style:hidden;" id="contents" name="CONTENTS" placeholder="Join the discussion"></textarea></p>
					<b><button style="float:right;" class="btn" id="btn-board">Post</button></b>
					<br>
				</form>
			</section>
			<div class="shadow"></div>
		</div>
		<!-- Post End -->
		<div class="1u"></div>
		<!-- End Post Block -->
		<!-- Post Block -->
		<c:forEach items="${BOARDLIST}" var="b">
			<div class="1u-first"></div>
			<!-- Post Start -->
			<div class="10u post">
				<section>
					<h2>
						<a href="#this" style="text-decoration:none">${b.BOARD_TITLE}</a>
					</h2>
					<p>${moutil:getContent(b.CONTENT)}</p>
					<p style="opacity: 0.9;color: #3d89b9; font-style: italic;"><span style="color: black;">${b.WRITER_EMAIL}</span>　 <span style="font-style:normal; opacity: 1.0 ; color: black;">|</span>　 ${moutil:calculateTime(b.WRITE_TIME)}</p>
				</section>
				<div class="shadow"></div>
			</div>
			<!-- Post End -->
			<div class="1u"></div>
		</c:forEach>
		<!-- End Post Block -->

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
		<div class="10u post" style="text-align: center;">
			<c:if test="${not empty paginationInfo}">
				<ui:pagination paginationInfo="${paginationInfo}" type="image"
					jsFunction="fn_search" />
			</c:if>
			<input type="hidden" id="currentPageNo" name="currentPageNo" />
		</div>
	</div>
	<form id="commonForm" name="commonForm"></form>

	<script type="text/javascript"
		src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>
	<script src="${pageContext.request.contextPath}/bundle.js"></script>
	<div class="hiddendiv common"></div>

	<jsp:include page="/WEB-INF/include/footer.jspf" />
	<script>
		$("#btn-board").on("click", function(e){ //글쓰기 버튼
			fn_insertBoard();
		});	
	
		// Script to open and close sidebar
		function w3_open() {
			document.getElementById("mySidebar").style.display = "block";
			document.getElementById("myOverlay").style.display = "block";
		}

		function w3_close() {
			document.getElementById("mySidebar").style.display = "none";
			document.getElementById("myOverlay").style.display = "none";
		}

		function fn_search(pageNo) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/team/teamBoardList.do' />");
			comSubmit.addParam("currentPageNo", pageNo);
			comSubmit.submit();
		}
		
		function fn_insertBoard(){
			var comSubmit = new ComSubmit("board");
			comSubmit.setUrl("<c:url value='/team/insertBoard.do' />");
			comSubmit.submit();
		}
	</script>
</body>
</html>