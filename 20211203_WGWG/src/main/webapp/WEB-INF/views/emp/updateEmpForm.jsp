<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
</style>
<script type="text/javascript">
$(document).ready(function(){

	  $("#selectDept option").each(function(){
	   if($(this).val()=="${selectedEmp.dept_no}"){
	     $(this).attr("selected","selected");
	   }
	});
	  
	$("#selectPosition option").each(function(){
		 if($(this).val()=="${selectedEmp.position_no}"){
		   $(this).attr("selected","selected");
		 }
	});
	  
	$("#selectWork_st option").each(function(){
		 if($(this).val()=="${selectedEmp.work_st}"){
		   $(this).attr("selected","selected");
		 }
	});

});
	$("#toListbtn").click(function(){
		$("#content").load("./empList.do");
  	});
	
	$("#submit_btn").click(function(){
		
		if($("#selectWork_st").val()=="퇴직"){
			var answer = confirm("근무상태가 퇴직으로 선택되었습니다.\n 수정 후 되돌릴 수 없습니다.\n 이어서 진행하시겠습니까?");
			if(!answer){
				alert("취소되었습니다.");
				return false;
			}else{
				var result = confirm("수정하시겠습니까?");
				if(!result){
					alert("취소되었습니다.");
				}else{
					alert("수정되었습니다.");
					$("#content").load("./empList.do");
				}
				return true;
			}
			
		}
		
		var result = confirm("수정하시겠습니까?");
		if(!result){
			alert("취소되었습니다.");
		}else{
			alert("수정되었습니다.");
			$("#content").load("./empList.do");
		}
		
		
		
	});
</script>
</head>
<body>
	<form:form action="./updateEmp.do" method="post">
	<div id="maindiv" class="container">
	
	<div class="div_right">
		<div id="imgdiv">
			<img alt="이미지" src="./img/emp/${selectedEmp.photo}" id="thumbnail">
		</div>
		<label for="emp_no">사원번호:</label>
		<input type="text" name="emp_no" id="emp_no" class="form-control" value="${selectedEmp.emp_no}" readonly><br>
		<label>부서:</label>
		<select name="dept_no" id="selectDept" class="form-control">
			<c:forEach var="deptList" items="${deptList}">
				<option value="${deptList.dept_no}">${deptList.dept_nm}</option>
			</c:forEach>
		</select><br>
		<label for="emp_nm">이름:</label>
		<input type="text" name="emp_nm" id="emp_nm" class="form-control" value="${selectedEmp.emp_nm}"><br>
	</div>
	<div class="div_left">
		
		<label for="birth" >생년월일:</label>
		<fmt:parseDate value="${selectedEmp.birth}" var="dateFmt" pattern="yyyy-mm-dd"/>
		<fmt:formatDate value="${dateFmt}" var="birthdate" pattern="yyyy-mm-dd"/>
		<input type="text" value="${birthdate}" class="form-control" readonly><br>
		<label for="hiredate">입사년도:</label>
		<fmt:parseDate value="${selectedEmp.hiredate}" var="hiredateFmt" pattern="yyyy-mm-dd"/>
		<fmt:formatDate value="${hiredateFmt}" var="hire" pattern="yyyy-mm-dd"/>
		<input type="text" name="hiredate" id="hiredate" class="form-control" value="${hire}" readonly><br>
		<label for="address">주소:</label>
		<input type="text" name="address" id="address" class="form-control" value="${selectedEmp.address}" readonly><br>
		<label>직급:</label>
		<select name="position_no" id="selectPosition" class="form-control">
			<c:forEach var="positionList" items="${positionList}">
				<option value="${positionList.position_no}">${positionList.position_nm}</option>
			</c:forEach>
		</select><br>
		<label for="tel">전화번호:</label>
		<input type="tel" id="tel" name="tel" class="form-control" value="${selectedEmp.tel}" readonly><br>
		<label for="work_st">근무상태:</label>
		<select name="work_st" id="selectWork_st" class="form-control">
				<option value="재직">재직</option>
				<option value="휴직">휴직</option>
				<option value="퇴직">퇴직</option>
			</select><br>
		<label for="email">이메일:</label>
		<input type="email" id="email" name="email" class="form-control" value="${selectedEmp.email}" readonly><br>
		<input type="submit" value="수정하기" class="btn" id="submit_btn">
		<input type='button' value="목록으로" class ="btn" id="toListbtn">
	</div>
	</div>
	</form:form>
</body>
</html>