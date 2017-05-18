<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<style type="text/css">
		.modal-dialog{
			height: 90%;
			width: 60%;
			max-width: 800px;
		}
		.modal-backdrop
		{
		    opacity:1.0 !important;
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
			padding: 30px 30px 10px 30px;
			width: 95%;
	    	max-height: 300px;		
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
			width: 95%;
			color: black!important;
			background-color: #ffe6b3;
			margin-bottom: 20px;
			border: 0;
			outline: 0;
		}
	</style>
	
	<!-- modal content -->
	<div id="genieModal" class="modal fade" role="dialog" data-backdrop="static" data-keyboard="false">
	  <div class="modal-dialog">
	    <!-- Modal content-->
	    <div class="modal-content" >
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">Smart Search</h4>
	      </div>
	      <div class="modal-body" style="text-align: center;">
		      	<div class="modal-bubble" id="QUESTION">
		    		
		        </div>
		        <div class="modal-genie">
		        	<img class="genie-img" src="${pageContext.request.contextPath}/resources/images/mber-tq/genie.png" height="100%">
		        </div>
		        <div class="modal-back">
		        	<div>
		        		<button type="button" class="btn btn-default option" id="CHOICE_1" name="choice"></button>
		        		<input type="hidden" id="CHOICE_IDX" value="1"/>
		        	</div>
		        	<div>
		        		<button type="button" class="btn btn-default option" id="CHOICE_2" name="choice"></button>
		        		<input type="hidden" id="CHOICE_IDX" value="2"/>
		        	</div>
		        	<div>
		        		<button type="button" class="btn btn-default option" id="CHOICE_3" name="choice"></button>
		        		<input type="hidden" id="CHOICE_IDX" value="3"/>
		        	</div>		        			        	
		        	<div>
		        		<button type="button" class="btn btn-default option" id="CHOICE_4" name="choice"></button>
		        		<input type="hidden" id="CHOICE_IDX" value="4"/>
		        	</div>
		        </div>
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-default" name="start" id="GINIE_START">Start</button>
	        <button type="button" class="btn btn-default" name="end" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	
	  </div>
	</div>
