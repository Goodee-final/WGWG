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
<script type="text/javascript">
$("#toListbtn").click(function(){
	$("#content").load("./deptList.do");
});

$("#submit_btn").click(function(){
	var result = confirm("수정하시겠습니까?");
	if(!result){
		alert("취소되었습니다.");
	}else{
		alert("수정되었습니다.");
		$("#content").load("./deptList.do");
	}
});
</script>
</head>
<body>
<form:form action="./updateDept.do" method="post">
	<div id="maindiv" class="container">
		<label for="dept_no">부서번호:</label>
		<input type="text" name="dept_no" id="dept_no" class="form-control" value="${dept.dept_no}" readonly><br>
		<label for="dept_nm">부서명:</label>
		<input type="text" name="dept_nm" id="dept_nm" class="form-control" value="${dept.dept_nm}"><br>
		<input type="submit" value="수정하기" class="btn" id="submit_btn">
		<input type='button' value="목록으로" class ="btn" id="toListbtn">
	</div>
</form:form>
</body>
</html>