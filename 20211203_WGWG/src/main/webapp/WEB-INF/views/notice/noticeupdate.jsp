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
});
</script>
<style type="text/css">
	.content{
 		width: 1100px;
		padding: 100px 30px;
		
		margin: 0 auto;
 	}
 	.box{
 		border:none;
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
	<h2>글수정</h2>
	<form:form action="./noticeupdate.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="notice_no" value="${vo.notice_no}">
		작성자:<input type="text" class="box" name="emp_no" style="width: 20%;" value="${vo.emp_no}" readonly/><br>		
		부서:<input type="text" class="box" name="notice_chk" style="width: 20%;" value="${vo.notice_chk}" readonly/><br>
		제목:<input type="text" name="notice_title" style="width: 40%;" value="${vo.notice_title}"/><br>
		${vo.noticefile.notice_file_nm } <input type="file" name="file"><br><br>
		<textarea id="summernote" name="notice_content"></textarea>
		<td>
			<input id="subBtn" class="btn btn-primary" type="button" value="글 수정" style="float: right;" onclick="update(this.form);"/>		
			<input type="button" class="btn btn-primary" value="목록으로" style="float: right;" onclick="notlist();"/> 
		</td>		
	</form:form>
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

function notlist(){
	$('#content').load("./noticeList.do");
}
</script>
</html>