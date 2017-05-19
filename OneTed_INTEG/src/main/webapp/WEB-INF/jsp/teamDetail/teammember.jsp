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
/* .w3-third w3-container w3-margin-bottom { */
/* 	width: 390px; */
/* 	height: 520px; */
/* } */
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
			<c:set var="team" value="${TEAMMEMBER[0]}" />
			<a href="" onclick="w3_close()"
				class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey"
				title="close menu"> <i class="fa fa-remove"></i>
			</a> <img
				src="<c:url value='/common/getImage.do?IMG_NAME=${team.TEAM_IMG}'/>"
				style="width: 45%;" alt="팀사진" class="w3-round"><br> <br>
			<h4>
				<b>${team.TEAM_NAME}</b>
			</h4>
			<!-- <p class="w3-text-grey">by 팀 이름</p> -->
		</div>

		<div class="w3-bar-block">
			<a href=<c:url value='/teamDetail/openTeamInfo.do'/> onclick="w3_close()"
				class="w3-bar-item w3-button w3-padding"><i
				class="fa fa-th-large fa-fw w3-margin-right"></i>Team Info</a> <a
				href=<c:url value='/teamDetail/openTeamMember.do'/> onclick="w3_close()"
				class="w3-bar-item w3-button w3-padding w3-text-teal" id="all"
				value=""><i class="fa fa-user fa-fw w3-margin-right"></i>Member</a>
			<a href=<c:url value='/teamDetail/teamBoardList.do'/>
				onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i
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
						value="LEADER">
						<i class="fa fa-eye w3-margin-right"></i>Manager
					</button>
					<button class="w3-button w3-white" id="planning" value="PLANNING">
						<i class="fa fa-diamond w3-margin-right"></i>Planning
					</button>
					<button class="w3-button w3-white w3-hide-small" id="design"
						value="DESIGN">
						<i class="fa fa-photo w3-margin-right"></i>Design
					</button>
					<button class="w3-button w3-white w3-hide-small" id="programmer"
						value="PROGRAMMER">
						<i class="fa fa-map-pin w3-margin-right"></i>Programmer
					</button>
					
					<!-- ------------상하 추가한부분---------- -->
					<button class="w3-button w3-white w3-hide-small" id="Apply"
						value="APPLIED" disabled="disabled" title="관리자만 사용할 수 있습니다.">
						<i class="fa fa fa-lock	 w3-margin-right"> </i>Manage-Applicant
					</button>
					<button class="w3-button w3-white w3-hide-small" id="Invite"
						value="INVITED" disabled="disabled" title="관리자만 사용할 수 있습니다.">
						<i class="fa fa fa-lock	 w3-margin-right"> </i>Manage-Invited
					</button>
				</div>
			</div>
		</header>

		<div class="w3-row-padding">
			<!-- Member -->
			<c:forEach items="${TEAMMEMBER}" var="tm">
				<div class="w3-third w3-container w3-margin-bottom"
					style="width: 20%; height: 20%;">
					<img id="${tm.MBER_EMAIL}" name="member_img"  
						src="<c:url value='/common/getImage.do?IMG_NAME=${tm.MBER_IMG}'/>"
						alt="${tm.MBER_NAME}"
						class="w3-hover-opacity" onclick="tm_detail($(this).parent())"
						style="width: 100%; height: 300px;">
					<div class="w3-container w3-white">
						<p>
							<br> <b>${tm.MBER_NAME}</b>
						</p>
						<p>${tm.MBER_ROLE}</p>
						<p >${tm.MBER_EMAIL}</p>
						<input type="hidden" id="tmid" value="${tm.TMID}" >
						<input type="hidden" id="member-email" value="${tm.MBER_EMAIL}" >
					</div>
				</div>
			</c:forEach>
			<!-- Member End -->
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
					<img id="img1" class="tm_img" width="250px" height="320px">
					<button style="width: 250px" class="w3-button w3-black" type='button' id="modal_bt1"
						name='search_member' onclick="fn_detail($(this).parent())">Info</button>
					<button style="width: 250px" onclick="fn_message($(this).parent())"
						class="w3-button w3-black">Contact</button>
					<c:if test="${ACCEPT_FLAG == 'OK'}">
						<a style="width: 250px" 
							class="w3-button w3-black" id="btn_accept" title="관리자만 사용할 수 있습니다.">Accept</a>
					</c:if>	
						<a style="width: 250px; opacity: 0.5;"
							class="w3-button w3-black" id="btn_ban" title="관리자만 사용할 수 있습니다.">Ban/Decline</a>
					<input type="hidden" id="modal_tmid">
					<input type="hidden" id="modal_email">
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/include/footer.jspf" />
	<form id="commonForm" name="commonForm"></form>
	<script>
		var teamLeader = '${sessionScope.L_EMAIL}';
		var myEmail = '${sessionScope.LOGEMAIL}';
		$(function(){
			if(myEmail==teamLeader){
				$('#Apply').prop('disabled', false);
				$('#Invite').prop('disabled', false);
				jQuery('#btn_ban').css('opacity', '1');
			}	
		
		});
		
		function tm_detail(element) {
			//구조가 잘못짜여있엇다. 애초에 넘길때 div를 전부넘겨줘서 찾았어야했는데
			//img 태그만 넘기고 그안에 alt같은 요소들로 이름을 뽑아와서 헷갈렷는데
			//아예 onclick단에서 this.parent() 를 보내줘서 div내에 여러요소에 접근하도록 해결함
			//접근시에는 element.find("img[name='member_img']").attr('태그명') 으로 접근 by.상하
			document.getElementById("modal01").style.display = "block";
			document.getElementById("img1").src = element.find("img[name='member_img']").attr('src');
			var midText = document.getElementById("modal_member_name");
			midText.innerHTML = element.find("img[name='member_img']").attr('alt');
			var searchByEmail = element.find("img[name='member_img']").attr('id');;
			var sBE = document.getElementById("modal_bt1");
			
			//상하추가부분 모달로 tmid를 넘겨줘야됨
			document.getElementById("modal_tmid").value = element.find("#tmid").val();
			document.getElementById("modal_email").value= element.find("#member-email").val();
		}
		
		function fn_detail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/mberDetail/mberDetail.do'/>");
	        comSubmit.addParam("SELEMAIL", obj.parent().find('#modal_email').val());
	        comSubmit.submit();
		}
				
		function fn_message(obj) {
			var toEmail = obj.parent().find('#modal_email').val();
			$("#srecipient").val(toEmail);
			$("#ssubject").val("");
			$("#scontents").html("");
			$("#invalid").text("");
			$("#id01").css("display", "block");
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
			comSubmit.setUrl("<c:url value='/teamDetail/openTeamMember.do' />");
			comSubmit.addParam("ROLE", obj.val());
			comSubmit.submit();
		}
		
		function filter_s(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/teamDetail/openTeamMember.do' />");
			comSubmit.addParam("STATUS", obj.val());
			comSubmit.submit();
		}
		
		function fn_accept(obj) {
			console.log(obj.parent().find('#modal_tmid').val());
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/teamDetail/accept.do' />");
			comSubmit.addParam("TMID", obj.parent().find('#modal_tmid').val());
			comSubmit.submit();
		}
		
		function fn_ban(obj) {
			console.log(obj.parent().find('#modal_tmid').val());
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/teamDetail/ban.do' />");
			comSubmit.addParam("TMID", obj.parent().find('#modal_tmid').val());
			comSubmit.submit();
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
		
		$("#Apply").on("click", function() {
			filter_s($(this));
		});
		
		$("#Invite").on("click", function() {
			filter_s($(this));
		});
		$("#btn_accept").on("click", function() {
			fn_accept($(this));
		});
		$("#btn_ban").on("click", function() {
			if(teamLeader != myEmail)
			{
				alert('팀 관리자만 사용 가능합니다.');
				return;
			}
			fn_ban($(this));
		});
	</script>
</body>
</html>