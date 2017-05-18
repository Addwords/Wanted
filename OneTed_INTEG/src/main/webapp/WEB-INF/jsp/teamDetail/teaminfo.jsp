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
a.w3-btn{
	color: white!important;
}
a:hover{
	color: #337ab7!important;
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
				src="<c:url value='/common/getImage.do?IMG_NAME=${TEAMINFO.TEAM_IMG}'/>"
				style="width: 45%;" alt="팀사진" class="w3-round"><br> <br>
			<h4>
				<b>${TEAMINFO.TEAM_NAME}</b>
			</h4>
			<!-- <p class="w3-text-grey">by 팀 이름</p> -->
		</div>

		<div class="w3-bar-block">
			<a href=<c:url value='/teamDetail/openTeamInfo.do'/> onclick="w3_close()"
				class="w3-bar-item w3-button w3-padding w3-text-teal"><i
				class="fa fa-th-large fa-fw w3-margin-right"></i>Team Info</a> <a
				href=<c:url value='/teamDetail/openTeamMember.do'/> onclick="w3_close()"
				class="w3-bar-item w3-button w3-padding"><i
				class="fa fa-user fa-fw w3-margin-right"></i>Member</a> <a
				href=<c:url value='/teamDetail/teamBoardList.do'/> onclick="w3_close()"
				class="w3-bar-item w3-button w3-padding"><i
				class="fa fa-file fa-fw w3-margin-right"></i>Board</a>
				<a onclick="popitup('${pageContext.request.contextPath}/teamDetail/ChatWindow.do')" class="w3-bar-item w3-button w3-padding">
				<i class="fa fa-comment fa-fw w3-margin-right"></i>
				TeamChat
			</a>				
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
					<b>Team Info</b>
					<a href="#this" id="apply"
						style="font-size: 20px; float: right; display: none; background-color:inherit; color:black!important;" class="w3-btn">Join Us</a>
					<a href="#this" id="invited"
						style="font-size: 20px; float: right; display: none; background-color:inherit; color:black!important;" class="w3-btn">Invited</a>
					<a href="#this" id="applied"
						style="font-size: 20px; float: right; display: none; background-color:inherit; color:black!important;" class="w3-btn">Applied</a>
					<a href="#this" id="leave"
						style="font-size: 20px; float: right; display: none; background-color:inherit; color:black!important;" class="w3-btn">Leave Us</a>

				</h1>
				<div class="w3-section w3-bottombar w3-padding-16"></div>
				<div class="w3-panel">
					<div class="w3-row-padding" style="margin: 0 -16px">
						<div class="w3-third">
							<h5>${TEAMINFO.TEAM_NAME}</h5>
							<img
								src="<c:url value='/common/getImage.do?IMG_NAME=${TEAMINFO.TEAM_IMG}'/>"
								style="width: 100%;height: 375px;" alt="팀 사진">
						</div>
						<div class="w3-twothird">
							<h5>INFORMATION</h5>
							<table class="w3-table w3-striped w3-white">
								<tr>
									<td><i class="fa fa-user w3-text-red w3-large"></i></td>
									<td>Leader</td>
									<td><i>${TEAMINFO.L_EMAIL}</i></td>
								</tr>
								<tr>
									<td><i class="fa fa-users w3-text-yellow w3-large"></i></td>
									<td>Member</td>
									<td><i>LINKED&nbsp&nbsp&nbsp&nbsp&nbsp(${INGUSER.COUNT}/${TOTALUSER.COUNT})</i></td>
								</tr>
								<tr>
									<td><i class="fa fa-bookmark w3-text-blue w3-large"></i></td>
									<td>Explane</td>
									<td><i>${TEAMINFO.TEAM_EXP}</i></td>
								</tr>
								<tr><td colspan="3">&nbsp</td></tr>
								<tr>
									<td colspan="3"
										class="w3-container w3-row w3-center w3-dark-grey w3-padding-64">
										<div class="w3-quarter"><a href="#this" class="w3-btn" style="background-color:inherit;">
											<span class="w3-xxlarge">14+</span> <br>Partners</a>
										</div>
										<div class="w3-quarter"><a href="#this" class="w3-btn" style="background-color:inherit;">
											<span class="w3-xxlarge">55+</span> <br>Projects</a>
										</div>
										<div class="w3-quarter"><a href="#this" class="w3-btn" style="background-color:inherit;">
											<span class="w3-xxlarge">89+</span> <br>Clients</a>
										</div>
										<div class="w3-quarter"><a href="#this" class="w3-btn" style="background-color:inherit;">
											<span class="w3-xxlarge">150+</span> <br>Meetings</a>
										</div>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<hr>
				<div class="w3-container">
					<h5>Recent Users</h5>
					<ul class="w3-ul w3-card-4 w3-white">
						<c:forEach items="${RECENTUSER}" var="u">
						<li class="w3-padding-16"><img src="<c:url value='/common/getImage.do?IMG_NAME=${u.MBER_IMG}'/>"
							class="w3-left w3-circle w3-margin-right" style="width: 35px">
							<span class="w3-xlarge">${u.MBERLOG_EMAIL}</span><br></li>
						</c:forEach>
					</ul>
				</div>
				<hr>

				<div class="w3-container">
					<h5>Recent Comments</h5>
					<c:forEach items="${RECENTBOARD}" var="r">
					<div class="w3-row">
						<div class="w3-col m2 text-center">
							<img class="w3-circle" src="<c:url value='/common/getImage.do?IMG_NAME=${r.MBER_IMG}'/>"
								style="width: 96px; height: 96px">
						</div>
						<div class="w3-col m10 w3-container">
							<h4>
								${r.WRITER_EMAIL} <span class="w3-opacity w3-medium">${r.WRITE_TIME}</span>
							</h4>
							<p>${r.CONTENT}</p>
							<br>
						</div>
					</div>
					</c:forEach>
				</div>
				<br>
			</div>
		</header>
		<div class="w3-row-padding">
		</div>
	</div>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<jsp:include page="/WEB-INF/include/footer.jspf" />
	<script>
		var status='${CHECKSTATUS.MBER_STATUS}';
		var email = '${sessionScope.LOGEMAIL}';
		
		$(document).ready(function(){
			if(!(status == "LEADER"||status == "MEMBER")){
				if(status==''||status==null||status=="LEAVED"){
					$('#apply').show();
					return;
				}else if(status=="APPLIED"){
					$('#applied').show();
					return;
				}else if(status=="INVITED"){
					$('#invited').show();
					return;
				}
			}
			else{
				$('#leave').show();
			}
		});
		$(document.body).on("click", "a[id='apply']", function() {
			fn_apply($(this));
		});
		$(document.body).on("click", "a[id='leave']", function() {
			fn_leave($(this));
		});
		function fn_apply() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/teamDetail/teamAplly.do'/>");
			comSubmit.addParam("LOGEMAIL",email);
			comSubmit.submit();
		}
		function fn_leave(p) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/teamDetail/teamLeave.do'/>");
			comSubmit.addParam("LOGEMAIL",email);
			comSubmit.submit();
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
		
		var winRef;
		function popitup(url) {
		    if(winRef == null){
		        winRef = window.open(url,'chatWindow','width=520,height=745,status=no,toolbar=no,left=1500,top=90');
		    }else{
		        if (winRef.closed == false) {
		            winRef.focus();
		        }else{
		            winRef = window.open(url,'chatWindow','width=520,height=745,status=no,toolbar=no,left=1500,top=90');
		        }
		    }
		}
	</script>
</body>
</html>