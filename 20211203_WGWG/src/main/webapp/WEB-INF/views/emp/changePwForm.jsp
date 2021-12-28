<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
	#password_chk{
		color: tomato;
	}
	#password{
		width: 220px;
	}
</style>

</head>
<body>
<div id="container">
		<form action="./checkPrePW.do" method="GET">
			<div class="form-group">
			<div id="info">
				<p>현재 비밀번호를 입력해주세요.</p><br>
			</div>
				<label for="password">비밀번호</label>
				<input type="password" class="form-control" name="password" id="password" placeholder="현재 비밀번호를 입력해주세요">
				<div id="password_chk">${message}</div>
			</div>
			<div id="btns">
				<input type="submit" id="send" class="btn" value="확인">
			</div>
		</form>
	</div>
</body>
</html>