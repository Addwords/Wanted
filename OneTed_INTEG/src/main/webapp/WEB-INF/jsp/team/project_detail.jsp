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
<nav class="w3-sidebar w3-bar-block w3-small w3-hide-small w3-center">
<!--   <img src="/w3images/avatar_smoke.jpg" style="width:100%"> -->
  <a href='../main.jsp' class="w3-bar-item w3-button w3-padding-large w3-black">
    <i class="fa fa-home w3-xxlarge"></i>
    <p>HOME</p>
  </a>
  <a href="#about" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
    <i class="fa fa-user w3-xxlarge"></i>
    <p>MEMBER</p>
  </a>
</nav>

<!-- Navbar on small screens (Hidden on medium and large screens) -->
<div class="w3-top w3-hide-large w3-hide-medium" id="myNavbar">
  <div class="w3-bar w3-black w3-opacity w3-hover-opacity-off w3-center w3-small">
<!--     <a href="#" class="w3-bar-item w3-button" style="width:25% !important">fe</a> -->
    <a href="#" class="w3-bar-item w3-button" style="width:25% !important">HOME</a>
    <a href="#about" class="w3-bar-item w3-button" style="width:25% !important">MEMBER</a>
  </div>
</div>

<!-- Page Content -->
<div class="w3-padding-large" id="main" style="margin-top:50px;margin-left:200px;">
  <!-- Header/Home -->
<!--   <header class="w3-container w3-padding-32 w3-center w3-black" id="home"> -->
  
  <c:forEach items="${projectone}" var="dto">
  <div id="tn">
    <h1>${dto.PNAME }</h1>
    <img src="../resources/images/${dto.PIMG }" alt="pic" id="mimg">
    <h2>팀장 : ${dto.EMAIL }</h2>
    </div>
 </c:forEach>
<!--   </header> -->

  <!-- About Section -->
  <div class="row" >
  <div class="w3-content w3-justify w3-padding-64" id="about">
    <h1>Member's</h1>
    
    <c:forEach items="${pmlist}" var="dtos">
    <div class="col-sm-4 w3-animate-zoom">
      <div class="panel panel-primary">
        <div class='pn'><div class="panel-heading"><strong>${dtos.EMAIL}</strong></div></div>
        <div class="panel-body">
        <img src="../resources/images/${dtos.MIMG }" class='img-responsive'>
         </div><div class="panel-footer">${dtos.PROLE}</div>
      </div>
    </div>
     </c:forEach>
     </div>
  </div>
  
<!--    Portfolio Section -->
<!--   <div class="w3-padding-64 w3-content w3-text-grey" id="photos"> -->
<!--     <h1>자료공유</h1> -->
    
<!--   </div> -->

<!--    Contact Section --> 
<!--   <div class="w3-padding-64 w3-content w3-text-grey" id="contact"> -->
<!--    <h1>뭔지 몰라</h1> -->
   
<!--    End Contact Section --> 
<!--   </div> -->
  
    <!-- Footer -->
  <footer class="w3-content w3-padding-64 w3-text-grey w3-xlarge">
    <a href="http://fb.com" target="b"><i class="fa fa-facebook-official w3-hover-opacity"></i></a>
    <a href="http://instagram.com" target="b"><i class="fa fa-instagram w3-hover-opacity"></i></a>
    <a href="http://snapchat.com" target="b"><i class="fa fa-snapchat w3-hover-opacity"></i></a>
    <a href="http://twitter.com" target="b"><i class="fa fa-twitter w3-hover-opacity"></i></a>
    <a href="http://linkedin.com" target="b"><i class="fa fa-linkedin w3-hover-opacity"></i></a>
    <p class="w3-medium">Powered by <a href="#" target="_blank" class="w3-hover-text-green">oneted.com</a></p>
  <!-- End footer -->
  </footer>

<!-- END PAGE CONTENT -->
</div>

</body>
</html>
