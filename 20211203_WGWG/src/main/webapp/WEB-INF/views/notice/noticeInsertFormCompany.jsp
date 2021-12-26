<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- include libraries(jQuery, bootstrap) -->

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
 
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>

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
 	}	
	h2{
		text-align: center;
	}
	.box{
 		border:none;
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
	<h2>회사 공지사항 작성</h2>
	<form:form action="./noticeInsert.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="check" value="company">
		<input type="text" class="box" name="emp_no" value="${emp.emp_no}"/><br><br>   <!--  여기에 세션으로 로그인한 사람의 EMP_NO가 들어가게 설정 /그리고 수정못하게 막기 -->
		<input type="text" name="notice_title"  placeholder="제목"/> <span id="title" style="color:red; font-weight: bold;"></span><br><br>
		<input type="text"  class="box" name="notice_chk" style="width: 20%;" value="회사" readonly/><br><br> <!-- 여기에 세션으로 로그인한 사람의 부서가 들어가게 설정 /그리고 수정못하게 막기-->
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
	$('#content').load(frm.submit());
}
function notlist(){
	$('#content').load("./noticeList.do");
}
</script>
</html>