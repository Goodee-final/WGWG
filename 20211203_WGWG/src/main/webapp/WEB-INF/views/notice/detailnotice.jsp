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
 	.content{
 		width: 500px;	
 	}	
 	#container{
		width: 1100px;
		padding: 100px 30px;
		height: 500px;
		margin: 20px auto;
	}
	h2{
		text-align: center;
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
					<td>${vo.emp_no}</td>
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
							<input type="submit" class="btn btn-primary" style="float: right" value="다운로드">
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
		<input type="button" class="btn btn-primary" value="수정" onclick="location.href='./noticeupdate.do?notice_no=${vo.notice_no}'">
		<input type="button" class="btn btn-primary" value="삭제" onclick="noticedelete(${vo.notice_no})">
		<input type="button" class="btn btn-primary"  value="글 목록" onclick="location.href='./noticeList.do';">
	</div>	 
</div>
</body>
<script>
	function noticedelete(notice_no) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href='./noticedelete.do?notice_no='+notice_no;
		}
	}	
</script>
</html>