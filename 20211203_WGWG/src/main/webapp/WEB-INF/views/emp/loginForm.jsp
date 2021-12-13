<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	}
	
	#login_btn, #findpw_btn{
		background-color: #073865;
		color: #fff;
	}
</style>

<title>로그인 화면</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div id="container">
		<div id="title">로그인</div>
		<form action="./login.do" method="post">
			<div id="emp_no" class="form-group">
				<label for="emp_no">사원번호</label>
				<input type="text" class="form-control" name="emp_no" placeholder="사원번호를 입력해주세요" required>
			</div>
			<div id="pw" class="form-group">
				<label for="pw">비밀번호</label>
				<input type="password" class="form-control" name="pw" placeholder="비밀번호를 입력해주세요" required>
			</div>
			<div id="btns">
				<input type="submit" id="login_btn" class="btn" value="로그인">
				<input type="button" id="findpw_btn" class="btn" value="비밀번호를 잊으셨나요?" onclick="location.href='./find_pw_form.do'">
			</div>
		</form>
	</div>
</body>
</html>