<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>업무일지 조회</title>
<!-- jQuery UI CSS파일 -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<!-- jQuery 기본 js파일 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$.datepicker.setDefaults($.datepicker.regional['ko']);
				$("#startDate")
						.datepicker(
								{
									changeMonth : true,
									changeYear : true,
									nextText : '다음 달',
									prevText : '이전 달',
									dayNames : [ '일요일', '월요일', '화요일', '수요일',
											'목요일', '금요일', '토요일' ],
									dayNamesMin : [ '일', '월', '화', '수', '목',
											'금', '토' ],
									monthNamesShort : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									monthNames : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									dateFormat : "yy/mm/dd",
									maxDate : 0, // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
									onClose : function(selectedDate) {
										//시작일(startDate) datepicker가 닫힐때
										//종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
										$("#endDate").datepicker("option",
												"minDate", selectedDate);
									}

								});
				$("#endDate")
						.datepicker(
								{
									changeMonth : true,
									changeYear : true,
									nextText : '다음 달',
									prevText : '이전 달',
									dayNames : [ '일요일', '월요일', '화요일', '수요일',
											'목요일', '금요일', '토요일' ],
									dayNamesMin : [ '일', '월', '화', '수', '목',
											'금', '토' ],
									monthNamesShort : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									monthNames : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									dateFormat : "yy/mm/dd",
									maxDate : 0, // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
									// showMonthAfterYear: true,	// true : 년 월  false : 월 년 순으로 보여줌
									onClose : function(selectedDate) {
										// 종료일(endDate) datepicker가 닫힐때
										// 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
										$("#startDate").datepicker("option",
												"maxDate", selectedDate);
									}

								});
			});
</script>

<style>
/* 초기화 */
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

#container {
	margin: 20px;
}

#searchText {
	width: 600px;
	height: 50px;
}

#search {
	width: 100px;
	height: 50px;
}

#logList {
	width: 650px;
}

.num {
	text-align: center;
}
</style>
</head>

<body>

	<div id="container">
		<h1>주간 업무일지 조회</h1>
		<button value="1" onclick="location.href='./worklogMyList.do'">개인별조회</button>
		<button value="2">부서별조회</button>
		
		<form action="">
			<input type="text" id="searchText" name="searchText" placeholder="작성자나 제목을 입력해주세요.">
			시작일 : <input type="text" id="startDate">
			종료일 : <input type="text" id="endDate">
			<input type="button" value="검색" id="search">
		</form>
		
		<!-- 개인별조회 -->
		<form action="./worklogMyList.do" method="post">
			<!-- <input type="text" id="searchText" name="searchText" placeholder="작성자나 제목을 입력해주세요.">
			시작일 : <input type="text" id="startDate">
			종료일 : <input type="text" id="endDate">
			<input type="button" value="검색" id="search"> -->
			<!-- 체크박스 만들어야해! delflag 바꿔줄거 -->
			<table id="logList">
				<thead>
					<tr>
						<th><input id="allChk" type="checkbox" onclick="allChks(this.checked)"> </th>
						<th>연번</th>
						<th>제목</th>
						<th>작성자</th>
						<th>직급</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					
					<tr>
						<td>
	        				<input type="checkbox" name="chk" value="${obj.seq}">
	     				</td>
						<td class="num">1</td>
						<td class="num">업무일지제목</td>
						<td class="num">김스누피</td>
						<td class="num">사원</td>
						<td class="num">2021.12.11.</td>
					</tr>
				
				</tbody>
			</table>
		</form>
		
		<!-- 부서별조회 -->
		<form action="./worklogDeptList.do" method="post">
			<!-- <input type="text" id="searchText" name="searchText" placeholder="작성자나 제목을 입력해주세요.">
			<input type="text" id="startDate">
			<input type="text" id="endDate">
			<input type="button" value="검색" id="search"> -->
			<!-- 체크박스 만들어야해! delflag 바꿔줄거 -->
			<table id="logList">
				<thead>
					<tr>
						<th>연번</th>
						<th>제목</th>
						<th>작성자</th>
						<th>직급</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
				<c:if test=""></c:if>
					<tr>
						<td class="num">1</td>
						<td class="num">업무일지제목</td>
						<td class="num">김스누피</td>
						<td class="num">사원</td>
						<td class="num">2021.12.11.</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

</body>

</html>