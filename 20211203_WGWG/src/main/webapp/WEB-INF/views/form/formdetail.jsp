<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
	   $('#backbtn').click(function(){
	      $('#content').load('./formlist.do');
	   });
	})

</script>
<style>
	.formDetail {
		margin: 0 auto;
		width: 1000px;
		margin-left: 70px;
		padding-left: 100px;
		border-collapse: collapse;
	}
	th, td {
	  padding: 8px;
	  text-align: left;
	  border-top: 1px solid #ddd;
	  border-bottom: 1px solid #ddd;
	}
	th {
		background-color: #eee;
		text-align: center !important;
	}
	#backbtn {
		width: 150px;
		height: 35px;
		border-radius: 5px;
		border: 1px solid #ddd;
		background-color: #073865;
		margin-top: 20px;
		color: white;
		margin-left: 920px;
	}
</style>
</head>
<body>
	<div class="container">
		<h1 class="title">양식 상세보기</h1>
		<table class="formDetail">
			<tr>
				<th>양&nbsp;&nbsp;식&nbsp;&nbsp;제&nbsp;&nbsp;목</th>
				<td>${selectForm.form_nm}</td>
			</tr>
			<tr>
				<th>양&nbsp;&nbsp;식&nbsp;&nbsp;분&nbsp;&nbsp;류</th>
				<td>${selectForm.fcdto.form_class_nm}</td>
			</tr>
			<tr>
				<th>양&nbsp;식&nbsp;등&nbsp;록&nbsp;일</th>
				<td>${selectForm.form_reg_dt}</td>
			</tr>
			<tr>
				<th id="template" colspan="2">양&nbsp;&nbsp;식&nbsp;&nbsp;내&nbsp;&nbsp;용</th>
			</tr>
			<tr>
				<td colspan="2">${selectForm.template}</td>
			</tr>
		</table>
		<button id="backbtn">목록으로 돌아가기</button>
	</div>
</body>
</html>