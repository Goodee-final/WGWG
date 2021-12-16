<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>Insert title here</title>
<style type="text/css">
	#container{
		width: 300px;
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
	#message{
		font-weight: bold;
	}
	#emp_no_chk, #email_chk{
		color: tomato;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(function(){
	$("#send").click(function(){
		//사원번호 빈칸체크
		var empno_value = $("input[name='emp_no']").val();
		
		if(!empno_value){
			alert("사원번호를 입력해 주세요.");
			$("input[name='emp_no']").focus();
			return false;
		}
		
		//사원번호 유효성검사
		var regulEmpno = /^[0-9]*$/;
		var regulEmpnoResult = regulEmpno.test(empno_value);
		
		if(!regulEmpnoResult){
			$("#emp_no_chk").html("사원번호는 숫자만 입력가능합니다.");
			$("input[name='emp_no']").focus();
			return false;
		}
		
		//이메일 빈칸체크
		var email_value = $("input[name='email']").val().replace(/\s/gi, "");
		
		if(!email_value){
			alert("이메일을 입력해주세요.");
			$("input[name='email']").focus();
			$("input[name='email']").val('');
			return false;
		}
		
		//이메일 유효성검사
		var regulEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]{2,3}/;
		var regEmailResult = regulEmail.test(email_value);
		
		if(!regEmailResult){
			$("#email_chk").html("이메일 형식이 올바르지 않습니다.");
			$("input[name='email']").focus();
			return false;
		}
	});
	
});

</script>
</head>
<body>
	<div id="container">
		<form action="./findPw.do" method="post">
			<div class="form-group">
			<div id="info">
				<p>임시 비밀번호를 전송합니다.</p><br>
			</div>
				<label for="emp_no">사원번호</label>
				<input type="text" class="form-control" name="emp_no" placeholder="사원번호를 입력해주세요">
				<div id="emp_no_chk"></div>
				<label for="email">이메일</label>
				<input type="email" class="form-control" name="email" placeholder="이메일을 입력해주세요">
				<div id="email_chk"></div>
			</div>
			<span id="message">${message}</span>
			<div id="btns">
				<input type="submit" id="send" class="btn" value="전송하기">
			</div>
		</form>
	</div>
</body>
</html>