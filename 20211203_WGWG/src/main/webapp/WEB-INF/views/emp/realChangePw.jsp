<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style type="text/css">
	#container{
		width: 350px;
		height: 330px;
		position: relative;
		margin: auto;
		top: 100px;
		padding: 50px;
	}
	#info{
		margin-top: 20px; 
		margin-bottom: 20px;
		text-align: center;
	}
	.btn{
		background-color: #073865;
		color: #fff;
		text-align: center;
	}
	.btn:hover{
		color: #fff;
	}
	#btns{
		text-align: center;
		justify-content: center;
	}
	#password_chk{
		color: tomato;
	}
</style>
<script type="text/javascript">

function setParentText(){
    var pwVal = $("#pw").val(); 
    var passwordVal = opener.$("#password").val();
    passwordVal = pwVal;
    console.log("변경된 pw : "+passwordVal);
    $(opener.document).find("#password").val(pwVal);
	window.close();

}
$(document).ready(function(){
	
$("#send").click(function(){
	
	var pw_value = $("#pw").val().replace(/\s/gi, "");
	console.log(pw_value);
	
	var pwChk_value = $("#pwChk").val().replace(/\s/gi, "");
	console.log(pwChk_value);
	
	//비밀번호 유효성 검사
	var regulPw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;
	var regResult = regulPw.test(pw_value);
	
	//일치여부
	if(pw_value != pwChk_value){
		$("#pwChkSpan").html("일치하지 않습니다.");
		$("#pwChkSpan").css({"color":"tomato"});
		$('#pw').val('');
		$('#pwChk').val('');
		setTimeout(function(){$("#pw").focus();}, 1);
		return false;
	}
	
	if(!regResult){
		alert("영어 대소문자,숫자,특수문자 포함해서 8자리에서 20자리 사이로 입력해주세요.");
		$("#pwChkSpan").html("다시 입력해주세요.");
		$("#pwChkSpan").css({"color":"tomato"});
		$("#pw").val('');
		$("#pwChk").val('');
		$("#pw").focus();
		return false;
	}
	
	if(!pw_value){
		alert("비밀번호를 입력해주세요.")
		$("#pwChkSpan").html("");
		return false;
	}
	
	if(!pwChk_value){
		alert("비밀번호 확인을 입력해주세요.")
		$("#pwChkSpan").html("");
		return false;
	}
	
	setParentText();
	
	
	});
});

</script>
</head>
<body>
	<div id="container">
			<div class="form-group">
			<div id="info">
				<p>새로운 비밀번호를 입력해주세요.</p><br>
			</div>
				<label for="pw">비밀번호</label>
				<input type="password" class="form-control" name="pw" id="pw" placeholder="새로운 비밀번호를 입력해주세요">
				<label for="pwChk">비밀번호 확인</label>
				<input type="password" class="form-control" name="pwChk" id="pwChk" placeholder="비밀번호를 한번 더 입력해주세요">
			</div>
			<span id="pwChkSpan"></span>
			<div id="btns">
				<input type="button" id="send" class="btn" value="변경하기">
				<input type="button" id="cancle" class="btn" onclick="window.close()" value="취소">
			</div>
	</div>
</body>
</html>