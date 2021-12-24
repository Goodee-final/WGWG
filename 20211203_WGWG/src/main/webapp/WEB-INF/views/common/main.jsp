<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<section id="content">
		<div id="main-content">
			<div id="main-content1">
				<div class="main-loginemp">
					<div id="emp-img"><img id="empphoto" src="./img/${emp.photo}"></div>
					<div id="emp-info">
						<span>${emp.emp_nm}</span><br>
						<span>${emp.dVo.dept_nm}</span>
						<span>${emp.pVo.position_nm}</span><br>
						<!-- <button type="button" id="on">출근하기</button>
						<button type="button" id="off">퇴근하기</button> -->
					</div>
					<span id="empnm">이름</span><span id="emppo">사원</span>
				</div>
				<div class="main-calendar">
					달력
				</div>
			</div>
			<div id="main-content2">
				<div class="main-notice">
				<span id="allno">전체공지사항</span>
				<span id="moreno"><a href="./noticeList.do">더보기</a></span>
					<table id="notili">
						<tbody>
							<c:forEach var="notice" items="${noticeList}">
								<tr>
									<td>${notice.notice_no}</td>
									<td><a href="./detailnotice.do?notice_no=${notice.notice_no}">${notice.notice_title}</a></td>
									<td>등록일: ${notice.notice_reg_dt}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
				</div>
				<div class="main-approval">
					결재
				</div>
			</div>
		</div>
	</section>

</body>
</html>