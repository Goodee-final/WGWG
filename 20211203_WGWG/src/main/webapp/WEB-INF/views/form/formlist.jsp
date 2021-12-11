<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
	.formList {
		margin: 0 auto;
		width: 1000px;
		margin-left: 70px;
		padding-left: 100px;
		border-collapse: collapse;
	}
	
	.head {
		background-color: #ddd;
	}
	
	th, td {
	  padding: 8px;
	  text-align: center;
	  border-bottom: 1px solid #ddd;
	}
	
	#inputsearch {
		width: 200px;
		height: 35px;
		border-radius: 5px;
		border: 1px solid #ddd;
		margin-bottom: 20px;
		margin-left: 795px;
	}
	
	#searchbtn {
		width: 70px;
		height: 35px;
		border-radius: 5px;
		border: 1px solid #ddd;
		background-color: #073865;
		color: white;
	}
	
	#insertbtn {
		width: 100px;
		height: 35px;
		border-radius: 5px;
		border: 1px solid #ddd;
		background-color: #073865;
		color: white;
		margin-top: 10px;
		margin-left: 970px;
	}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/common/side2.jsp"></jsp:include>
	<div class="container">
		<h1 class="title">양식 목록</h1>
		<input type="text" placeholder="제목으로 검색" name="formtitle" id="inputsearch">
		<button id="searchbtn" onclick="location.href='./formsearch.do?formtitle=${formtitle}'">검색</button>
		<table class="formList">
			<tr class="head">
				<th>양식번호</th>
				<th>양식제목</th>
				<th>양식분류</th>
				<th>양식등록일</th>
			</tr>
			<c:forEach var="form" items="${formList}">
				<tr>
					<td>${form.form_no}</td>
					<td><a href="./formdetail.do?form_no=${form.form_no}">${form.form_nm}</a></td>
					<td>${form.fcdto.form_class_nm}</td>
					<td>${form.form_reg_dt}</td>
				</tr>
			</c:forEach>
		</table>
		<button id="insertbtn" onclick="location.href='./forminsert.do'">양식등록</button>
	</div>
</body>
</html>