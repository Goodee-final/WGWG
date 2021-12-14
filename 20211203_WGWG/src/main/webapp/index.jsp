<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인덱스</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://kit.fontawesome.com/d42fd504d6.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<<<<<<< HEAD
<script src="https://cdn.jsdelivr.net/npm/signature_pad@2.3.2/dist/signature_pad.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
=======
<script
	src="https://cdn.jsdelivr.net/npm/signature_pad@2.3.2/dist/signature_pad.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
>>>>>>> branch 'main' of https://github.com/tkdgns1127/WGWG.git


<script type="text/javascript">
	var loc = "${loc}";

	$(document).ready(function() {
		console.log(loc);

		if (loc != "") {
			$("#content").load(loc);

		}

		$('.nav-flyout li').on('click', function(e) {

			console.log($(this).attr('value'));

			$("#content").load($(this).attr('value'));

		});
	});
</script>

<style>

/*header  */
html, body {
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none;
	width: max-content;
	height: max-content;
}

ul {
	list-style: none;
}

.header {
	max-width: 1600px;
	height: 80px;
	background-color: #073865 !important;
	margin: 0;
	padding: 0;
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
}

#logo-image {
	width: 200px;
	height: 45px;
	background-image: url("./img/logo.png");
	background-color: white;
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	margin: 0 auto;
}

.nav li {
	float: left;
}

.left {
	float: left;
}

.right {
	float: right;
	margin-right: 30px;
	color: white;
}

.right .nav li {
	margin-left: 15px;
}

.nav-icon {
	width: 35px;
	height: 35px;
	margin: 0 auto;
	margin-right: 5px;
	margin-top: 5px;
}

.nav-icon:hover {
	cursor: pointer;
}

#mypage-img {
	background-image: url("./img/user.svg");
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}

#alert-img {
	background-image: url("./img/bell.svg");
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}

#logout-img {
	background-image: url("./img/logoutt.svg");
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}
<<<<<<< HEAD


/*side  */
=======
>>>>>>> branch 'main' of https://github.com/tkdgns1127/WGWG.git

/*side  */
.sidebar {
	background-color: #19222a;
}


.nav-flyout {
	display: none;
}


.nav1:hover>.nav-flyout {
	display: block;
}


.nav1 {
	padding: 5px;
}


ul {
	list-style: none;
	margin-left: 0;
	padding-left: 0;
}


.w3-sidebar>ul>li {
	list-style: none;
	margin-top: 5px;
	margin-left: 0;
	font-size: 16px;
}

.nav-flyout a {
	text-decoration: none;
	color: #073865;
	font-size: 16px;
}

.nav-flyout li {
	background-color: whitesmoke;
}

.w3-sidebar>ul>li:hover {
	color: #107EE6;
}

.w3-sidebar>ul>li:hover>ul>li {
	color: #073865;
	font-size: 16px;
}

.w3-sidebar>ul li:hover>i {
	color: #107EE6;
}

.w3-sidebar>ul>li {
	text-decoration: none;
	color: #073865;
	font-size: 20px;
}

.w3-bar-block .w3-bar-item {
	padding: 8px 0px;
}

i {
	color: #073865;
	padding: 2px;
	padding-right: 4px;
}

.far {
	margin-top: 5px;
	margin-left: 5px;
}

.fas {
	margin-top: 5px;
	margin-left: 5px;
}

.fas:hover {
	color: black;
	cursor: pointer;
}

.li-btn {
	display: flex;
	justify-content: center;
	align-items: center;
}

.btn {
	width: 150px;
	height: 35px;
	margin-top: 5px;
	margin-bottom: 5px;
}
</style>

</head>

