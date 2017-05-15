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
		.fw-b {
		    font-family: 'Open Sans', sans-serif;
		    font-weight: 700;
		}
		.fc-orange{
		    color: #ea503d;
		}
		.dropdown-menu{
			top: inherit;
			left: inherit;
		}
	</style>
</head>

<body>
	<!-- NAV 자리 -->

	<!-- -------- -->
	
	<!-- 추가부분 -->
    <div class="container">
        <h3 class="common-title" id="mber-pool-title">Category / <span class="fc-orange">ALL</span></h3>
        <div class="count-result" id="mber-pool-result">
            <span class="fw-b fc-black">${list[0].TOTAL_COUNT}</span> People are registered.
        </div>
    </div>
	<!-- -------------- -->
	
	
	<div class="container">
		<div style="width: 100%; margin-bottom: 100px;">
			<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" style="float: right;">Open Genie</button>
			<%@ include file="/WEB-INF/include/include-ssearch.jsp"%>
		</div>    
		<div class="row" id="row_area">
			<c:choose>
			    <c:when test="${fn:length(list) > 0}">
			        <c:forEach items="${list}" var="mber">   	
						<div class="col-sm-4" style="width: 25%">
							<div class="panel panel-primary">
								<div class="panel-heading" style="background-color: #333;">
									<a href="#this" name="mber_name" class='dropdown-toggle' data-toggle='dropdown' style="text-decoration:none">${mber.MBER_NAME }</a>
							    	<ul class='dropdown-menu'>
								      <li><a id="drop-detail" href='#this'>상세정보</a></li>
								      <li class='divider'></li>
								      <li><a id="drop-message" href='#this'>쪽지보내기</a></li>
								    </ul>								
								</div>
								<div class="panel-body" style="max-height: 229px; overflow:hidden;">
									<a href="#this" name="mber_img" style="text-decoration:none">
										<img src="<c:url value='/common/getImage.do?IMG_NAME=${mber.MBER_IMG}'/>" class="img-responsive" style="width:100%;height: 205px;" alt="Image">
									</a>
								</div>
								<input id="IDX" type="hidden" name="IDX" value="${mber.MBER_INFO_IDX }">
								<input id="EMAIL" type="hidden" name="EMAIL" value="${mber.MBER_EMAIL }">
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
	<div id="paging-bar" style="text-align: center;">
		<c:if test="${not empty paginationInfo}">
			<ui:pagination paginationInfo="${paginationInfo}" type="text" jsFunction="fn_search" />
		</c:if>
		<input type="hidden" id="currentPageNo" name="currentPageNo" />
		<br><br>
	</div>

	<div class="container" id ="div-return" style="text-align: center; visibility: hidden; margin-top:50px; margin-bottom:50px;">
		<button type="button" class="btn btn-info btn-lg" id="btn-return">RETURN</button>
	</div>
	
	<form id="commonForm" name="commonForm"></form>
	
<script>
	//동적으로 생성될 수 있는 요소들
	$(document.body).on("click", "a[name='mber_img']", function(e){ //제목 이나 섬네일 클릭시
	    e.preventDefault();
	    fn_openMberDetail($(this));
	});	
	$(document.body).on("click", "a[id='drop-detail']", function(e){ //드롭다운메뉴 디테일메뉴 클릭시
	    e.preventDefault();
	    fn_openMberDetail($(this).parent().parent());
	});	
	
	$(document.body).on("click", "a[id='drop-message']", function(e){ //드롭 메세지보내기 클릭시
	    e.preventDefault();
	    fn_sendMessage($(this).parent().parent());
	});	
	//////////////////////////////////////////////////////////////////////////////////////////
	
	
	$("#btn-return").on("click", function(e){ //리턴버튼
	    var comSubmit = new ComSubmit();
	    comSubmit.setUrl("<c:url value='/mber/pool.do' />");
	    comSubmit.submit();
	});	
	
	function fn_openMberDetail(obj) {
		console.log(obj.parent().parent().find("#IDX").val());
//         var comSubmit = new ComSubmit();
//         comSubmit.setUrl("<c:url value='/project/detail.do'/>");
//         comSubmit.addParam("IDX", obj.parent().parent().find("#IDX").val());
//         comSubmit.addParam("CATEGORY", '${CATEGORY}');
//         comSubmit.submit();
	}
	function fn_sendMessage(obj) {
		console.log(obj.parent().parent().find("#EMAIL").val());
	}
	
	function fn_search(pageNo){
	    var comSubmit = new ComSubmit();
	    comSubmit.setUrl("<c:url value='/mber/pool.do' />");
	    comSubmit.addParam("currentPageNo", pageNo);
	    comSubmit.submit();
	}
</script>
</body>
</html>
