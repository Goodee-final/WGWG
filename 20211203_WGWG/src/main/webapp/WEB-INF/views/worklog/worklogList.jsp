<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업무일지 조회</title>

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 -->


<style>
.container {
	margin: 0;
	width: 1200px;
	padding: 10px;
	/* margin-left: 80px;
	padding-left: 100px; */
}
.formList {
	/* margin: 0 auto;
	width: 1000px;
	margin-left: 70px;
	padding-left: 100px; */
	border-collapse: collapse;
}

.head {
	background-color: #ddd;
}

th, td {
	padding: 8px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}

#searchBox {
	display: inline-block;
	width: 1200px;
}

#search {
	float: right;
	width: 100%;
	height: 40px;
}

#search_btn {
	width: 8%;
	height: 80%;
	border-radius: 5px;
	font-size: 1.3rem;
	border: 1px solid #ddd;
	background-color: #073865;
	color: white;
	margin-left: 5px;
	border: 1px solid #ddd
}

#inputsearch {
	border: 1px solid #ddd;
	font-size: 1.3rem;
}

#inputsearch:focus {
	outline: 1px solid #073865;
}

#searchText {
	width: 50%;
	height: 80%;
}

#startDate, #endDate {
	width: 15%;
	height: 80%;
}
</style>
<script type="text/javascript">
	jQuery.browser = {};
	(function() {
		jQuery.browser.msie = false;
		jQuery.browser.version = 0;
		if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
			jQuery.browser.msie = true;
			jQuery.browser.version = RegExp.$1;
		}
	})();

	$(document).ready(function () {
	/* $(function() { */
		$.datepicker.setDefaults($.datepicker.regional['ko']);
		$("#startDate").datepicker(
				{
					changeMonth : true,
					changeYear : true,
					nextText : '다음 달',
					prevText : '이전 달',
					dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일',
							'토요일' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					dateFormat : "yy/mm/dd",
					maxDate : 0, // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
					onClose : function(selectedDate) {
						//시작일(startDate) datepicker가 닫힐때
						//종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
						$("#endDate").datepicker("option", "minDate",
								selectedDate);
					}

				});
		$("#endDate").datepicker(
				{
					changeMonth : true,
					changeYear : true,
					nextText : '다음 달',
					prevText : '이전 달',
					dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일',
							'토요일' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					dateFormat : "yy/mm/dd",
					maxDate : 0, // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
					// showMonthAfterYear: true,	// true : 년 월  false : 월 년 순으로 보여줌
					onClose : function(selectedDate) {
						// 종료일(endDate) datepicker가 닫힐때
						// 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
						$("#startDate").datepicker("option", "maxDate",
								selectedDate);
					}

				});
	});
</script>

</head>
<body>
   <div class="container">
      <h1>업무일지 조회</h1>
      <br>
      <form action="./worklogInsert.do" method="post">
      <div id="searchBox">
		<div id="search">
			<input type="text" id="searchText" name="searchText" placeholder="작성자나 내용을 입력해주세요.">
			시작일 :  <input type="text" id="startDate">
			종료일 : <input type="text" id="endDate">
			<input type="submit" value="검색" id="search_btn">
		</div>
		<br>
		
		<ul class="nav nav-pills" style="height:18px;">
			<li class="active" ><a data-toggle="pill" href="#my" style="font-size: 1.2rem;">개인별 조회</a></li>
	        <li><a data-toggle="pill" href="#menu1" style="font-size: 1.2rem;">부서별 조회</a></li>
	    </ul>
	      
      </div>
      <hr>
      <div class="tab-content" style="margin-top: 20px;">
         <div id="my" class="tab-pane in active">
               <table class="table table-hover">
                  <thead style="text-align:center">
                     <tr style="text-align:center">
                        <th>문서번호</th>
						<th>내용</th>
						<th>작성자</th>
						<th>직급</th>
						<th>작성일</th>
						<th>수정일</th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach var="my" items="${worklogmylist}" varStatus="status">
                     	<tr style="text-align:center">	
	                        <td>${my.worklog_no}</td>
	                        <td><a href='./worklogDetail.do?no=${my.worklog_no}'>${my.worklog_content}</a></td>
	                        <td>${my.emp.emp_nm}</td>
	                        <td>${my.position.position_nm}</td>
	                        <td>${my.worklog_reg_dt}</td>
	                        <td>${my.worklog_modify_dt}</td>
                        </tr>
                     </c:forEach>
                  </tbody>
               </table>
            </div>
            
         <div id="menu1" class="tab-pane">
            <table class="table table-hover">
                  <thead>
                     <tr>
                        <th>문서번호</th>
						<th>내용</th>
						<th>작성자</th>
						<th>직급</th>
						<th>작성일</th>
						<th>수정일</th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach var="dept" items="${worklogdeptlist}" varStatus="status">
                        <tr>
                           <td>${dept.worklog_no}</td>
                           <td><a href='./worklogDetail.do?no=${dept.worklog_no}'>${dept.worklog_content}</a></td>
                           <td>${dept.emp.emp_nm}</td>
                           <td>${dept.position.position_nm}</td>
                           <td>${dept.worklog_reg_dt}</td>
                           <td>${dept.worklog_modify_dt}</td>
            </tr>
                     </c:forEach>
                  </tbody>
               </table>
         </div>
         
        
         
      </div>
      </form>
   </div>
   
</body>
</html>


<!-- 	<div id="container_top">
		<h1>주간 업무일지 조회</h1>
		<form action="" id="searchbox">
			<input type="text" id="searchText" name="searchText" placeholder="작성자나 제목을 입력해주세요.">
			시작일 : <input type="text" id="startDate">
			종료일 : <input type="text" id="endDate">
			<input type="button" value="검색" id="search_btn"><br>
		</form>
	</div> -->


	<%-- <div id="container">
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
					<c:forEach var="obj" items="${requestScope.lists}" varStatus="vs">
				    <c:if test="${obj.delflag eq 'N'}">
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
					</c:if>
					</c:forEach>
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
	</div> --%>