<!-- 나중에 세션연결하면 지워줘야함 -->
<script type="text/javascript">
	var questionNum = 0;
	var loginEmail='${sessionScope.LOGEMAIL}';
	jQuery.noConflict();
	
	//모달 시작할때 콜백
	$('#genieModal').on('show.bs.modal', function (e) {
		$('#QUESTION').html('안녕하세요. 저는 당신의 지니입니다. 당신의 파트너를 찾고싶으면 START를 눌러주세요');
		$("button[name='choice']").hide();
		$("button[name='start']").attr("disabled",false);
		//.parent().parent().height(257);
	});
	
	//모달 사라질때 콜백
	$('#genieModal').on('hidden.bs.modal', function (e) {
		questionNum = 0;
	});
	
	//시작버튼 눌렀을시에 실행됨
	$('#GINIE_START').on("click", function(e){
		$("button[name='choice']").attr("disabled",false);
		$("button[name='start']").attr("disabled",true);
		for(var i=1; i <= 3; i++){
			$('#QUESTION').html('다음 질문에 솔직하게 답변해주세요.<br>----------------------<br> 데이터 베이스를 구성중입니다.<br> '+(3)+'초 후 실행됩니다 잠시만 기다리세요.');
			(function(index){
				setTimeout(
							function() 
							{
								$('#QUESTION').html('다음 질문에 솔직하게 답변해주세요.<br>----------------------<br> 데이터 베이스를 구성중입니다.<br> '+(3-index)+'초 후 실행됩니다 잠시만 기다리세요.');
								if(index == 3)
									fn_printQuestion();
							}, i * 1000);
			})(i);
		}
		fn_initGenie();
	});
	
	//선택지 선택했을시에 실행됨
	$("button[name='choice']").on("click", function(e){
		fn_insertAnswer($(this))
	});
	
	//DB에 자기가 선택한 답변들 넣어줌
	function fn_insertAnswer(obj){
		//이게 실행되는 시기가, 먼저 question을 뿌려준뒤라서 (+1된 상태) 0부터 시작해도 구지 +1 해줄 필요가없음
		var question = questionNum;
		var answer = obj.parent().find("#CHOICE_IDX").val();
		
		$.ajax({
		    type : "POST",
		    url : "<c:url value='/genie/insert.do'/>",
		    data : "EMAIL="+loginEmail+"&QUESTION="+question+"&ANSWER="+answer,
		    success : function(data, textStatus, xhr) {
				console.log(data);
		    },
		    error : function(request,status,error) {  
		       alert("code:"+request.status+"\n"+"error:"+error);
		    }
		 });
		
		//ajax 실행후
		if(questionNum>4)
			fn_getGenieResult();
		else
			fn_printQuestion(); 
	}
	
	//스마트 서치 결과 구할때(질문이 5개 이상 넘겼을때)
	function fn_getGenieResult(){
		var cnt = 0;
		$("button[name='choice']").attr("disabled",true);
		
		for(var i=1; i <= 3; i++){
			$('#QUESTION').html('답변을 기준으로 데이터베이스 구성중입니다. <br>----------------------<br>'+(3)+'초 후에 결과가 보여집니다 잠시만 기다리세요.');
			(function(index){
				setTimeout(
							function() 
							{
								$('#QUESTION').html('답변을 기준으로 데이터베이스 구성중입니다. <br>----------------------<br> '+(3-index)+'초 후에 결과가 보여집니다 잠시만 기다리세요.');
								if(index == 3)
 									$('#genieModal').modal('hide');
							}, i * 1000);
			})(i);
		}
		$('#row_area').empty();
		
		$.ajax({
		    type : "POST",
		    url : "<c:url value='/genie/getResult.do'/>",
		    data : "EMAIL="+loginEmail,
		    dataType: "json",
		    success : function(data, textStatus, xhr) {
		    	$.each(data, function(key, val){
		    		console.log(val['MBER_EMAIL']);
		    		
					var format = "<div class='col-sm-4' style='width: 25%'>" +
									"<div class='panel panel-primary'>" +
										"<div class='panel-heading' style='background-color: #333;'>" +
											"<a href='#this' class='dropdown-toggle' data-toggle='dropdown' name='mber_name' style='text-decoration:none'>"+val['MBER_NAME']+"</a>" +
										    	"<ul class='dropdown-menu'>"+
											      "<li><a id='drop-detail' href='#this'>상세정보</a></li>"+
											      "<li class='divider'></li>"+
											      "<li><a id='drop-message' href='#this'>쪽지보내기</a></li>"+
											    "</ul>"+
										"</div>" + 
										"<div class='panel-body' style='max-height: 229px; overflow:hidden;'>" +
											"<a href='#this' name='mber_img' style='text-decoration:none'>" +
												"<img src='/OneTed_INTEG/common/getImage.do?IMG_NAME="+val['MBER_IMG']+"' class='img-responsive' style='width:100%;height: 205px;' alt='Image'>" +
											"</a>" +
										"</div>" +
										"<input id='IDX' type='hidden' name='IDX' value='"+val['MBER_INFO_IDX']+"'>" +
										"<input id='EMAIL' type='hidden' name='EMAIL' value='"+val['MBER_EMAIL']+"'>" +
										"<div class='panel-footer' style='height: 44px'>"+val['MBER_SKILL']+"</div>" +
										"<div class='panel-footer' style='height: 88px'>"+val['MBER_INTRODUCE']+"</div>" +
									"</div>" +
								 "</div>";
								 
					$('#row_area').append(format);

					cnt++;
		    	});
		    	$('#mber-pool-title').html("Smart Search / <span class='fc-orange'>Result</span>");
		    	$('#mber-pool-result').html("<span class='fw-b fc-black'>"+cnt+"</span> people are searched.");
		    	$('#paging-bar').hide();
		    	$("#div-return").css('visibility', 'visible');;
		    },
		    error : function(request,status,error) {  
		       alert("code:"+request.status+"\n"+"error:"+error);
		    }
		 });
		
	}
	//스마트 서치 질문 출력하주는 구문
	function fn_printQuestion(){
		$("button[name='choice']").show();
		var question = [['당신은 지금 지하철 옆자리에 앉아있는 사람 때문에 짜증이 납니다.당신의 옆자리에는 어떤 사람이 앉아 있나요?','음악소리가 큰 대학생','술냄새가 진동하는 직장인','풀메이크업 한 직장인','큰소리로 떠드는 여고생'],
	        ['아침에 젊은청년이 친구와 길가에서서 무언가를 바라보고 있습니다. 무엇을 바라보고 있을까요?','연상녀','여고생','동성친구','자동차'],
	        ['직장에 다니는 당신. 술 한잔을 하려고 칵테일바에 들렀습니다.  제일 처음 주문한 술은 어떤 종류일까요?','맥주','와인','칵테일','위스키'],
	        ['당신은 어떤 선물을 친구에게 주겠습니까?','곰인형','꽃다발','액자','동전지갑'],
	        ['당신은 현재 좋아하는 사람이 있습니다. 그사람을 계절에 비유한다면 어떤 계절에 비유하시겠습니까?','봄','여름','가을','겨울']]
		
		$('#QUESTION').html('Q'+(questionNum+1)+' '+question[questionNum][0]);
		$('#CHOICE_1').html(question[questionNum][1]);
		$('#CHOICE_2').html(question[questionNum][2]);
		$('#CHOICE_3').html(question[questionNum][3]);
		$('#CHOICE_4').html(question[questionNum][4]);
		
		questionNum += 1;
	}
	
	//ajax들
	//1.Init Genie
	function fn_initGenie(){
		$.ajax({
		    type : "POST",
		    url : "<c:url value='/genie/init.do'/>",
		    data : "EMAIL="+loginEmail,
		    success : function(data, textStatus, xhr) {
				console.log(data);
		    },
		    error : function(request,status,error) {  
		       alert("code:"+request.status+"\n"+"error:"+error);
		    }
		 });
	}
</script>
