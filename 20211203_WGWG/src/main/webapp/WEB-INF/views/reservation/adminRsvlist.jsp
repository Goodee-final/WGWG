<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<style>
	
	#rsvList {
		margin: 0 auto;
		width: 1000px;
		margin-left: 70px;
		padding-left: 100px;
		border-collapse: collapse;
	}
	
	#rsvList th, #rsvList td {
	  padding: 8px;
	  text-align: center;
	  border-bottom: 1px solid #ddd;
	}
	
	.head {
		background-color: #ddd;
	}
	.title {
		margin-bottom: 40px;
	}
</style>
<body>
	<div class ="container">
		<h1 class="title">회의실 관리</h1>
		<button type="button" onclick=insert()>회의실 추가하기</button>
		<table id = "rsvList">
			<tr class="head">
				<th>회의실번호</th>
				<th>회의실이름</th>
				<th>상태</th>
			</tr>
			<%-- location.href='./delReservationChk.do?res_no=${rsv.res_no}' --%>
			<c:forEach var="rsv" items="${rsvList}">
				<tr>
					<td>${rsv.room_no}</td>
					<td>${rsv.room_nm}</td>
					<td>${rsv.room_state}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
<script type="text/javascript">
function insert(){
	var room_nm = prompt("회의실 이름을 입력하세요");
	if(room_nm) {
		location.href="./insertRoom.do?room_nm="+room_nm;
	} else{
		alert("회의실 이름은 필수 입력 항목입니다.");
		return false;
	}
	
}

</script>
</html>