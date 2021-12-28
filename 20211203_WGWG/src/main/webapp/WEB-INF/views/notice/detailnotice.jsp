<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>글 상세보기</title>
</head>
<style>	
	#container{
		width: 1100px;
		padding: 100px 30px;	
		margin: 0 auto;
	}
 	.content{
 		width: 500px;
 		height: 300px;	
 	}	
 	
	h2{
		text-align: center;
	}
	
	.btn-primary{
		border-color:rgb(54, 69, 94);
		background-color: rgb(54, 69, 94);
		margin: 10px;
	}
	.btn-primary:hover{
		background-color: rgb(54, 69, 94);
	}
</style>

<body>
	<div id ="container" class="table-reponse">
		<h2>상세글 조회</h2><br>
		<table class="table">
			<tbody>
				<tr>
					<th>제목</th>
					<td>${vo.notice_title}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${vo.emp_nm}</td>
				</tr>
				<tr>
					<th>부서</th>
					<td>${vo.notice_chk}</td>
				</tr>
				<tr>
					<th>등록일</th>
					<td>${vo.notice_reg_dt}</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<c:if test="${empty vo.noticefile}">
							첨부파일 없음					
						</c:if>
					<c:if test="${!empty vo.noticefile}">
					
						<form action="./noticeFiledownload.do" method="post">
							${vo.noticefile.notice_file_nm }
							<input type="hidden" name="notice_file_nm" value="${vo.noticefile.notice_file_nm}">
							<input type="hidden" name="notice_file_save_nm" value="${vo.noticefile.notice_file_save_nm}">
							<input type="submit" class="btn btn-primary" style="float: right;" value="다운로드">
						</form>
					</c:if>
				
					</td>
				</tr>
				<tr>
					<th>내용</th>				
					<td>
						<div class="content">${vo.notice_content}</div>
					</td>
				</tr>				
			</tbody>
		</table>
		
	
	<div style="float: right;">
		<c:if test="${emp.dept_no == 10}"> <!-- 회사글 수정하기 -->
			<input type="button" class="btn btn-primary" value="회사글 수정" onclick="noticeupdateC(${vo.notice_no});">
			<input type="button" class="btn btn-primary" value="회사글 삭제" onclick="noticedelete(${vo.notice_no})">
		</c:if>
		
		<c:if test="${emp.emp_no == vo.emp_no }">  <!-- 나중에 수정 삭제는 로그인 한 사람이 작성했으면 버튼이 보이도록 -->	
			<input type="button" class="btn btn-primary" value="수정" onclick="noticeupdateP(${vo.notice_no});">
			<input type="button" class="btn btn-primary" value="삭제" onclick="noticedelete(${vo.notice_no})">	
		</c:if>
		<input type="button" class="btn btn-primary"  value="글 목록" onclick="notlist();">
	</div>	 
</div>
</body>
<script>
	function noticedelete(notice_no) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			$('#content').load("./noticedelete.do?notice_no="+notice_no);
		}
	}	
	function noticeupdateP(no){
		$('#content').load("./noticeupdate.do?notice_no="+no);
	}
	function noticeupdateC(no){
		$('#content').load("./noticeupdate.do?notice_no="+no);
	}
	function notlist(){
		$('#content').load("./noticeList.do");
	}
</script>
</html>