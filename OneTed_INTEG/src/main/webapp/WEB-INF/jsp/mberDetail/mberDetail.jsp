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


	$(function() {

		$(".resizable").resizable({
			//aspectRatio: true 아직 어떤기능인지 확인 못함
			//ghost: true// 사이즈 감소는 안보임 사이즈 증가시 증가하는 부분이 흐리게 보임
			handles : "e" //구석 부분의 //이부분이 사라짐 사용이 필요할듯 동e서w 남s북n으로 늘어날수 있는 방향 설정

		});

	});
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
			<div class="w3-third" style="min-width: 320px;">

				<div class="w3-white w3-text-grey w3-card-4">
					<c:choose>
						<c:when test="${map.IDX eq null }">
							<div class="w3-display-container w3-margin-bottom"
								style="width: 100%; height: 300px">
								
								<p style="width: 100%; height: 100%; border: medium; background-color: #dddddd; text-align: center; font-weight: bold;">
								<br><br><br><br><br><br>
								프로필 사진이 없습니다
								</p>
								
							</div>
						</c:when>
						<c:otherwise>

							<div class="w3-display-container w3-margin-bottom" style="width: 100%;">
								<a href="#" class="face_preivew" id="face_preivew"> <img
									alt="face"
									src=<c:url value='/common/getImage.do?IMG_NAME=${map.IMG}' />
									width="100%" height="50%"></a> <input type="file"
									name="FACEFILE_1" style="display: none;" accept="image/*">
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
						<p style="margin-left: 40px"	>
						${map.SKILL }
						</p>

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
					<div class="w3-container" style="height: 455px; overflow: scroll;"	>
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
					<div class="w3-container">
						<h5 class="w3-opacity">
							<b>Front End Developer / w3schools.com</b>
						</h5>
						<h6 class="w3-text-teal">
							<i class="fa fa-calendar fa-fw w3-margin-right"></i>Jan 2015 - <span
								class="w3-tag w3-teal w3-round">Current</span>
						</h6>
						<p>Lorem ipsum dolor sit amet. Praesentium magnam consectetur
							vel in deserunt aspernatur est reprehenderit sunt hic. Nulla
							tempora soluta ea et odio, unde doloremque repellendus iure,
							iste.</p>

					</div>

				</div>
				

				<!-- End Right Column -->
			</div>
			
			<!-- End Grid -->
		</div>

		<!-- End Page Container -->

	</div>

	<br>
	<jsp:include page="/WEB-INF/include/footer.jspf" flush="false" />

</body>
</html>
