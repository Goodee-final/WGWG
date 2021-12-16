<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업무일지 작성 화면</title>
<style type="text/css">
.smartEditor{
resize: none;
}
</style>
</head>
<body>
	<form action="./insertWL.do" method="post">
		<h1>업무일지 insert 화면</h1>
		<div id="worklog_content">
			<textarea class="smartEditor" name="smartEditor" rows="50" cols="100" required="required">양식이 들어가유~</textarea>
		</div>
	</form>
</body>
</html>