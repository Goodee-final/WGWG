<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
<div id="container">
		<form action="./chkPW.do" method="post">
			<div id="pw" class="form-group">
				<label for="pw">비밀번호</label>
				<input type="password" class="form-control" id="inputpw" name="inputpw" placeholder="비밀번호를 입력해주세요">
			</div>
			<div id="btns">
				<input type="submit" id="login_btn" class="btn" value="확인">
			</div>
		</form>
	</div>
</body>
</html>