<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	$('#insertbtn').click(function(){
		$('#content').load('./forminsert.do');
	});
	$('.body').click(function(){
		var val = $(this).children().first().text();
		console.log(val);
		$('#content').load('./formdetail.do?form_no='+val);
	});
	$('#searchbtn').click(function(){
		var formtitle = document.getElementById('inputSearch').value;
		console.log(formtitle);
		$('#content').load('./formsearch.do', formtitle);
	})
})


</script>
<style>
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
</head>
<body>
	<div class="container">
		<h1 class="title">양식 목록</h1>
		<!-- <form action="./formsearch.do" method="post">
			<input type="text" placeholder="제목으로 검색" name="formtitle" id="inputsearch">
			<input type="submit" value="검색" id="searchbtn">
		</form> -->
		<form action="./formlist.do" method="post" id="frmPaging">
		<table class="formList">
			<tr class="head">
				<th>양식번호</th>
				<th>양식제목</th>
				<th>양식분류</th>
				<th>양식등록일</th>
			</tr>
			<c:forEach var="form" items="${formList}">
				<tr class="body">
					<td>${form.form_no}</td>
					<td>${form.form_nm}</td>
					<td>${form.fcdto.form_class_nm}</td>
					<td>${form.form_reg_dt}</td>
				</tr>
			</c:forEach>
		</table>
		<input type="hidden" name="index" id="index" value="${paging.index}">
		<input type="hidden" name="pageStartNum" id="pageStartNum" value="${paging.pageStartNum}">
		<input type="hidden" name="listCnt" id="listCnt" value="${paging.listCnt}">
		
		<button type="button" id="insertbtn">양식등록</button>
	</form>
	</div>	
</body>
</html>