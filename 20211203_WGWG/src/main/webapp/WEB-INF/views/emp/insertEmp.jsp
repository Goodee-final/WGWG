<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	
$(document).ready(function(){
	$("input[name='uploadFile']").change(function(e){
		
		let regex = new RegExp("(.*?)\.(jpg|png)$");
		
		let formData = new FormData();
		let fileinput = $("input[name='uploadFile']");
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		
		formData.append("mfile",fileObj);
		
		$.ajax({
			url='emp/insertEmp',
			processData:false,
			contentType:false,
			data:formData,
			type:'POST',
			dataType:'json'
			
		});
		
		function fileCheck(fileName, fileSize){
			
			if(!regex.test(fileName)){
				alert("jpg 또는 png 파일만 업로드가 가능합니다.");
				return false;
			}
			return true;
		}
		alert("통과");
		
		
	});
	
});
	
</script>
<style type="text/css">
	#maindiv{
		display: flex;
		position: relative;
		top: 180px;
		align-items: center;
		justify-content: space-between;
		height: 100%;
	}
	
	.form-control{
		width: 300px;
	}
	
	.div_right{
		margin-top: 300px;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/side2.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<form action="./insert_emp.do" method="get" enctype="multipart/form-data">
	<div id="maindiv" class="container">
	<div class="div_right">
		<input type="file" id ="uploadFile" name='uploadFile'/>
	</div>
	<div class="div_left">
		이름:<input type="text" name="name" class="form-control"><br>
		부서:<select name="dept" class="form-control">
				<option value="10">사업지원팀</option>
				<option value="20">개발팀</option>
				<option value="30">인사팀</option>
				<option value="40">총무팀</option>
				<option value="50">영업1팀</option>
				<option value="60">영업2팀</option>
				<option value="70">마케팅팀</option>
				<option value="80">기획팀</option>
				<option value="90">보안팀</option>
			</select><br>
		입사년도:<input type="date" name="hiredate" class="form-control"><br>
		주소:<input type="text" name="address" class="form-control"><br>
		직급:<select name="position" class="form-control">
				<option value="1">사원</option>
				<option value="2">대리</option>
				<option value="3">과장</option>
				<option value="4">팀장</option>
				<option value="5">대표</option>
			</select><br>
		전화번호:<input type="tel" name="tel" class="form-control"><br>
		근무상태:<select name="work_st" class="form-control">
				<option value="재직">재직</option>
				<option value="휴직">휴직</option>
				<option value="퇴직">퇴직</option>
			</select><br>
		이메일:<input type="email" name="email" class="form-control"><br>
		<input type="submit" value="전송">
	</div>
	</div>
	</form>
</body>
</html>