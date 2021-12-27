<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
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
</style>
<script type="text/javascript">

function changePW(){
	
	window.name = "myPage";
	
	var url = "./changePwForm.do";
	var title = "비밀번호 변경";
	var attr = "width=400px, height=450px";
	window.open(url,title,attr);
}
</script>
</head>
<body>
<form:form action="./updateMyPage.do" method="post" enctype="multipart/form-data" modelAttribute="uploadFile">
	<div id="maindiv" class="container">
	
	<div class="div_right">
		<div id="imgdiv">
			<img alt="이미지" src="./img/emp/${selectedEmp.photo}" id="thumbnail">
		</div>
		<input type="file" id="file" name='file'/>
		<label>사원번호:</label>
		<input type="text" name="empno" id="empno" class="form-control" value="${selectedEmp.emp_no}" readonly><br>
		<label>부서:</label>
		<input type="text" name="dept" id="dept" class="form-control" value="${selectedEmp.dVo.dept_nm}" readonly><br>
		<label for="name">이름:</label>
		<input type="text" name="name" id="name" class="form-control" value="${selectedEmp.emp_nm}" readonly><br>
	</div>
	<div class="div_left">
		<label for="birth">생년월일:</label>
		<fmt:parseDate value="${selectedEmp.birth}" var="dateFmt" pattern="yyyy-mm-dd"/>
		<fmt:formatDate value="${dateFmt}" var="birthdate" pattern="yyyy-mm-dd"/>
		<input type="text" value="${birthdate}" class="form-control" readonly><br>
		<label for="hiredate">입사년도:</label>
		<fmt:parseDate value="${selectedEmp.hiredate}" var="hiredateFmt" pattern="yyyy-mm-dd"/>
		<fmt:formatDate value="${hiredateFmt}" var="hire" pattern="yyyy-mm-dd"/>
		<input type="text" name="hiredate" id="hiredate" class="form-control" value="${hire}" readonly><br>
		<label>직급:</label>
		<input type="text" name="position" id="position" class="form-control" value="${selectedEmp.pVo.position_nm}" readonly><br>
		<label>비밀번호:</label>
		<input type="password" name="password" id="password" class="form-control" value="${selectedEmp.pw}" readonly>
		<input onclick="changePW()" class="btn btn-sm" id="change_btn" value="변경하기" type="button"><br>
		<label for="address">주소:</label>
		<input type="text" name="address" id="address" class="form-control"  value="${selectedEmp.address}"><br>
		<label for="tel">전화번호:</label>
		<input type="tel" id="tel" name="tel" class="form-control" value="${selectedEmp.tel}"><br>
		<label for="email">이메일:</label>
		<input type="email" id="email" name="email" class="form-control" value="${selectedEmp.email}"><br>
		<input type="submit" value="등록하기" class="btn" id="submit_btn">
	</div>
	</div>
	</form:form>
</body>
</html>