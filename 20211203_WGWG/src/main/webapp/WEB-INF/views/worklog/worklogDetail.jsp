<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업무일지 상세조회</title>
<style type="text/css">
.container {
	margin: 0;
	width: 1200px;
	padding: 10px;
}
#goback_btn {
		width: 100px;
		height: 30px;
		border: 1px solid #ddd;
		border-radius: 5px;
		font-size: 1rem;
		color: white;
		background-color: #073865;
		margin: 10px;
}
table{
	margin: 0;
	width: 90%;
	height: 500px;
}	
</style>
</head>
<body>
	<div class="container">
		<h1>업무일지 상세조회</h1>
		<button id="goback_btn" onclick="location.href='./worklogList.do'">목록 가기</button>
		<table>
			<tr>
				<th>문서번호</th>
				<td>?? ${selectWorklog.worklog_no}</td>
				
			</tr>
			<tr>
				<th>내용</th>
				<td>${selectWorklog.worklog_content}</td>
			</tr>
			<tr>
				<th></th>
				<td></td>
			</tr>
			<tr>
				<th></th>
				<td></td>
			</tr>
			<tr>
				<th></th>
				<td></td>
			</tr>
			<tr>
				<th></th>
				<td></td>
			</tr>
			<tr>
				<th></th>
				<td></td>
			</tr>

		</table>
	</div>



</body>
</html>