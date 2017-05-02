<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<style type="text/css">
		.modal-dialog{
			height: 83%;
			width: 60%;
			max-width: 800px;
		}
		.modal-content{
			height: 100%;
			width: 100%;
		}
		.modal-genie{
			justify-content: space-between;
			vertical-align:middle;
			display: inline-block;
			height: 300px;
		}
		.modal-bubble{
			background-image: url("${pageContext.request.contextPath}/resources/images/mber-tq/text.png");
			padding: 70px 30px 70px 30px;
			width: 330px;
	    	height: 250px;
	    	display: inline-block;
	    	vertical-align: top;
		}
		.modal-back{
			background-image: url("${pageContext.request.contextPath}/resources/images/mber-tq/bg-img.png");
			padding: 50px;
			width: 650px;
	    	height: 300px;		
			background-size: cover;
			display: inline-block;
		}
		.clear-container{
			content:""; 
			display:block; 
			clear:both;
		}
		.btn-default.option{
			margin: 0 auto;
			width: 450px;
			background-color: #ffe6b3;
			margin-bottom: 20px;
		}
	</style>
</head>
<body>
	<!-- modal content -->
	<div id="myModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	    <!-- Modal content-->
	    <div class="modal-content" >
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">Smart Search</h4>
	      </div>
	      <div class="modal-body" style="text-align: center;">
		      	<div class="modal-bubble">
		        	<p>Q1. 어떤기술을 가진 사람을 원하십니까?<p>
		        </div>
		        <div class="modal-genie">
		        	<img class="genie-img" src="${pageContext.request.contextPath}/resources/images/mber-tq/genie.png" height="100%">
		        </div>
		        <div class="modal-back">
		        	<button type="button" class="btn btn-default option">JAVA</button>
		        	<button type="button" class="btn btn-default option">디자인</button>
		        	<button type="button" class="btn btn-default option">C</button>
		        	<button type="button" class="btn btn-default option">C++</button>
		        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	
	  </div>
	</div>
</body>
</html>