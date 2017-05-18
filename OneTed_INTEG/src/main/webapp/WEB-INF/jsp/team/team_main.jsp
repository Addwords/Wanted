<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Oneted</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<style>
.col-sm-4 {
	width: 350px;
	height: 400px;
}

.tn {
	background-color: orange;
}

.pn {
	background-color: skyblue;
}

.panel-body {
	width: 100%;
	margin: auto;
}

.img-inner {
	width: 260px;
	height: 170px;
}

.detimg {
	width: 400px;
	height: 300px;
}

.modal {
	z-index: 3;
	display: none;
	padding-top: 100px;
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(255, 255, 255, 1);
}

.navbar {
	margin-bottom: 50px;
	border-radius: 0;
}

.jumbotron {
	margin-bottom: 0;
}

footer {
	background-color: #f2f2f2;
	padding: 25px;
}

ft {
	margin-top: 5px;
}

#open_search {
	display: block;
}

.common-title {
	padding-bottom: 5px;
}

.common-title {
	margin: 0;
	padding: 0 0 12px 0;
	color: #3e4b51;
	line-height: 1.2em;
	font-size: 2.154em;
	font-weight: normal;
	font-family: 'Open Sans', sans-serif;
	font-weight: 700;
}

.count-result {
	padding-bottom: 20px;
	color: #afbbc1;
	font-size: 1.384615384615385em;
	line-height: 1.2em;
}

.fc-black {
	color: #3e4b51;
}

.fc-orange {
	color: #ea503d;
}
.img-inner:hover{
	cursor: pointer;
}
</style>

</head>
<body>
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
	<div style="width: 100%; margin-top: 100px">
		<div class="container">
			<h3 class="common-title" id="mber-pool-title">
				Category / <span class="fc-orange">ALL</span>
			</h3>
			<div class="count-result" id="mber-pool-result">
				<span class="fw-b fc-black">${list[0].TOTAL_COUNT}</span> People are
				registered.
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
		<nav
			class="w3-sidebar w3-bar-block w3-black w3-animate-right w3-top w3-text-light-grey w3-large"
			style="z-index: 3; width: 250px; font-weight: bold; display: none; right: 0;"
			id="mySidebar">
			<a href="../team/createTeam.do" onclick="w3_close()"
				class="w3-bar-item w3-button w3-center w3-padding-16">Make Team</a>
			<a href="../team/createProject.do" onclick="w3_close()"
				class="w3-bar-item w3-button w3-center w3-padding-16">Make
				Project</a> <a href="../team/myteam_list.do" onclick="w3_close()"
				class="w3-bar-item w3-button w3-center w3-padding-16">My Team</a> <a
				href="../team/myproject_list.do" onclick="w3_close()"
				class="w3-bar-item w3-button w3-center w3-padding-16">My Project</a>
			<a href="#" onclick="w3_close()"
				class="w3-bar-item w3-button w3-center w3-padding-16">LogOut</a>
		</nav>
		<div class="container">
			<div class="row">
				<!--   <h1><a href=<c:url value='/team/openTeamList.do'/> >[Team List]</a> &nbsp; &nbsp; &nbsp;<a href=<c:url value='/team/openProjectList.do'/> >[Project List]</a></h1> -->
				<br>
				<c:forEach items="${tlist}" var="dto">
					<div class="col-sm-4 w3-animate-zoom">
						<div class="panel panel-primary">
							<div class='tn'>
								<div class="panel-heading">
									<strong>${dto.TEAM_NAME }</strong>
								</div>
							</div>
							<div class="panel-body" style="text-align: center;">
								<img src=<c:url value='/common/getImage.do?IMG_NAME=${dto.TEAM_IMG }'/>
									class="img-inner" id="${dto.TEAM_ID}" alt="${dto.L_EMAIL }"
									onclick="godetail(this)">
							</div>
							<div class="panel-footer">
								<a class="directEmail" href='#'>팀장 <span class="toEmail">${dto.L_EMAIL }</span>
									<img src='../resources/images/mail.png' width='30' height='30'></a>
							</div>
							<div class="panel-footer">${dto.TEAM_EXP }</div>
						</div>
					</div>
				</c:forEach>

				<c:forEach items="${plist}" var="dtos">
					<div class="col-sm-4 w3-animate-zoom">
						<div class="panel panel-primary">
							<div class='pn'>
								<div class="panel-heading">
									<strong>${dtos.PNAME }</strong>
								</div>
							</div>
							<div class="panel-body">
								<img src="../resources/images/${dtos.PIMG }" class="img-inner"
									id="${dtos.PID}" alt="${dtos.EMAIL }" onclick="godetail2(this)">
							</div>
							<div class="panel-footer">
								<a class="directEmail" href='#'>리더 <span class="toEmail">${dtos.EMAIL }</span>
									<img src='../resources/images/mail.png' width='30' height='30'></a>
							</div>
							<div class="panel-footer">${dtos.PINFO }</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<form id='frm1' action='${pageContext.request.contextPath}/teamDetail/setTeamId.do' method="post"></form>
	<form id='frm2' action='${pageContext.request.contextPath}/teamDetail/setTeamId.do' method="post"></form>

	<script>
		function ajwidl() {
			document.getElementById("modal01").style.display = "none";
		}
	
		function ajwidl2() {
			document.getElementById("modal02").style.display = "none";
		}
	
		function godetail(obj) {
			var tet = obj.getAttribute("id");
			var logEmail = '${sessionScope.LOGEMAIL}';
			//console.log(tet);
			$('#frm1').append("<input type='hidden' name='IDX' id='IDX' value='" + tet + "'/>");
			$('#frm1').append("<input type='hidden' name='LOGEMAIL' id='LOGEMAIL' value='" + logEmail + "'/>");
			var forming = document.getElementById("frm1");
			forming.submit();
		}
	
		function godetail2(obj) {
			var tet = obj.getAttribute("id");
			//console.log(tet);
			var logi = obj.alt;
			$('#frm2').append("<input type='hidden' name='IDX2' id='IDX2' value='" + tet + "'/>");
			var forming = document.getElementById("frm2");
			forming.submit();
		}
	</script>
</body>
</html>
