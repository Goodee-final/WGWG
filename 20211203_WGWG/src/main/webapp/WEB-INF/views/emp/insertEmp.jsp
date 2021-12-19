<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#file").change(function(e){
		
		let fileInput = $('#file');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		
		if(!fileCheck(fileObj.name, fileObj.size)){
			return false;
		}
		
		setImageFromFile(this, '#thumbnail');
	});
	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 10485760;

	function fileCheck(fileName, fileSize){
		
		if(fileSize >= maxSize){
			alert("파일 사이즈가 초과되었습니다.");
			$("#file").val("");
			return false;
		}
			  
		if(!regex.test(fileName)){
			alert("jpg,png확장자 파일만 업로드할 수 있습니다.");
			$("#file").val("");
			return false;
		}
		
		return true;
	}
	
	function setImageFromFile(input, expression) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	            $(expression).attr('src', e.target.result);
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}
});	


//유효성 검사
$("#submit_btn").click(function(){
	
	//이름
	var name_value = $("input[name='name']").val().replace(/\s/gi, "");
	
	if(!name_value){
		alert("이름을 입력해주세요.");
		$("input[name='name']").focus();
		$("input[name='name']").val('');
		return false;
	}
	
	var regulName = /^[a-zA-Z가-힣]{2,20}$/;
	var regNameResult = regulName.test(name_value);
	
	if(!regNameResult){
		alert("이름은 특수문자 제외 2자리 이상으로 입력해주세요.");
		$("input[name='name']").focus();
		return false;
	}
	
	//생년월일
	var birth_value = $("input[name='birth']").val();
	
	if(!birth_value){
		alert("생년월일을 입력해주세요.");
		return false;
	}
	
	//입사년도
	var hiredate_value = $("input[name='hiredate']").val();
	
	if(!hiredate_value){
		alert("입사년도를 입력해주세요.");
		return false;
	}
	
	//주소
	var address_value = $("input[name='address']").val();
	
	if(!address_value){
		alert("주소를 입력해주세요.");
		$("input[name='address']").focus();
		return false;
	}
	
	//전화번호
	var tel_value = $("input[name='tel']").val().replace(/\s/gi, "");
	
	if(!tel_value){
		alert("연락처를 입력해주세요(010-0000-0000).");
		$("input[name='tel']").focus();
		$("input[name='tel']").val('');
		return false;
	}
	
	var regulTel = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}/;
	var regTelResult = regulTel.test(tel_value);
	
	if(!regTelResult){
		alert("전화번호는 010-0000-0000 형식으로 입력해주세요.");
		$("input[name='tel']").focus();
		return false;
	}
	
	//이메일
	var email_value = $("input[name='email']").val().replace(/\s/gi, "");
	
	if(!email_value){
		alert("이메일을 입력해주세요.");
		$("input[name='email']").focus();
		$("input[name='email']").val('');
		return false;
	}
	
	var regulEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]{2,3}/;
	var regEmailResult = regulEmail.test(email_value);
	
	if(!regEmailResult){
		alert("이메일을 형식에 맞게 입력해주세요.");
		$("input[name='email']").focus();
		return false;
	}
	
	var result = confirm("등록하시겠습니까?")
	if(!result){
		alert("취소되었습니다.");
	}else{
		location.href="emp/insertResult"
	}
	
});


</script>
<style type="text/css">
	#maindiv{
		display: flex;
    	align-items: center;
    	margin-left: 270px;
    	margin-top: 10px;
	}
	
	.form-control{
		width: 300px;
	}
	
	.div_right{
		justify-content: center;
		margin-right: 200px;
	}
	#imgdiv{
		border: 1px solid #eee;
		height: 200px;
		width: 150px;
		margin-left: 20px;
    	margin-bottom: 30px;
	}
	#thumbnail{
		width: 150px;
	}
	.btn{
		background-color: #073865;
		color: #fff;
		width: 80px;
		margin-left: 220px;
	}
	.btn:hover{
		color: #fff;
	}
	#imginfo{
		margin-top: 20px;
	}
	#imginfo p{
		font-size: 12px;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	
	<form:form action="./insert_emp.do" method="post" enctype="multipart/form-data" modelAttribute="uploadFile">
	<div id="maindiv" class="container">
	
	<div class="div_right">
		<div id="imgdiv">
			<img alt="이미지" src="" id="thumbnail">
		</div>
		<input type="file" id="file" name='file'/>
		<div id="imginfo">
			<p>※사진 규격은 3cm x 4cm를 권장합니다.</p>
			<p>※png,jpg 확장자 파일만 업로드가 가능합니다.</p>
			<p>※10MB 이하의 파일만 업로드가 가능합니다.</p>
		</div>
		<label>부서:</label>
		<select name="dept" class="form-control">
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
		<label for="name">이름:</label>
		<input type="text" name="name" id="name" class="form-control"><br>
	</div>
	<div class="div_left">
		
		<label for="birth">생년월일:</label>
		<input type="date" name="birth" id="birth" class="form-control"><br>
		<label for="hiredate">입사년도:</label>
		<input type="date" name="hiredate" id="hiredate" class="form-control"><br>
		<label for="address">주소:</label>
		<input type="text" name="address" id="address" class="form-control"><br>
		<label>직급:</label>
		<select name="position" class="form-control">
				<option value="1">사원</option>
				<option value="2">대리</option>
				<option value="3">과장</option>
				<option value="4">팀장</option>
				<option value="5">대표</option>
			</select><br>
		<label for="tel">전화번호:</label>
		<input type="tel" id="tel" name="tel" class="form-control"><br>
		<label for="work_st">근무상태:</label>
		<select name="work_st" id="work_st" class="form-control">
				<option value="재직">재직</option>
				<option value="휴직">휴직</option>
				<option value="퇴직">퇴직</option>
			</select><br>
		<label for="email">이메일:</label>
		<input type="email" id="email" name="email" class="form-control"><br>
		<input type="submit" value="등록하기" class="btn" id="submit_btn">
	</div>
	</div>
	</form:form>
</body>
</html>