<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
	#container{
		border: 3px solid #073865;
		width: 400px;
		height: 450px;
		position: relative;
		margin: auto;
		top: 160px;
		padding: 50px;
	}
	
	#title{
		margin-top: 20px; 
		margin-bottom: 20px;
		text-align: center;
		font-size: 30px;
		font-weight: bold;
		color: #073865;
	}
	#btns{
		text-align: center;
		padding-top: 20px;
		justify-content: center;
	}
	
	#login_btn, #findpw_btn{
		background-color: #073865;
		color: #fff;
	}
	
	#emp_no_chk, #pw_chk,#message{
		color: tomato;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
    $(function(){
    	$("#login_btn").click(function(){
    		//아이디
    		var empno_value = $("input[name='emp_no']").val();
    		
    		if(!empno_value){
    			$("#emp_no_chk").html("사원번호를 입력해 주세요.");
    			$("input[name='emp_no']").focus();
    			return false;
    		}
    		
    		//비밀번호
    		var pw_value = $("input[name='pw']").val();
    		
    		if(!pw_value){
    			$("#pw_chk").html("비밀번호를 입력해 주세요.");
    			$("input[name='pw']").focus();
    			return false;
    		}
    	});
    	
    });
    
    function findPwForm(){
		var url = "./findPwForm.do";
		var title = "임시 비밀번호 전송";
		var attr = "width=400px, height=450px";
		window.open(url,title,attr);
	}
</script>
<title>로그인 화면</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div id="container">
		<div id="title">로그인</div>
		<form action="./login.do" method="post">
			<div id="emp_no" class="form-group">
				<label for="emp_no">사원번호</label>
				<input type="text" class="form-control" id="emp_no" name="emp_no" placeholder="사원번호를 입력해주세요">
				<div id="emp_no_chk"></div>
			</div>
			<div id="pw" class="form-group">
				<label for="pw">비밀번호</label>
				<input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호를 입력해주세요">
				<div id="pw_chk"></div>
			</div>
			<span id="message">${message}</span>
			<div id="btns">
				<input type="submit" id="login_btn" class="btn" value="로그인">
				<input type="button" id="findpw_btn" class="btn" value="비밀번호를 잊으셨나요?" onclick="findPwForm()">
			</div>
		</form>
	</div>
</body>
</html>