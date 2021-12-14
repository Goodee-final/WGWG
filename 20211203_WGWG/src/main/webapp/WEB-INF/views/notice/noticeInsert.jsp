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
<title>글쓰기</title>

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
	button{
		float: rigth;
	}
</style>

</head>
<body>
<h2 style="text-align: center;">글 작성</h2>

<div>
	<form:form action="./noticeInsert.do" method="post" enctype="multipart/form-data">
		<input type="text" name="emp_no" placeholder="작성자"/><br><br>
		<input type="text" name="notice_title"  placeholder="제목"/> <span id="title" style="color:red; font-weight: bold;"></span><br><br>
		<input type="text" name="notice_chk" placeholder="부서"/><br><br>
		<input type="file" name="file"><form:errors path="file"/><br><br>
		<textarea id="summernote" name="notice_content"></textarea>
		<td>
			<input type="button" class="btn btn-primary" value="글작성"  onclick="goWrite(this.form)"/>		
			<input type="button" class="btn btn-primary" value="목록으로" onclick="location.href='./noticeList.do';"/> 
		</td>
		
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
</script>
</html>