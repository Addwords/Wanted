<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- <% String WsUrl = getServletContext().getInitParameter("WsUrl"); %> --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name='viewport' content='minimum-scale=1.0, initial-scale=1.0,
	width=device-width, maximum-scale=1.0, user-scalable=no'/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>chatting</title>
<link rel="stylesheet" href="<c:url value='/resources/css/chat-window.css?ver=1.0'/>">
<script src="<c:url value='/resources/js/chatroom.js?ver=0.5'/>" charset="utf-8"></script>
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/fa-comment.png">

<script type="text/javascript">
var wsUri = 'ws://localhost:8090/first-hsh/chat';
var proxy = CreateProxy(wsUri);
var name = '${sessionScope.LOGNAME}';

document.addEventListener("DOMContentLoaded", function(event) {
	console.log(document.getElementById('loginPanel'));
	proxy.initiate({
		loginPanel: document.getElementById('loginPanel'),
		msgPanel: document.getElementById('msgPanel'),
		txtMsg: document.getElementById('txtMsg'),
		txtLogin: document.getElementById('txtLogin'),
		msgContainer: document.getElementById('msgContainer')
	});
	proxy.enterRoom(name);
});
<%session.setAttribute("LOGNAME", "바보얌"); %>
</script>
</head>
<body>
<nav class="navbar navbar-inverse" style="position: fixed; top: 0; width: 100%; z-index: 4;">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#this">
				<span style="color: #ff0000;">ONE</span>TED - TALK TALK
			</a>
		</div>
	</div>
</nav>

	<div id="container">
		<div id="loginPanel">
			<div id="infoLabel">접속중 입니다.</div>
			<div style="padding: 10px;">
				<button type="button" class="loginInput" onclick="proxy.enterRoom(name)">Enter</button>
			</div>
		</div>
		<div id="msgPanel" style="display: none; padding-top: 50px;">
			<div id="msgContainer" style="overflow: auto;"></div>
			<div id="msgController">
				<textarea id="txtMsg" 
					title="Enter to send message"
					onkeyup="proxy.sendMessage_keyup(event)"
					style="height: 40px; width: 100%"></textarea>
				<button style="height: 30px; width: 100px" type="button"
					onclick="proxy.logout()">Logout</button>
			</div>
		</div>
	</div>
	
<script type="text/javascript">
function displayMessage(msg) {
	if (elements.msgContainer.childNodes.length == 100) {
		elements.msgContainer.removeChild(elements.msgContainer.childNodes[0]);
	}
	
	var div = document.createElement('div');
	div.className = 'msgrow';
	var textnode = document.createTextNode(msg);
	
	console.log(textnode);
	
	div.appendChild(textnode); 
	elements.msgContainer.appendChild(div);
	
	elements.msgContainer.scrollTop = elements.msgContainer.scrollHeight;
};

</script>
</body>
</html>