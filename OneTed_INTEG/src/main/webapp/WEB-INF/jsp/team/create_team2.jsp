<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">

<style>
body, h1, h2, h3, h4, h5 {
	font-family: "Raleway", sans-serif
}
.ta{
color: blue;
font-size: 20pt;
}
#holder{
width: 40%;
height: 40%;
}

</style>
<body class="w3-light-grey">

	<!-- w3-content defines a container for fixed size centered content, 
and is wrapped around the whole page content, except for the footer in this example -->
	<div class="w3-content" style="max-width: 1400px w3-center">

		<!-- Header -->
		<header class="w3-container w3-left w3-padding-32">
			<h1><b><%=id%></b>님의 팀 만들기</h1>
			
		</header>
	
		<form action="팀생성.do" method="post">
			<img id="holder" src="../resources/images/team1.jpg"><br><br>
			<label class="ta">팀 이름 : </label><input type="text" name='tname' id='tname'><br><br>
			<label class="ta">팀 설명 : </label><input type="text" name="tinfo" id='tinfo'>
		</form>
		<hr>
	</div>
		<!-- 미리보기 -->

		<div class=" w3-right w3-padding-32 w3-margin-top">
			<button class="w3-button w3-black w3-padding-large w3-margin-bottom">생성</button>
			<button class="w3-button w3-black w3-padding-large w3-margin-bottom">취소</button>

		</div>

</body>