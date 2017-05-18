<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String id = (String)session.getAttribute("LOGEMAIL"); %>
<!DOCTYPE html>
<html>
<title>MY TEAM</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<style>
body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
</style>
<body class="w3-light-grey">
<%
		if (session.getAttribute("LOGEMAIL") == null) {System.out.println("attribute null");%>			
			<%@include file="/WEB-INF/include/include-outnavbar.jspf" %><%
		}else{System.out.println("attribute exist");%>
			<%@include file="/WEB-INF/include/include-innavbar.jspf" %><%
		}
	%>
<!-- w3-content defines a container for fixed size centered content, 
and is wrapped around the whole page content, except for the footer in this example -->
<div class="w3-content" style="max-width:1400px">

<!-- Header -->
<header class="w3-container w3-center w3-padding-32" style="margin-top:50px;"> 
  <h1><b>MY TEAM</b></h1>
  <p>환영합니다! <span class="w3-tag"><%=id %></span></p>
</header>

<!-- Grid -->
<div class="w3-row">

<!-- Blog entries -->
<div class="w3-col l8 s12">
  <!-- Blog entry -->
  <h2>[속한 팀]</h2>
  <c:forEach items="${myteam}" var="mdto">
  <div class="w3-card-4 w3-margin w3-white">
    <a href="#"><img id="${mdto.TID} " src="<c:url value='/common/getImage.do?IMG_NAME=${mdto.TIMG }'/>" 
    alt="팀이미지" style="width:300px; height:200px;" onclick="godetail(this)"></a> 
    <div class="w3-container">
      <h3><b>${mdto.TNAME}</b></h3>
    </div>
  </div>
  </c:forEach>
  <h2>[만든 팀]</h2>
  <c:forEach items="${myteams}" var="mdtos">
  <div class="w3-card-4 w3-margin w3-white">
    <a href="#"><img id="${mdtos.TID} " src="<c:url value='/common/getImage.do?IMG_NAME=${mdtos.TIMG }'/>" 
    alt="팀이미지" style="width:300px; height:200px;" onclick="godetail(this)"></a> 
    <div class="w3-container">
      <h3><b>${mdtos.TNAME}</b></h3>
    </div>
  </div>
  </c:forEach>

</div>

</div><br>
      <form id='frm' action='../team/openTeamDetail.do' method="post"></form>
<!-- END w3-content -->
</div>
<script>
function godetail(obj){
	var idx = obj.getAttribute("id");
	$('#frm').append("<input type='hidden' name='IDX' value='"+idx+"'/>");
	var forming = document.getElementById("frm");
	forming.submit();
}
</script>
</body>
</html>
