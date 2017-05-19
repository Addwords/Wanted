<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>Oneted</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ taglib uri="tld/el-function.tld" prefix="moutil"%>
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
.pn{background-color:skyblue;}
.panel-body{width:100%;margin:auto; height:400px;}
/* .img-responsive{width:400px;height:310px;} */
.img-responsive:hover {opacity: 0.5;filter: alpha(opacity=50);}
</style>
<body class="w3-light-grey">
<%
		if (session.getAttribute("LOGEMAIL") == null) {System.out.println("attribute null");%>			 
			<%@include file="/WEB-INF/include/include-outnavbar.jspf" %><%
		}else{System.out.println("attribute exist");%>
			<%@include file="/WEB-INF/include/include-innavbar.jspf" %><%
		}
 	%> 
<!-- !PAGE CONTENT! -->
<div class="w3-main">

  <!-- Header -->
  <header id="portfolio" style='margin-top:50px;'>
    <div class="w3-container"> 
    <h1><b>Project</b></h1>
    <div class="w3-section w3-bottombar w3-padding-16">
      <span class="w3-margin-right">Filter:</span> 
      <button class="w3-button w3-black" onclick='list_all()'>ALL</button>
      <button class="w3-button w3-white" onclick='list_idea()'><i class="fa fa-lightbulb-o w3-margin-right"></i>기획/아이디어</button>
      <button class="w3-button w3-white" onclick='list_naming()'><i class="fa fa-flag-o w3-margin-right"></i>네이밍/슬로건</button>
      <button class="w3-button w3-white" onclick='list_design()'><i class="fa fa-eye w3-margin-right"></i>디자인</button>
      <button class="w3-button w3-white" onclick='list_marketing()'><i class="fa fa-gift w3-margin-right"></i>광고/마케팅</button>
      <button class="w3-button w3-white" onclick='list_video()'><i class="fa fa-camera-retro w3-margin-right"></i>영상/ucc</button>
      <button class="w3-button w3-white" onclick='list_sw()'><i class="fa fa-gamepad w3-margin-right"></i>게임/SW</button>
      <button class="w3-button w3-white" onclick='list_founded()'><i class="fa fa-group w3-margin-right"></i>창업</button>
    </div>
    </div>
  </header>
  
  <!-- First Photo Grid-->
  <div class="w3-row-padding">
  <c:forEach items="${plist}" var="dtos">
    <div class="col-sm-4 w3-animate-zoom" style='width:25%;'>
      <div class="panel panel-primary">
        <div class='pn'><div class="panel-heading fa fa-calendar-check-o"><strong>D-Day ${moutil:calculateDday(dtos.DDAY)}</strong></div></div>
        <div class="panel-body">
        <a href="#"><img src="${pageContext.request.contextPath}/resources/images/${dtos.PIMG }"
         class="img-responsive" style='width:100%;height:380px;'id="${dtos.PID}" onclick="godetail(this)"></a>
         </div>
        <div class="panel-footer" style='height:70px;'>[제목] ${dtos.PTITLE }</div>
        <div class="panel-footer">[분류] ${dtos.CATEGORY }</div>
      </div>
    </div>
     </c:forEach>
  </div>

<!-- End page content -->
</div>
      <form id='frm' action='${pageContext.request.contextPath}/project/openProjectDetail.do' method="post"></form>
<script>
function godetail(obj){
	var tet = obj.getAttribute("id");
	var logi = obj.alt;
	$('#frm').append("<input type='hidden' name='IDX' id='IDX' value='"+tet+"'/>");
	var forming = document.getElementById("frm");
	forming.submit();
}
function list_all(){
	location.href='${pageContext.request.contextPath}/project/openProjectList_all.do';
}
function list_idea(){
	location.href='${pageContext.request.contextPath}/project/openProjectList_idea.do';
}
function list_design(){
	location.href='${pageContext.request.contextPath}/project/openProjectList_design.do';
}
function list_video(){
	location.href='${pageContext.request.contextPath}/project/openProjectList_video.do';
}
function list_marketing(){
	location.href='${pageContext.request.contextPath}/project/openProjectList_marketing.do';
}
function list_naming(){
	location.href='${pageContext.request.contextPath}/project/openProjectList_naming.do';
}
function list_founded(){
	location.href='${pageContext.request.contextPath}/project/openProjectList_founded.do';
}
function list_sw(){
	location.href='${pageContext.request.contextPath}/project/openProjectList_sw.do';
}
</script>
</body>
</html>
