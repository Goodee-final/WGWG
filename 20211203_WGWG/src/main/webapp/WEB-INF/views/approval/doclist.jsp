<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재진행함</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/common/side2.jsp"></jsp:include>
	
	<div class="container" style="margin-left: 230px; margin-top: 80px; padding: 50px;">
		<h2>결재 문서함</h2>
		<br>
		<form action="./doclist.do" method="post" >
		<ul class="nav nav-pills" style="height:18px;">
			<li class="active" ><a data-toggle="pill" href="#home" style="font-size: 0.8rem;">전체</a></li>
			<li><a data-toggle="pill" href="#menu1" style="font-size: 0.8rem;">진행</a></li>
			<li><a data-toggle="pill" href="#menu2" style="font-size: 0.8rem;">완료</a></li>
			<li><a data-toggle="pill" href="#menu3" style="font-size: 0.8rem;">반려</a></li>
		</ul>
		<hr>
		<div class="tab-content" style="margin-top: 20px;">
			<div id="home" class="tab-pane in active">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>문서번호</th>
								<th>문서제목</th>
								<th>양식</th>
								<th>작성자</th>
								<th>상태</th>
								<th>기안일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="doc" items="${doclists}" varStatus="status">
								<tr>
									<td>${doc.app_doc_no}</td>
									<td>${doc.app_doc_title}</td>
									<td>${doc.form_no}</td>
									<td>${doc.emp_no}</td>
									<td>${doc.app_doc_st}</td>
									<td>${doc.app_doc_reg_dt}</td>
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
								<th>문서제목</th>
								<th>양식</th>
								<th>작성자</th>
								<th>상태</th>
								<th>기안일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="doc" items="${doclists}" varStatus="status">
								<tr>
									<td>${doc.app_doc_no}</td>
									<td>${doc.app_doc_title}</td>
									<td>${doc.form_no}</td>
									<td>${doc.emp_no}</td>
									<td>${doc.app_doc_st}</td>
									<td>${doc.app_doc_reg_dt}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
			</div>
			<div id="menu2" class="tab-pane">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>문서번호</th>
								<th>문서제목</th>
								<th>양식</th>
								<th>작성자</th>
								<th>상태</th>
								<th>기안일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="doc" items="${doclists}" varStatus="status">
								<tr>
									<td>${doc.app_doc_no}</td>
									<td>${doc.app_doc_title}</td>
									<td>${doc.form_no}</td>
									<td>${doc.emp_no}</td>
									<td>${doc.app_doc_st}</td>
									<td>${doc.app_doc_reg_dt}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
			</div>
			<div id="menu3" class="tab-pane">
				<table class="table table-hover">
						<thead>
							<tr>
								<th>문서번호</th>
								<th>문서제목</th>
								<th>양식</th>
								<th>작성자</th>
								<th>상태</th>
								<th>기안일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="doc" items="${doclists}" varStatus="status">
								<tr>
									<td>${doc.app_doc_no}</td>
									<td>${doc.app_doc_title}</td>
									<td>${doc.form_no}</td>
									<td>${doc.emp_no}</td>
									<td>${doc.app_doc_st}</td>
									<td>${doc.app_doc_reg_dt}</td>
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