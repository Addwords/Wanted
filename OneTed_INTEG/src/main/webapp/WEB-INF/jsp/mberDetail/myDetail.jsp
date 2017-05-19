<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<!-- jQuery 스크립트 -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<!-- jquery UI -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
.resizable {
	max-width: 100%;
	height: 24px;
	text-align: center;
	helper:
}

.w3-text-teal {
	color: #004c45 !important;
}

.w3-teal {
	background-color: #004c45 !important;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	
</script>


</head>

<body class="w3-light-grey">
	<!-- nav 바 부분 -->
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
	<br>
	<br>
	<br>
	<!-- Page Container -->
	<div class="w3-content w3-margin-top" style="max-width: 1400px;">

		<!-- The Grid -->
		<div class="w3-row-padding">

			<!-- Left Column -->
			<div class="w3-third" style="width: 320px;">

				<div class="w3-white w3-text-grey w3-card-4">
					<c:choose>
						<c:when test="${map.IMG eq null }">
							<div class="w3-display-container w3-margin-bottom"
								style="width: 100%; height: 300px">

								<p
									style="width: 100%; height: 100%; border: medium; background-color: #dddddd; text-align: center; font-weight: bold;">
									<br> <br> <br> <br> <br> <br> 프로필
									사진이 없습니다
								</p>

							</div>
						</c:when>
						<c:otherwise>

							<div class="w3-display-container w3-margin-bottom"
								style="width: 100%; text-align: center; overflow: hidden;">
								<a href="#" class="face_preivew" id="face_preivew"> <img
									alt="face"
									src=<c:url value='/common/getImage.do?IMG_NAME=${map.IMG}' />
									height="300px"></a> <input type="file" name="FACEFILE_1"
									style="display: none;" accept="image/*">
							</div>
						</c:otherwise>
					</c:choose>

					<div class="w3-container">
						<input type="hidden" name="IDX" id="IDX" value="${map.IDX }">
						<p>
							<i
								class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-teal"></i>
							${map.EMAIL }
						</p>
						<p>
							<i
								class="fa fa-user-circle-o fa-fw w3-margin-right w3-large w3-text-teal"></i>
							${map.NAME }
						</p>
						<p>
							<i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-teal"></i>
							${map.LOCAL }
						</p>

						<p>
							<i
								class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i>
							${map.PHONE }
						</p>
						<hr>
						<!-- 스킬 표현부 -->
						<p class="w3-large">
							<b><i
								class="fa fa-asterisk fa-fw w3-margin-right w3-text-teal"></i>
								Skills</b>
						</p>
						<p style="margin-left: 40px">${map.SKILL }</p>

					</div>
				</div>
				<br>

				<!-- End Left Column -->
			</div>

			<!-- Right Column -->
			<div class="w3-twothird">
				<!-- 자기 소개 -->
				<div class="w3-container w3-card-2 w3-white w3-margin-bottom">
					<h2 class="w3-text-grey w3-padding-16">
						<i
							class="fa fa-user-o fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>
						Intro
					</h2>
					<div class="w3-container" style="height: 455px; overflow: scroll;">
						<h3 class="w3-opacity">${map.INTRODUCE }</h3>
					</div>
				</div>


				<!-- 팀 경력 -->
				<div class="w3-container w3-card-2 w3-white w3-margin-bottom">
					<h2 class="w3-text-grey w3-padding-16">
						<i
							class="fa fa-users fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>
						Team
					</h2>
					
							<c:choose>
								<c:when test="${fn:length(teamList) > 0}">
									<c:forEach items="${teamList}" var="teamList">
										<a href="#" class="goTeam">
											<div class="w3-panel w3-gray w3-card-4" style="text-align: center;">
												<h5 style="color: black;font-weight: bold">
													 <input type="hidden" id="tidx"
														value="${teamList.TEAM_ID }"> ${teamList.TEAM_NAME }
												</h5>
											</div>	
										</a>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<p>소속된 팀이 없습니다</p>
								</c:otherwise>
							</c:choose>
						</div>

				<!-- End Right Column -->
			</div>
			<a class="w3-button w3-red"
				href="<c:url value='/mberDetail/mberWrite.do' />">MODIFY</a>
			<!-- End Grid -->
	</div>
		<!-- End Page Container -->
	<br>
	<script>
		$(document).ready(function() {
			// 			fn_listMsg();

			$(".goTeam").on("click", function(e) { //상세 메시지 열기 버튼
				e.preventDefault();
				goDirectTeam($(this));
			});
		});

		function goDirectTeam(obj) {

			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/teamDetail/setTeamId.do' />");
			comSubmit.addParam("IDX", obj.find("#tidx").val());
			comSubmit.submit();

		}
	</script>
</body>
</html>
