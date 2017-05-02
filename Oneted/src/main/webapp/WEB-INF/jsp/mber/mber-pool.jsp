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
	<div class="jumbotron">
		<div class="container text-center">
			<h1>
				<font>One ted</font>
			</h1>
			<p>TEAM PROJECT</p>
			<form class="form-inline">
				search: <input type="text" class="form-control" size="50"
					placeholder="search">
				<button type="button" class="btn btn-danger">Sign Up</button>
			</form>
		</div>
	</div>

	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>                        
			</button>
			<a class="navbar-brand" href="#">WebSiteName</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Home</a></li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Page 1-1</a></li>
						<li><a href="#">Page 1-2</a></li>
						<li><a href="#">Page 1-3</a></li>
					</ul>
				</li>
				<li><a href="#">Page 2</a></li>
				<li><a href="#">Page 3</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
				<li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
			</ul>
		</div>
	</div>
	</nav>

	<div class="container">
		<div style="width: 100%; margin-bottom: 100px;">
			<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" style="float: right;">Open Genie</button>
			<%@ include file="/WEB-INF/include/include-ssearch.jsp"%>
		</div>    
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
										<img src="<c:url value='/common/getImage.do?IMG_NAME=${mber.MBER_IMG}'/>" class="img-responsive" style="width:100%;height: 205px;" alt="Image">
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
//         var comSubmit = new ComSubmit();
//         comSubmit.setUrl("<c:url value='/project/detail.do'/>");
//         comSubmit.addParam("IDX", obj.parent().parent().find("#IDX").val());
//         comSubmit.addParam("CATEGORY", '${CATEGORY}');
//         comSubmit.submit();
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
