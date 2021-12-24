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
<title>Insert title here</title>
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
	#submit_btn{
		background-color: #073865;
		color: #fff;
		width: 80px;
		margin-left: 135px;
	}
	.btn:hover{
		color: #fff;
	}
	#toListbtn {
		background-color: #ccc;
		color: black;
		width: 80px;
	}
	#imginfo{
		margin-top: 20px;
	}
	#imginfo p{
		font-size: 12px;
	}
</style>
<script type="text/javascript">
	$("#toListbtn").click(function(){
		//$("#content").load("./empList.do");
  	});
</script>
</head>
<body>
	상세조회페이지
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
		<input type="submit" value="수정하기" class="btn" id="submit_btn">
		<input type='button' value="목록으로" class ="btn" id='toListbtn' onclick="location.href='./home.do'">
	</div>
	</div>
	</form:form>
</body>
</html>