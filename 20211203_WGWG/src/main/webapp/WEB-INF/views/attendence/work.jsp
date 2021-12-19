<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>work</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
		<h2>근태</h2>
		<br>
		<ul class="nav nav-pills" style="height:18px;">
			<li class="active" ><a data-toggle="pill" href="#home" style="font-size: 0.8rem;">근무시간</a></li>
			<li><a data-toggle="pill" href="#menu1" style="font-size: 0.8rem;">연차</a></li>
		</ul>
		<hr>
		<div class="tab-content" style="margin-top: 20px;">
			<div id="home" class="tab-pane in active">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>일자</th>
								<th>출근시간</th>
								<th>퇴근시간</th>
								<th>수정요청</th>
							</tr>
						</thead>
						<tbody>
								<tr>
									<td>${record}</td>
									<td>${record}</td>
									<td>${record}</td>
									<td>${record}</td>
								</tr>
						</tbody>
					</table>
				</div>
				
			<div id="menu1" class="tab-pane">
				<table class="table table-hover">
						<thead>
							<tr>
								<th>총연차갯수</th>
								<th>사용연차갯수</th>
								<th>잔여연차갯수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="doc" items="${doclists}" varStatus="status">
								<tr>
									<td>${doc.app_doc_no}</td>
									<td>${doc.app_doc_title}</td>
									<td>${doc.form_no}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
			</div>
		</div>

    


    <script>
			function openTransmit(evt, transmit) {
				var i, tabcontent, tablinks;
				tabcontent = document
						.getElementsByClassName("tabcontent");
				for (i = 0; i < tabcontent.length; i++) {
					tabcontent[i].style.display = "none";
				}
				tablinks = document.getElementsByClassName("tablinks");
				for (i = 0; i < tablinks.length; i++) {
					tablinks[i].className = tablinks[i].className
							.replace(" active", "");
				}
				document.getElementById(transmit).style.display = "block";
				evt.currentTarget.className += " active";
			}
	</script>

</body>
</html>