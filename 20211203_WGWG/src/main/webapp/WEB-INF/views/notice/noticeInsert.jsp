<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/side2.jsp"></jsp:include>
<div style="margin-left: 230px; padding:50px; margin-top: 80px;">
<h2 style="text-align: center;">글 작성</h2>

<div>
	<form action="./noticeInsert.do" method="post">
		<input type="text" name="emp_no" style="width: 20%;" placeholder="작성자"/><br>
		<input type="text" name="notice_title" style="width: 40%;" placeholder="제목"/>
		<input type="text" name="notice_chk" style="width: 20%;" placeholder="부서"/>
		<br><br> 
		<textarea id="summernote" name="notice_content"></textarea>
		<td>
			<input id="subBtn" type="button" value="글 작성" style="float: right;" onclick="goWrite(this.form)"/>		
			<input type="button" value="목록으로" style="float: right;" onclick="location.href='./noticeList.do';"/> 
		</td>
		
	</form>
</div>
</div>
</body>
<script>
function goWrite(frm) {
	var notice_title = frm.notice_title.value;	
	if (notice_title.trim() == ''){
		alert("제목을 입력해주세요");
		return false;
	}
	frm.submit();
}
</script>
</html>