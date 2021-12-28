<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업무일지 검색 조회</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"/>
<style>
.container {
	margin: 0;
	width: 1200px;
	padding: 10px;
}

h1 {
	text-align: center;
}

.formList {
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

#layer1, #layer2 {
	display: none;
}
</style>
</head>
<body>

	<div class="container">
		<h1>업무일지 검색 조회</h1>
		<button id="btn" onclick="location.href='./worklogList.do'">전체목록 가기</button>
		<br>
		<form action="./worklogSearchList.do" method="get">

			<hr>
			<div class="tab-content" style="margin-top: 20px;">
				<div id="my" class="tab-pane in active">
				<c:if test="${!empty searchList}">
					<table class="table table-hover">
						<thead style="text-align: center">
							<tr style="text-align: center">
								<th>문서번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>직급</th>
								<th>작성일</th>
								<th>수정일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="search" items="${searchList}" varStatus="status">
								<c:if test="${emp.dept_no eq search.emp.dept_no}">
								<tr style="text-align: center">
									<td>${search.worklog_no}</td>
									<td><a
										href='./worklogDetail.do?worklog_no=${search.worklog_no}'>${search.worklog_title}</a>
									</td>
									<td>${search.emp.emp_nm}</td>
									<td>${search.position.position_nm}</td>
									<td>${search.worklog_reg_dt}</td>
									<td>${search.worklog_modify_dt}</td>
								</tr>
								</c:if>
								
							</c:forEach>
						</tbody>
					</table>
					</c:if>
					<c:if test="${empty searchList}">
						조회 결과가 없습니다.
					</c:if>
				</div>
			</div>
		</form>
	</div>
</body>
</html>