<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이징 처리</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- bootstrap -->
<link rel="stylesheet" href="./css/paging.css">
<!-- 사용자 Css -->
<script type="text/javascript" src="./js/paging.js"></script>
<!-- 사용자 js -->
<style type="text/css">

	.content{
 		width: 1100px;
		padding: 100px 30px;
		
		margin: 0 auto;
 	}
	.test{
		margin: 0 auto;
		width: 50%;
	}
	
	
</style>
</head>
<body>	
<div class="content">
	<div id="select">
			<span>
				<select class="btn btn-primary" id="listCount" name="listCount"	onchange="listCnt()">
					<option value="5"
						<c:if test="${paging.listCnt == 5}">selected</c:if>>5줄 보기</option>
					<option value="10"
						<c:if test="${paging.listCnt == 10}">selected</c:if>>10줄 보기</option>
					<option value="15"
						<c:if test="${paging.listCnt == 15}">selected</c:if>>15줄 보기</option>
				</select>
			</span>		
			<input type="button" class="btn btn-primary" value="글쓰기" style="float: right;" onclick="location.href='./noticeInsertForm.do'">
			
		</div>	
	<form action="./noticeList.do" method="post" id="frmPaging">
		<div class="test">
		<!-- paging 처리 관련 값 -->
			<input type="hidden" name="index" id="index" value="${paging.index}">
			<input type="hidden" name="pageStartNum" id="pageStartNum"	value="${paging.pageStartNum}"> 
			<input type="hidden" name="listCnt" id="listCnt" value="${paging.listCnt}">

			<div class="center">
				<ul class="pagination">

					<li><a href="#" onclick="pageFirst()">&laquo;</a></li>
					<li><a href="#" onclick="pagePre(${paging.pageStartNum},${paging.pageCnt})">&lsaquo;</a></li>

					<!-- 페이지 번호 -->
					<c:forEach var="i" begin="${paging.pageStartNum}" end="${paging.pageLastNum}" step="1">
						<li><a onclick="pageIndex(${i})">${i}</a></li>
					</c:forEach>

					<li><a href="#" onclick="pageNext(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt})">&rsaquo;</a></li>
					<li><a href="#" onclick="pageLast(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt})">&raquo;</a></li>

				</ul>
			</div>
		</div>
		<!-- 몇개씩 보여줄 것인지  -->
		
		
		
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>no.</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${lists}">
						<tr>
							<td>${list.notice_no }</td>
							<td><a href='./detailnotice.do?notice_no=${list.notice_no }'>${list.notice_title}</a></td>
							<td>${list.emp_no }</td>
							<td>${list.notice_reg_dt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			
		</form>
</div>
</body>
</html>