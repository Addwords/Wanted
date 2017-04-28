<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common.js?ver=2"></script>
<head>
	<title>Oneted</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
	<!--   <link rel="stylesheet" href="./css/w3.css"> -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>	
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
		.img-responsive:hover {
			opacity: 0.5;
			filter: alpha(opacity=50); /* For IE8 and earlier */
		}
	</style>
</head>

<body>
	<%@ include file="/WEB-INF/include/navBar.jspf"%>
	<div class="container" style="margin-top: 100px;">    
		<div class="row">
			<c:choose>
			    <c:when test="${fn:length(list) > 0}">
			        <c:forEach items="${list}" var="mber">   	
						<div class="col-sm-4" style="width: 25%">
							<div class="panel panel-primary">
								<div class="panel-heading" style="background-color: #333;">
									<a href="#this" name="mber_name" style="text-decoration:none">${mber.MBER_NAME }</a>
								</div>
								<div class="panel-body" style="max-height: 229px; overflow:hidden;">
									<a href="#this" name="mber_img" style="text-decoration:none">
										<img src="<c:url value='/common/getImage.do?IMG_NAME=${mber.MBER_IMG}'/>" class="img-responsive" style="width:100%" alt="Image">
									</a>
								</div>
								<input id="IDX" type="hidden" name="IDX" value="${mber.MBER_INFO_IDX }">
								<div class="panel-footer" style="height: 44px">${mber.MBER_SKILL }</div>
								<div class="panel-footer" style="height: 88px">${mber.MBER_INTRODUCE }</div>
							</div>
						</div>
			        </c:forEach>
			    </c:when>
			    <c:otherwise>
			            조회된 결과가 없습니다.
			    </c:otherwise>
			</c:choose>       		
		</div>
	</div><br>
	<div style="text-align: center;">
		<c:if test="${not empty paginationInfo}">
			<ui:pagination paginationInfo="${paginationInfo}" type="text" jsFunction="fn_search" />
		</c:if>
		<input type="hidden" id="currentPageNo" name="currentPageNo" />
		<br><br>
	</div>
<form id="commonForm" name="commonForm"></form>
<script>
	$("a[name='mber_name'], a[name='mber_img']").on("click", function(e){ //제목 이나 섬네일 클릭시
	    e.preventDefault();
	    fn_openMberDetail($(this));
	});	
	
	function fn_openMberDetail(obj) {
		console.log(obj.parent().parent().find("#IDX").val());
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/mber/mberDetail.do'/>");
        comSubmit.addParam("IDX", obj.parent().parent().find("#IDX").val());
        comSubmit.addParam("CATEGORY", '${CATEGORY}');
        comSubmit.submit();
	}
	
	function fn_search(pageNo){
	    var comSubmit = new ComSubmit();
	    comSubmit.setUrl("<c:url value='/mber/pool.do' />");
	    comSubmit.addParam("currentPageNo", pageNo);
	    comSubmit.submit();
	}
</script>
<jsp:include page="/WEB-INF/include/footer.jspf"/>
</body>
</html>
