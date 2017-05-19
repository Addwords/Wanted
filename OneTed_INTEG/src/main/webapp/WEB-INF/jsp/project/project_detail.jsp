<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>Oneted</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ taglib uri="tld/el-function.tld" prefix="moutil"%>

<style>
#tn{float: left;}
#about{float: left;} 
#mimg{width: 400px;height: 300px;}
body, h1,h2,h3,h4,h5,h6 {font-family: "Montserrat", sans-serif}
 .w3-sidebar{width:100px;}
.w3-sidenav{width:100px;}
.w3-row-padding img {margin-bottom: 12px}
/* .w3-sidebar {width: 60px;background: #222;} */
#main {margin-left: 120px}
/* @media only screen and (max-width: 600px) {#main {margin-left: 0}} */
.col-sm-4{width: 30%; height: 70%;}
.tn{background-color:orange;}
.pn{background-color:skyblue;}
.panel-body{width: 100%;margin: auto;}
.img-responsive{width: 400px;height: 310px;}
.detimg{width: 400px;height:300px;}
.modal{z-index:3;display:none;padding-top:100px;position:fixed;
left:0; top:0;width:100%;height:100%;overflow:auto;
background-color: rgba( 255, 255, 255, 1);}
.navbar {margin-bottom: 50px;border-radius: 0;}
.jumbotron {margin-bottom: 0;}
/* footer{background-color: #f2f2f2;padding: 25px;} */
ft{margin-top: 5px;}
#open_search{display: none;}
</style> 
<body class="w3-white">
<%
		if (session.getAttribute("LOGEMAIL") == null) {System.out.println("attribute null");%>			 
			<%@include file="/WEB-INF/include/include-outnavbar.jspf" %><%
		}else{System.out.println("attribute exist");%>
			<%@include file="/WEB-INF/include/include-innavbar.jspf" %><%
		}
 	%> 
<!-- Icon Bar (Sidebar - hidden on small screens) -->


<!-- Page Content -->
<div class="w3-padding-large" id="main" style="margin-top:50px;">
  <!-- Header/Home -->
<!--   <header class="w3-container w3-padding-32 w3-center w3-black" id="home"> -->
  
 <div class="container">
	<div class="w3-container w3-padding-32" id="projects">
		<h2 class="w3-border-bottom w3-border-light-grey w3-padding-16">Project</h2>
	</div>
	<div class="w3-row-padding" style="width:100%;">
		<c:forEach items='${projectone}' var='pp'>
			<h2 style="display:inline;"><a href='../project/openProjectList_all.do'>[CATEGORY]</a> >${pp.CATEGORY} ></h2> <h3 style="display:inline;">${pp.PTITLE}</h3>
			<p>${moutil:calculateDday(pp.DDAY)} Days Left</p>
				<div class="w3-display-container">
				</div> 
				<img src="../resources/images/${pp.PIMG}" alt="그림" style="width:900px;height:1000px;">
				<h3>${pp.PTITLE}</h3>
				<p class="w3-opacity" style="word-wrap:break-word; -webkit-line-break: after-white-space;">${pp.CONTENTS}</p>
				
					<a class="w3-button w3-light-grey w3-block" href='${pp.SITELINK}' target='b'>사이트 링크</a>
			</c:forEach>
	</div>
	
	    <!-- Footer -->
	<footer class="w3-content w3-padding-64 w3-text-grey w3-xlarge w3-left">
	  <a href="http://fb.com" target="b"><i class="fa fa-facebook-official w3-hover-opacity"></i></a>
	  <a href="http://instagram.com" target="b"><i class="fa fa-instagram w3-hover-opacity"></i></a>
	  <a href="http://snapchat.com" target="b"><i class="fa fa-snapchat w3-hover-opacity"></i></a>
	  <a href="http://twitter.com" target="b"><i class="fa fa-twitter w3-hover-opacity"></i></a>
	  <a href="http://linkedin.com" target="b"><i class="fa fa-linkedin w3-hover-opacity"></i></a>
	  <p class="w3-medium">Powered by <a href="#" target="_blank" class="w3-hover-text-green">oneted.com</a></p>
	<!-- End footer -->
	</footer>
 </div>


<!-- END PAGE CONTENT -->
</div>

</body>
</html>
