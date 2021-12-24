<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
	#container{
		border: 2px solid #ccc;
		width: 650px;
		height: 300px;
		position: relative;
		margin: auto;
		top: 160px;
		padding: 50px;
	}
	#text{
		text-align: center;
	}
	#btn{
		background-color: #073865;
		color: #fff;
		width: 80px;
		margin-left: 230px;
		margin-top: 20px;
	}
</style>
</head>
<body>
	<div id="container">
		<div id="text">
			<h3>${newEmp.dVo.dept_nm} ${newEmp.emp_nm} ${newEmp.pVo.position_nm}의 정보가 등록되었습니다.</h3>
			<p>사원번호 : ${newEmp_no}</p>
			<p>비밀번호 : ${newEmp.pw}</p>
		</div>
		<button id="btn" class="btn" onclick="location.href='./home.do'">메인으로</button>
	</div>
</body>
</html>