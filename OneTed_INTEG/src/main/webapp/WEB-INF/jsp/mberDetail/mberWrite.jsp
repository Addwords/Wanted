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
					<div class="w3-display-container w3-margin-bottom"
						style="overflow: hidden; text-align: center;">
						<a href="#" class="face_preivew" id="face_preivew"> <c:choose>
								<c:when test="${map.IMG eq null }">
									<div class="w3-display-container w3-margin-bottom"
										style="width: 100%; height: 300px; overflow: hidden; text-align: center;">

										<p
											style="width: 100%; height: 100%; border: medium; background-color: #dddddd; text-align: center; font-weight: bold;">
											<br> <br> <br> <br> <br> <br>
											프로필 사진이 없습니다
										</p>

									</div>
								</c:when>
								<c:otherwise>

									<div class="w3-display-container w3-margin-bottom"
										style="width: 100%; text-align: center;">
										<img id="face"
											src=<c:url value='/common/getImage.do?IMG_NAME=${map.IMG}' />
											height="300px">
									</div>
								</c:otherwise>
							</c:choose>
						</a>
						<form id="frm" name="frm" enctype="multipart/form-data">
							<input type="file" name="FACEFILE_1" id="FACEFILE_1"
								style="display: none;" accept="image/*">
						</form>
					</div>

					<div class="w3-container">
						<input type="hidden" name="IDX" id="IDX" value="${map.IDX }">
						<p>
							<i
								class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-teal"></i>
							<span id="EMAIL">${map.EMAIL }</span>
						</p>
						<p>
							<i
								class="fa fa-user-circle-o fa-fw w3-margin-right w3-large w3-text-teal"></i>
							<span id="NAME">${map.NAME }</span>
						</p>
						<p>
							<i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-teal"></i>
							<input type="text" id="LOCAL" name="LOCAL" value="${map.LOCAL }">
						</p>

						<p>
							<i
								class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i>
							<input type="text" id="PHONE" name="PHONE" value="${map.PHONE }">
						</p>
						<hr>
						<!-- 스킬 표현부 -->
						<p class="w3-large">
							<b><i
								class="fa fa-asterisk fa-fw w3-margin-right w3-text-teal"></i>
								Skills</b>
						</p>

						<p>
							<input type="text" id="SKILL" name="SKILL"
								style="margin-left: 40px" value="${map.SKILL }">
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
						Introduction
					</h2>
					<div class="w3-container">
						<div id="INTRODUCE" class="w3-input w3-border w3-margin-bottom"
							style="height: 455px; overflow: scroll; -webkit-user-modify: read-write; word-wrap: break-word; -webkit-line-break: after-white-space;">
							${map.INTRODUCE }</div>
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
									<div class="w3-panel w3-gray w3-card-4"
										style="text-align: center;">
										<h5 style="color: black; font-weight: bold">
											<input type="hidden" id="tidx" value="${teamList.TEAM_ID }">
											${teamList.TEAM_NAME }
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
			<a class="w3-button w3-red" id="btnUpdate"
				href="javascript:fn_insertInfo()">DONE</a>
			<!-- End Grid -->
		</div>

		<!-- End Page Container -->

	</div>
	<br>
	<jsp:include page="/WEB-INF/include/footer.jspf" flush="false" />
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		function goDirectTeam(obj) {

			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/teamDetail/setTeamId.do' />");
			comSubmit.addParam("IDX", obj.find("#tidx").val());
			comSubmit.submit();

		}
		function fn_insertInfo() {
			var comSubmit = new ComSubmit('frm');
			comSubmit.setUrl("<c:url value='/mberDetail/insertInfo.do' />");
			comSubmit.addParam("LOCAL", $("#LOCAL").val());
			comSubmit.addParam("PHONE", $("#PHONE").val());
			comSubmit.addParam("SKILL", $("#SKILL").val());
			comSubmit.addParam("INTRODUCE", $("#INTRODUCE").html());
			comSubmit.submit();
		}

		$(document).ready(function() {
			$("#input").click(function() {
				$("view").toggleClass("input");

			});
			$(".goTeam").on("click", function(e) { //상세 메시지 열기 버튼
				e.preventDefault();
				goDirectTeam($(this));
			});
		});
		//이미지 첨부 펑션
		$(function() {
			$('#face_preivew').click(function() {
				$("input[name='FACEFILE_1']").click();
			});
			$("input[name='FACEFILE_1']").change(function(e) {
				var file = this.files[0];
				if (!file)
					return;
				/** 파일 확장자 체크부분 **/
				var filename = file['name'];
				var extension = filename.replace(/^.*\./, '');
				if (extension == filename) {
					extension = '';
				} else {
					extension = extension.toLowerCase();
				}
				switch (extension) {
				case 'jpg':
				case 'jpeg':
				case 'png':
				case 'gif':
					break;
				default:
					alert("이미지 [jpg,jpeg,png,gif] 파일만 가능합니다.");
					return;
				}
				/*****************************/
				reader = new FileReader();
				reader.onload = function(event) {
					var img = new Image();
					img.src = event.target.result;
					img.height = 300;
					$('#face_preivew').empty();
					$('#face_preivew').append(img);
				};
				reader.readAsDataURL(file);
				return false;
			});
		});
		var per = Math.round(($('.resizable').width() * 1)
				/ ($('.resizable').parent("div").width() * 1) * 100);
	</script>


</body>
</html>
