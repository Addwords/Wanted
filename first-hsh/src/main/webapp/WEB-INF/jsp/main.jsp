<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>ONETED</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">

<style>
	body,h1 {font-family: "Raleway", sans-serif}
	body, html {height: 100%}
	.bgimg {
	    background-image: url('${pageContext.request.contextPath}/resources/images/main.jpg');
	    min-height: 100%;
	    background-position: center;
	    background-size: cover;
	}
</style>
<body>
<%@ include file="/WEB-INF/include/navBar.jspf"%>
<div class="bgimg w3-display-container w3-animate-opacity w3-text-white">
  <div class="w3-display-topleft w3-padding-large w3-xlarge">
    Logo
  </div>
  <div class="w3-display-middle" style="text-align: center;">
    <h1 class="w3-jumbo w3-animate-top"><span style="color:  #ff0000;">ONE</span>TED</h1>
    <hr class="w3-border-gray" style="margin:auto;width:40%">
    <p class="w3-large w3-center"><span id="total" style="text-decoration:underline; font-size: 30px">20</span> PEOPLE are waiting.</p>
  </div>
  <div class="w3-display-bottomleft w3-padding-large">
    Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">CENTER_602</a>
  </div>
</div>


</body>
</html>