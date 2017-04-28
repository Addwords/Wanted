/**
 * 
 */

$(document).ready(function() {
	// fn_listMsg();

	$("#sendMsg").on("click", function(e) { // 글쓰기 버튼
		fn_sendMsg();
	});
});

function fn_sendMsg() {
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("/first1/message/sendMsg.do");
	comSubmit.addParam("RECIPIENT", $("#srecipient").val().toLowerCase());
	comSubmit.addParam("SUBJECT", $("#ssubject").val());
	comSubmit.addParam("CONTENTS", $("#scontents").html());
	comSubmit.submit();
}

function fn_newMsg() {
	$("#srecipient").val("");
	$("#ssubject").val("");
	$("#scontents").html("");
	$("#id01").css("display", "block");
}