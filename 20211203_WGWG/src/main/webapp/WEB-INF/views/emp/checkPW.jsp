<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>Insert title here</title>
<style type="text/css">
	#container{
		margin: auto;
		top: 160px;
		padding: 50px;
		margin-left: 420px;
		margin-top: 150px;
		margin-bottom: 150px;
	}
	.form-control{
		width: 350px;
	}
	#message{
		color:tomato;
	}
</style>
<script type="text/javascript">
	$("#check_btn").click(function(){
		//$("#content").load("./mypage.do");
	});
</script>
</head>
<body>
<div id="container">
		<form action="./chkPW.do" method="post">
			<div id="pw" class="form-group">
				<label for="pw">비밀번호</label>
				<input type="password" class="form-control" id="inputpw" name="inputpw" placeholder="현재 비밀번호를 입력해주세요">
				<div id="message">${message}</div>
			</div>
			<div id="btns">
				<input type="submit" id="check_btn" class="btn" value="확인">
			</div>
		</form>
	</div>
</body>
</html>