<body>
	<div class="header">
		<div class="left">
			<ul class="nav">
				<li><div id="logo-image"></div></li>
			</ul>
		</div>
		<div class="right">
			<ul class="nav">
				<li>
					<div class="nav-icon" id="mypage-img"></div>
				</li>
				<li>
					<div class="nav-icon" id="alert-img"></div>
				</li>
				<li>
					<div class="nav-icon" id="logout-img"></div>
				</li>
			</ul>
		</div>
	</div>


	<!-- Sidebar -->
	<!--  w3-light-grey -->
	<div class="w3-sidebar w3-bar-block" style="width: 230px; margin-top: 50px; background-color: white; border-right: 2px solid #073865;">
		<ul>
			<li class="w3-bar-item nav1"><i class="fas fa-file-signature"></i>전자결재
				<ul class="nav-flyout">
					<li class="li-btn" value=""><button
							class="w3-btn w3-blue w3-round btn">기안하기</button></li>
					<li class="w3-bar-item w3-button w3-hover-blue"
						value="./signlist.do">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전자서명 관리</li>
					<li class="w3-bar-item w3-button w3-hover-blue"
						value="./signinsert.do">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전자서명 등록</li>
					<li class="w3-bar-item w3-button w3-hover-blue"
						value="./signdraw.do">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전자서명만들기</li>
					<li class="w3-bar-item w3-button w3-hover-blue" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;결재
						진행함</li>
					<li class="w3-bar-item w3-button w3-hover-blue" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;결재
						대기함</li>
					<li class="w3-bar-item w3-button w3-hover-blue"
						value="./completedoc.do">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;결재 완료함</li>
					<li class="w3-bar-item w3-button w3-hover-blue" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;참조문서함</li>
					<li class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;개인문서함</li>
					<li class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;임시문서함</li>
				</ul></li>

			<li class="w3-bar-item nav1"><i class="fas fa-business-time"></i>근태관리
				<ul class="nav-flyout">
					<li class="w3-bar-item w3-button w3-hover-blue" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;근태관리</li>
					<li class="w3-bar-item w3-button w3-hover-blue" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;근태관리</li>
				</ul></li>

			<li class="w3-bar-item nav1"><i class="fas fa-thumbtack"></i>
				공지사항
				<ul class="nav-flyout">
					<li class="w3-bar-item w3-button w3-hover-blue"
						value="./noticeList.do">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공지사항</li>
					<li class="w3-bar-item w3-button w3-hover-blue" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공지사항</li>
				</ul></li>

			<li class="w3-bar-item nav1"><i class="far fa-calendar"></i>일정관리
				<ul class="nav-flyout">
					<li class="w3-bar-item w3-button w3-hover-blue"
						value="./loadForm.do">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일정관리</li>
					<li class="w3-bar-item w3-button w3-hover-blue" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일정관리</li>
				</ul>
			</li>

			<li class="w3-bar-item nav1"><i class="far fa-calendar-check"></i>예약관리
				<ul class="nav-flyout">
					<li class="w3-bar-item w3-button w3-hover-blue" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;예약관리</li>
					<li class="w3-bar-item w3-button w3-hover-blue" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;예약관리</li>
				</ul></li>

			<li class="w3-bar-item nav1"><i class="far fa-file"></i>업무일지
				<ul class="nav-flyout">
					<li class="w3-bar-item w3-button w3-hover-blue" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;업무일지</li>
					<li class="w3-bar-item w3-button w3-hover-blue" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;업무일지</li>
				</ul></li>

			<li class="w3-bar-item nav1"><i class="fas fa-sms"></i>채팅
				<ul class="nav-flyout">
					<li class="w3-bar-item w3-button w3-hover-blue" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;채팅</li>
					<li class="w3-bar-item w3-button w3-hover-blue" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;채팅</li>
				</ul></li>
			<li class="w3-bar-item nav1"><i class="fas fa-sms"></i>양식함
				<ul class="nav-flyout">
					<li class="w3-bar-item w3-button w3-hover-blue"
						value="./formlist.do">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;양식목록</li>
					<li class="w3-bar-item w3-button w3-hover-blue"
						value="./forminsert.do">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;양식등록</li>
				</ul></li>
		</ul>
	</div>

	<div id="content" style="margin-left: 230px; margin-top: 50px; padding: 50px;">
		인덱스 화면
	</div>

</body>