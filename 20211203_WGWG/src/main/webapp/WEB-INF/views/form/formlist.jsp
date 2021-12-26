<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function frmPaging(){
	document.getElementById('frmPaging').submit();
}

function listCnt(){
	document.getElementById('index').value=0;
	document.getElementById('pageStartNum').value=1;
	document.getElementById('listCnt').value = document.getElementById('listCount').value;
	
	frmPaging();
}

function pageFirst(){
	var index = document.getElementById('index');
	var pageStartNum = document.getElementById('pageStartNum');
	index.value = 0;
	pageStartNum.value = 1;
	frmPaging();
}

function pagePre(num, pageCnt){ //num: 출력할 페이지의 시작번호, pageCnt: 출력할 페이지 번호 갯수
	if(0 < num - pageCnt){
		num -= pageCnt;
		var index = document.getElementById('index');
		var pageStartNum = document.getElementById('pageStartNum');
		pageStartNum.value=num;
		index.value = num - 1;
	}
	frmPaging();
}

function pageIndex(idx){
	var index = document.getElementById('index');
	index.value=idx-1;
	frmPaging();
}

function pageNext(num, total, listNum, pageCnt){ //num: 출력할 페이지의 시작번호, total: 리스트의 총갯수, listNum:출력할 리스트의 갯수, pageCnt: 출력할 페이지번호 갯수
	var index = Math.ceil(total/listNum);
	var max = Math.ceil(index/pageCnt);
	
	if(max*pageCnt > num+pageCnt){
		num += pageCnt;
		var index = document.getElementById('index');
		var pageStartNum = document.getElementById('pageStartNum');
		
		pageStartNum.value=num;
		index.value = num-1;
	}
	frmPaging();
}

function pageLast(num, total, listNum, pageCnt){
	var index = Math.ceil(total/listNum);
	var max = Math.ceil(index/pageCnt);
	
	while(max*pageCnt > num+pageCnt){
		num += pageCnt;
	}
		var index = document.getElementById('index');
		var pageStartNum = document.getElementById('pageStartNum');
		
		pageStartNum.value=num;
		index.value = num-1;
	
	frmPaging();
	
}


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
		<form action="./formsearch.do" method="post">
			<input type="text" placeholder="제목으로 검색" name="formtitle" id="inputsearch">
			<input type="submit" value="검색" id="searchbtn">
		</form>
		<form action="./formlist.do" method="post" id="frmPaging">
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
		<input type="hidden" name="index" id="index" value="${paging.index}">
		<input type="hidden" name="pageStartNum" id="pageStartNum" value="${paging.pageStartNum}">
		<input type="hidden" name="listCnt" id="listCnt" value="${paging.listCnt}">
		
		<button type="button" id="insertbtn" onclick="location.href='./forminsert.do'">양식등록</button>
	<div class="center">
			<ul class="pagination">
				<li><a href="#" onclick="pageFirst()">&laquo;</a></li>
				<li><a href="#" onclick="pagePre(${paging.pageStartNum},${paging.pageCnt})">&lsaquo;</a></li>
				<!-- 페이지 번호 -->
				<c:forEach var="i" begin="${paging.pageStartNum}" end="${paging.pageLastNum}" step="1">
					<li><a onclick="pageIndex(${i})">${i}</a></li>
				</c:forEach>
				
				
				<li><a href="#" onclick="pageNext(${paging.pageStartNum},${paging.total},${paging.listCnt}, ${paging.pageCnt})">&rsaquo;</a></li>
				<li><a href="#" onclick="pageLast(${paging.pageStartNum},${paging.total},${paging.listCnt}, ${paging.pageCnt})">&raquo;</a></li>
			</ul>
		</div>
	</form>
	</div>	
</body>
</html>