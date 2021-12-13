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
<title>글수정</title>

<script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: '내용',
	        minHeight: 350,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	  $("#summernote").summernote('code',  '${vo.notice_content}');
});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/side2.jsp"></jsp:include>
<div style="margin-left: 230px; padding:50px; margin-top: 80px;">
<h2 style="text-align: center;">글수정</h2>

<div>
	<form action="./noticeupdate.do" method="post">
		<input type="hidden" name="notice_no" value="${vo.notice_no}">
		<input type="text" name="emp_no" style="width: 20%;" value="${vo.emp_no}" readonly/><br>
		<input type="text" name="notice_title" style="width: 40%;" value="${vo.notice_title}"/>
		<input type="text" name="notice_chk" style="width: 20%;" value="${vo.notice_chk}" readonly/>
		<br><br> 
		<textarea id="summernote" name="notice_content"></textarea>
		<td>
			<input id="subBtn" type="button" value="글 수정" style="float: right;" onclick="update(this.form)"/>		
			<input type="button" value="목록으로" style="float: right;" onclick="location.href='./noticeList.do';"/> 
		</td>
		
	</form>
</div>
</div>
</body>
<script>
function update(frm) {
	var notice_title = frm.notice_title.value;
	if (notice_title.trim() == ''){
		alert("제목을 입력해주세요");
		return false;
	}	
	frm.submit();
}
</script>
</html>