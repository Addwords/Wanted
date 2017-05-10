<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>Oneted</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html, body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", sans-serif
}
</style>
</head>
<body class="w3-light-grey w3-content" style="max-width: 100%">
	<jsp:include page="/WEB-INF/include/navBar.jspf" />
	<!-- Project Section -->
	<div class="w3-container w3-padding-32" id="projects">
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">My Projects</h3>
	</div>

	<div class="w3-row-padding">
		<div class="w3-col l3 m6 w3-margin-bottom">
			<div class="w3-display-container">
				<div class="w3-display-topleft w3-black w3-padding">Summer
					House</div>
				<img src="/w3images/house5.jpg" alt="House" style="width: 100%">
			</div>
		</div>
		<div class="w3-col l3 m6 w3-margin-bottom">
			<div class="w3-display-container">
				<div class="w3-display-topleft w3-black w3-padding">Brick
					House</div>
				<img src="/w3images/house2.jpg" alt="House" style="width: 100%">
			</div>
		</div>
		<div class="w3-col l3 m6 w3-margin-bottom">
			<div class="w3-display-container">
				<div class="w3-display-topleft w3-black w3-padding">Renovated</div>
				<img src="/w3images/house3.jpg" alt="House" style="width: 100%">
			</div>
		</div>
		<div class="w3-col l3 m6 w3-margin-bottom">
			<div class="w3-display-container">
				<div class="w3-display-topleft w3-black w3-padding">Barn House</div>
				<img src="/w3images/house4.jpg" alt="House" style="width: 100%">
			</div>
		</div>
	</div>

	<div class="w3-row-padding">
		<div class="w3-col l3 m6 w3-margin-bottom">
			<div class="w3-display-container">
				<div class="w3-display-topleft w3-black w3-padding">Summer
					House</div>
				<img src="/w3images/house2.jpg" alt="House" style="width: 99%">
			</div>
		</div>
		<div class="w3-col l3 m6 w3-margin-bottom">
			<div class="w3-display-container">
				<div class="w3-display-topleft w3-black w3-padding">Brick
					House</div>
				<img src="/w3images/house5.jpg" alt="House" style="width: 99%">
			</div>
		</div>
		<div class="w3-col l3 m6 w3-margin-bottom">
			<div class="w3-display-container">
				<div class="w3-display-topleft w3-black w3-padding">Renovated</div>
				<img src="/w3images/house4.jpg" alt="House" style="width: 99%">
			</div>
		</div>
		<div class="w3-col l3 m6 w3-margin-bottom">
			<div class="w3-display-container">
				<div class="w3-display-topleft w3-black w3-padding">Barn House</div>
				<img src="/w3images/house3.jpg" alt="House" style="width: 99%">
			</div>
		</div>
	</div>

	<!-- About Section -->
	<div class="w3-container w3-padding-32" id="about">
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">My Teams</h3>
		<p>Lorem</p>
	</div>

	<div class="w3-row-padding w3-grayscale">
		<div class="w3-col l3 m6 w3-margin-bottom">
			<img src="/w3images/team1.jpg" alt="Team1" style="width: 100%">
			<h3>John Doe</h3>
			<p class="w3-opacity">CEO & Founder</p>
			<p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse
				sodales pellentesque elementum.</p>
			<p>
				<button class="w3-button w3-light-grey w3-block">Contact</button>
			</p>
		</div>
		<div class="w3-col l3 m6 w3-margin-bottom">
			<img src="/w3images/team2.jpg" alt="Team2" style="width: 100%">
			<h3>Jane Doe</h3>
			<p class="w3-opacity">Architect</p>
			<p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse
				sodales pellentesque elementum.</p>
			<p>
				<button class="w3-button w3-light-grey w3-block">Contact</button>
			</p>
		</div>
		<div class="w3-col l3 m6 w3-margin-bottom">
			<img src="/w3images/team3.jpg" alt="Team3" style="width: 100%">
			<h3>Mike Ross</h3>
			<p class="w3-opacity">Architect</p>
			<p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse
				sodales pellentesque elementum.</p>
			<p>
				<button class="w3-button w3-light-grey w3-block">Contact</button>
			</p>
		</div>
		<div class="w3-col l3 m6 w3-margin-bottom">
			<img src="/w3images/team4.jpg" alt="Team4" style="width: 100%">
			<h3>Dan Star</h3>
			<p class="w3-opacity">Architect</p>
			<p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse
				sodales pellentesque elementum.</p>
			<p>
				<button class="w3-button w3-light-grey w3-block">Contact</button>
			</p>
		</div>
	</div>
	<jsp:include page="/WEB-INF/include/footer.jspf" />
</body>
</html>