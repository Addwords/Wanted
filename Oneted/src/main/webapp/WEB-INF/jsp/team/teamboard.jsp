<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="/resources/tld/el-function.tld" prefix="moutil"%>
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
<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<!-- 5grid -->
<script src="${pageContext.request.contextPath}/resources/js/viewport.js"></script>
<!-- [if lt IE 9]><script src="5grid/ie.js"></script><![endif] -->

<script src="${pageContext.request.contextPath}/resources/js/ie.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/core.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css?ver=0.2" />
<link href='http://fonts.googleapis.com/css?family=Lustria'
	rel='stylesheet' type='text/css'>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.slidertron-1.0.js"></script>
<style>
html, body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", sans-serif
}
</style>
</head>
<body class="w3-light-grey w3-content" style="max-width: 100%">
	<%
		if (session.getAttribute("LOGEMAIL") == null) {System.out.println("attribute null");%>			
			<%@include file="/WEB-INF/include/include-outnavbar.jspf" %><%
		}else{System.out.println("attribute exist");%>
			<%@include file="/WEB-INF/include/include-innavbar.jspf" %><%
		}
	%>
	<!-- Sidebar/menu -->
	<nav class="w3-sidebar w3-collapse w3-white w3-animate-left"
		style="z-index: 3; width: 300px;" id="mySidebar">
		<br> <br> <br> <br>
		<div class="w3-container">
			<a href="" onclick="w3_close()"
				class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey"
				title="close menu"> <i class="fa fa-remove"></i>
			</a> <img
				src="${pageContext.request.contextPath}/resources/images/${BOARDLIST[0].TEAM_IMG}"
				style="width: 45%;" alt="팀사진" class="w3-round"><br> <br>
			<h4>
				<b>${BOARDLIST[0].TEAM_NAME}</b>
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
				class="fa fa-file fa-fw w3-margin-right"></i>Board</a>
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
			<br> <br>
			<h1>
				<span>Team-</span>${BOARDLIST[0].TEAM_NAME}
			</h1>
			<p>News Feed</p>
		</header>
		<div class="1u"></div>

		<!-- Post Block -->
		<div class="1u-first"></div>
		<!-- Post Start -->
		<div class="10u post">
			<section>
				<form id="board" name="board">
					<h2>
						<input type="text" size="44" id="title" name="TITLE"
							style="border-style: hidden;" placeholder="Write down your idea">
					</h2>
					<p>
						<textarea rows="4" cols="96"
							style="width: 789px; border-style: hidden;" id="contents"
							name="CONTENTS" placeholder="Join the discussion"></textarea>
					</p>
					<b><button style="float: right;" class="btn" id="btn-board">Post</button></b>
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
					<div id="re-board">
						<h2>
							<a href="#this" style="text-decoration: none" id="board_title">${b.BOARD_TITLE}</a>
						</h2>
						<div id="option-button" style="z-index: 10; position: absolute; right: 100px; top: 60px;">
							<a class="dropdown-toggle" data-toggle="dropdown" id="dropdown-button" style="color: #039be5; cursor:pointer;">
								<i class="material-icons icon-button">more_vert</i>
							</a>
							<ul class="dropdown-menu" id="dropdown-menu" style="position: absolute; left: 10px; top: 20px;">
								<li><a href="#this" id="update">Edit</a></li>
								<li><a href="#this" id="remove">Remove</a></li>
							</ul>
						</div>
						<a id="board_content">${moutil:getContent(b.CONTENT)}</a>
					</div>
					<p style="opacity: 0.9; color: #3d89b9; font-style: italic;">
						<span style="color: black;">${b.WRITER_EMAIL}</span> <span
							style="font-style: normal; opacity: 1.0; color: black;">|</span>
						${moutil:calculateTime(b.WRITE_TIME)}
					</p>
					<input type="hidden" id="IDX" value="${b.BOARD_ID}">
				</section>
				<div class="shadow"></div>
			</div>
			<!-- Post End -->
			<div class="1u"></div>
		</c:forEach>
		<!-- End Post Block -->

		<div class="10u post" style="text-align: center;">
			<c:if test="${not empty paginationInfo}">
				<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_search"/>
			</c:if>
			<input type="hidden" id="currentPageNo" name="currentPageNo" />
		</div>
	</div>

<!-- 	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script> -->
<!-- 	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script> -->
<%-- 	<script src="${pageContext.request.contextPath}/bundle.js"></script> --%>
<!-- 	<div class="hiddendiv common"></div> -->

<%@ include file="/WEB-INF/include/include-body.jspf"%>
<% session.setAttribute("LOGEMAIL", "c@c.com"); %>
	<jsp:include page="/WEB-INF/include/footer.jspf" />
	<script>
		var email = '${sessionScope.LOGEMAIL}';
		$("#btn-board").on("click", function() { //글쓰기 버튼
			fn_insertBoard();
		});
		$(document.body).on("click", "a[id='update']", function(){
			var creaEmail = $(this).find("#writer_email").html();
			if(!email.equal(creaEmail))
			{
				alert("글쓴이가 아닙니다.");
				return;
			}
			fn_updateBoard($(this));
		});
		$(document.body).on("click", "#re-btn-board", function(){
			console.log("ad");
			fn_updateBoard2($(this));
		});
		$(document.body).on("click", "a[id='remove']", function(){
		    fn_deleteBoard($(this));
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

		function fn_insertBoard() {
			var comSubmit = new ComSubmit("board");
			comSubmit.setUrl("<c:url value='/team/insertBoard.do' />");
			comSubmit.submit();
		}
		
		function fn_updateBoard(obj) {
			
// 			console.log("hi"+obj.parent().parent().parent().parent().find("#board_title").html());
			var re_title = obj.parent().parent().parent().parent().find("#board_title").html();
			var re_content = obj.parent().parent().parent().parent().find("#board_content").html();
			
			var BoardForm= obj.parent().parent().parent().parent().parent().find("#re-board");
			
			BoardForm.empty();
			
			var form = "<form id='re-board' name='re-board'>"+
						"<h2>"+
							"<input type='text' size='44' id='title' name='TITLE' style='border-style: hidden;' value='"+re_title+"'>"+
						"</h2>"+
						"<p>"+
							"<textarea rows='4' cols='96'"+
								"style='width: 789px; border-style: hidden;' id='contents'"+
								"name='CONTENTS'>"+re_content+"</textarea>"+
						"</p>"+
						"<b><a style='float: right;' class='btn' id='re-btn-board'>Re-Post</a></b>"+
						"<br>"+
				 	"</form>";
			BoardForm.append(form);
		}
		
		function fn_updateBoard2(obj) {
// 			console.log(obj.parent().parent().parent().parent().find("#title").val());
	        var comSubmit = new ComSubmit();
	        comSubmit.setUrl("/first/team/updateBoard.do");
	        comSubmit.addParam("IDX", obj.parent().parent().parent().parent().find("#IDX").val());
	        comSubmit.addParam("TITLE", obj.parent().parent().parent().parent().find("#title").val());
	        comSubmit.addParam("CONTENTS", obj.parent().parent().parent().parent().find("#contents").val());
	        comSubmit.submit();
		}
		
		function fn_deleteBoard(obj) {
// 			console.log(obj.parent().parent().parent().parent().parent().find("#IDX").val());
	        var comSubmit = new ComSubmit();
	        comSubmit.setUrl("${pageContext.request.contextPath}/team/deleteBoard.do");
	        comSubmit.addParam("IDX", obj.parent().parent().parent().parent().parent().find("#IDX").val());
	        comSubmit.submit();
		}
	</script>
</body>
</html>