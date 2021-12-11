<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.container{
		margin-top: 80px;
		margin-left: 230px;
		padding: 50px;
	}
	.title {
		margin-left: 70px;
	}
	.formDetail {
		margin: 0 auto;
		width: 1000px;
		margin-left: 70px;
		padding-left: 100px;
		border-collapse: collapse;
	}
	td {
	  padding: 8px;
	  text-align: left;
	  border-bottom: 1px solid #ddd;
	}
	#backbtn {
		width: 150px;
		height: 35px;
		border-radius: 5px;
		border: 1px solid #ddd;
		background-color: #073865;
		margin-top: 20px;
		color: white;
		margin-left: 920px;
	}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/common/side2.jsp"></jsp:include>
	<div class="container">
		<h1 class="title">양식 상세보기</h1>
		<table class="formDetail">
			<tr>
				<td colspan="2">양식제목: ${selectForm.form_nm}</td>
			</tr>
			<tr>
				<td>양식분류: ${selectForm.fcdto.form_class_nm}</td>
				<td>양식등록일: ${selectForm.form_reg_dt}</td>
			</tr>
			<tr>
				<td colspan="2">양식내용: ${selectForm.template}</td>
			</tr>
		</table>
		<button id="backbtn" onclick="location.href='./formlist.do'">목록으로 돌아가기</button>
	</div>
</body>
</html>