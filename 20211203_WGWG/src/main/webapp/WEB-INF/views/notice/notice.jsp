<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
	h2 {
		text-align: center;
	}
	table {
		width: 100%;
	}
	#outter {
		display: block;
		width: 60%;
		margin: auto;
	}
	a {
		text-decoration: none;
	}
</style>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		var notice_chk = document.getElementById('notice_chk').value;
		location.href="noticeList.do?nowPage=${paging.nowPage}&cntPerPage="+sel+"&notice_chk="+notice_chk;
	}
</script>
</head>

<body>

<div id="outter">	
	
	<div style="float: right;">
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select>
	</div>
	<div style="float: right;">
		<select id="notice_chk" name="sel" onchange="selChange()">
			<option value="모두보기"
				<c:if test="${paging.notice_chk eq '모두보기'}">selected</c:if>>모두보기</option>
			<option value="사업지원팀"
				<c:if test="${paging.notice_chk eq '사업지원팀'}">selected</c:if>>사업지원팀</option>
			<option value="영업1팀"
				<c:if test="${paging.notice_chk eq '영업1팀'}">selected</c:if>>영업1팀</option>			
		</select>
	</div> 
	 
	<table border="1">
		<tr>
			<td>No.</td>
			<td width="50%">제목</td>
			<td>작성자</td>
			<td>등록일</td>		
		</tr>
		
		<c:forEach var="list" items="${viewAll }">
			<tr>
				<td>${list.notice_no }</td>
				<td><a href='./detailnotice.do?notice_no=${list.notice_no }'>${list.notice_title}</a></td>
				<td>${list.emp_no }</td>
				<td>${list.notice_reg_dt}</td>
			</tr>
		</c:forEach>
	</table>
	<input type="button" value="글쓰기" style="float: right;" onclick="location.href='./noticeInsertForm.do'"><br>
	
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="./noticeList.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&notice_chk=${paging.notice_chk}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="./noticeList.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}&notice_chk=${paging.notice_chk}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="./noticeList.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&notice_chk=${paging.notice_chk}">&gt;</a>
								
		</c:if>
	</div>
</div>

</body>
</html>