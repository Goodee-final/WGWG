<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>완료 문서함</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
body {
	font-family: Arial;
}

/* Style the tab */
.tab {
	overflow: hidden;
	border: 1px solid #ccc;
	background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
	background-color: inherit;
	float: left;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	transition: 0.3s;
	font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
	background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
	background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
	display: none;
	padding: 6px 12px;
	border: 1px solid #ccc;
	border-top: none;
}
</style>
</head>
<body>


	<h2>결재 완료함</h2>
	<div class="tab">
		<button class="tablinks" onclick="openTransmit(event, 'reception')">수신</button>
		<button class="tablinks" onclick="openTransmit(event, 'send')">송신</button>
	</div>

	<div id="reception" class="tabcontent">
		<form action="./docList.do" method="post">

			송신리스트
			<table class="table table-hover">
				<thead>
					<tr>
						<th>문서번호</th>
						<th>문서제목</th>
						<th>양식</th>
						<th>작성자</th>
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
							<td>${doc.app_doc_reg_dt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</form>
	</div>


	<div id="send" class="tabcontent">
		<form action="./docList.do" method="post">
			수신리스트
			<table class="table table-hover">
				<thead>
					<tr>
						<th>문서번호</th>
						<th>문서제목</th>
						<th>양식</th>
						<th>작성자</th>
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
							<td>${doc.app_doc_reg_dt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</form>
	</div>



	<script>
		function openTransmit(evt, transmit) {
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabcontent");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablinks");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(
						" active", "");
			}
			document.getElementById(transmit).style.display = "block";
			evt.currentTarget.className += " active";
		}
	</script>







</body>
</html>