<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<!-- include summernote-ko-KR -->
<script src="./js/summernote-ko-KR.js"></script>
<title>공지사항작성</title>

<script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: '내용',
	        minHeight: 350,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
});
</script>
<style type="text/css">
	.content{
 		width: 1100px;
		padding: 100px 30px;		
		margin: 0 auto;
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
</head>
<body>


<div class="content">
	<h2>공지사항 작성</h2>
	<form:form action="./noticeInsert.do" method="post" enctype="multipart/form-data">
		<input type="text" name="emp_no" value="${emp.emp_no}" readonly/><br><br>   <!--  여기에 세션으로 로그인한 사람의 EMP_NO가 들어가게 설정 그리고 수정못하게 막기 -->
		<input type="text" name="notice_title"  placeholder="제목"/> <span id="title" style="color:red; font-weight: bold;"></span><br><br>
		<input type="text" name="notice_chk" value="${emp.dept_no}" readonly/><br><br> <!-- 여기에 세션으로 로그인한 사람의 부서가 들어가게 설정 그리고 수정못하게 막기-->
		<input type="file" name="file"><br><br>
		<textarea id="summernote" name="notice_content"></textarea>
		<div class="right">
			<input type="button" class="btn btn-primary" value="글작성" style="float: right" onclick="goWrite(this.form)"/>		
			<input type="button" class="btn btn-primary" value="목록으로" style="float: right" onclick="notlist();"/> 
		</div>		
	</form:form>
</div>
</body>
<script>
function goWrite(frm) {
	var notice_title = frm.notice_title.value;	
	if (notice_title.trim() == ''){
		$("#title").text("제목을 입력해주세요"); 
		return false;
	}
	frm.submit();
}
function notlist(){
	$('#content').load("./noticeList.do");
}
</script>
</html>