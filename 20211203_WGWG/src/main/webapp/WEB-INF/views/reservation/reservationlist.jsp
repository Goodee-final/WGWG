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
		<h1 class="title">예약내역 조회</h1>
		<table id = "rsvList">
			<tr class="head">
				<th>예약번호</th>
				<th>사용용도</th>
				<th>예약시작시간</th>
				<th>예약종료시간</th>
				<th>예약취소</th>
			</tr>
			<%-- location.href='./delReservationChk.do?res_no=${rsv.res_no}' --%>
			<c:forEach var="rsv" items="${rsvList}">
				<tr>
					<td>${rsv.res_no}</td>
					<td>${rsv.res_title}</td>
					<td>${rsv.res_dt}</td>
					<td>${rsv.res_et}</td>
					<td><button type="button" id="delbtn" onclick="checkTime(${rsv.res_no})">예약취소</button></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
<script type="text/javascript">


function checkTime(res_no){
	
	var today = new Date();
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	var hours = ('0' + today.getHours()).slice(-2); 
	var minutes = ('0' + today.getMinutes()).slice(-2);
	var seconds = ('0' + today.getSeconds()).slice(-2); 
	var dateString = year + '-' + month  + '-' + day;
	var timeString = hours + ':' + minutes  + ':' + seconds;
	var now = dateString +' '+ timeString; //현재시간
	console.log(now);
	console.log(res_no);
	$.ajax({
		url: "timeChk.do",
		data : {"res_no": res_no},
		type : 'GET',
		success(res){
			console.log(res);
			if(now < res){
				alert("예약을 취소합니다.");
			} else {
				alert("예약을 취소할 수 없습니다.");
				return false;
			}
		$('#content').load('./delReservation.do?res_no='+res_no);
		}, error(res){
			console.log(res);
		}
	});
}
</script>
</html>