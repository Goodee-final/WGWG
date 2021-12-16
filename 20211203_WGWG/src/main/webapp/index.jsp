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
<script
	src="https://cdn.jsdelivr.net/npm/signature_pad@2.3.2/dist/signature_pad.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<script type="text/javascript">
	var loc = "${loc}";

	$(document).ready(function() {
		console.log(loc);

		if (loc != "") {
			$("#content").load(loc);

		}else{
			
		}

		$('.nav-flyout li').on('click', function(e) {

			console.log($(this).attr('value'));
		
			$("#content").load($(this).attr('value'));

		});
		
		
	});
</script>
<script language='javascript'>

function noEvent() {
    if (event.keyCode == 116) {
        event.keyCode= 2;
        return false;
    }
    else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82))
    {
        return false;
    }
}
document.onkeydown = noEvent;

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
	display: block;
	max-width: 1600px;
	height: 80px;
	margin: 0 auto;
	padding: 0;
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	border-bottom: 2px solid #EEEEEE;
	background-color: white;
}

#logo-image {
	width: 190px;
	height: 50px;
	background-image: url("./img/logo1.png");
	background-color: white;
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	margin-top: 15px;
	margin-left: 30px;
}

.nav li {
	float: left;
}

.left {
	float: left;
}

.right {
	color: white;
	float: right;
}

.right .nav{
	position: fixed;
	top: 0;
	right: 60px;
}

.right .nav li {
	margin-left: 15px;
}

.nav-icon {
	width: 35px;
	height: 35px;
	margin: 0 auto;
	margin-right: 5px;
	margin-top: 15px;
}

.nav-icon:hover {
	cursor: pointer;
}

#mypage-img {
	background-image: url("./img/user1.svg");
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}

#alert-img {
	background-image: url("./img/bell1.svg");
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}

#logout-img {
	background-image: url("./img/logout.svg");
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}

/*side  */
.w3-sidebar {
	background-color: #073865 !important;
}
.nav1 {
	padding-left: 20px !important;
	padding-top: 20px !important;
}

.nav-flyout {
	display: none;
	margin: 0;
	width: 150px;
	font-size: 15px !important;
}

.nav1:hover>.nav-flyout {
	display: block;
}


ul {
	list-style: none;
	margin: 0 !important;
	padding: 0 !important;
}

.nav-flyout li:hover {
	background-color: #073865;
	color: white;
}

.w3-sidebar>ul>li {
	text-decoration: none;
	color: white;
	list-style: none;
	margin-left: 0;
	font-size: 18px !important;
}

.w3-sidebar>ul>li:hover {
	background-color: white;
	color: #073865;
}

.w3-sidebar>ul>li:hover>ul>li {
	background-color: white;
	color: #073865;
	font-size: 16px !important;
}

.w3-sidebar>ul li:hover>i {
	color: #073865;
}

.w3-button:hover {
	background-color: #073865 !important;
	color: white !important;
	width: 130px;
}

.w3-bar-block .w3-bar-item {
	padding: 8px 0px;
}

i {
	color: white;
	padding-left: 2px;
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

.far:hover .fas:hover {
	color: black;
	cursor: pointer;
}

.li-btn {
	display: flex;
	justify-content: center;
	align-items: center;
}

.btn {
	width: 100px;
	height: 35px;
	margin-top: 5px;
	margin-bottom: 5px;
	background-color: #073865;
	color: white;
}

.btn:hover {
	color: white;
}

.footer {
    width: 1420px;
    height: 200px;
    margin-left: 180px;
    background-color: #f1f1f1;
    display: block;    
}
.footer-content {
	width: 800px;
	height: 150px;
}
</style>

</head>

<body oncontextmenu="return false">
	<header class="header">
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
					<div class="nav-icon" id="logout-img" onclick="location.href='./logout.do'"></div>
				</li>
				<li>
					<div class="nav-icon"><a href="./loginForm.do">로그인</a></div>
				</li>
			</ul>
		</div>
	</header>


	<!-- Sidebar -->
	<!--  w3-light-grey -->
	<article class="w3-sidebar w3-bar-block"
		style="width: 180px; margin-top: 30px; background-color: white; border-right: 2px solid #EEEEEE;">
		<ul>
			<li class="w3-bar-item nav1"><i class="fas fa-file-signature"></i>전자결재
				<ul class="nav-flyout">
					<li class="w3-bar-item w3-button" value="">기안하기</li>
					<li class="w3-bar-item w3-button"
						value="./signlist.do">전자서명 관리</li>
					<li class="w3-bar-item w3-button"
						value="./signinsert.do">전자서명 등록</li>
					<li class="w3-bar-item w3-button"
						value="./signdraw.do">전자서명만들기</li>
					<li class="w3-bar-item w3-button" value="">결재
						진행함</li>
					<li class="w3-bar-item w3-button" value="">결재
						대기함</li>
					<li class="w3-bar-item w3-button"
						value="./completedoc.do">결재 완료함</li>
					<li class="w3-bar-item w3-button" value="">참조문서함</li>
					<li class="w3-bar-item w3-button">개인문서함</li>
					<li class="w3-bar-item w3-button">임시문서함</li>
				</ul>
			</li>

			<li class="w3-bar-item nav1"><i class="fas fa-business-time"></i>근태관리
				<ul class="nav-flyout">
					<li class="w3-bar-item w3-button" value="./workrecord.do">근태관리</li>
					<li class="w3-bar-item w3-button" value="">근태관리</li>
				</ul></li>

			<li class="w3-bar-item nav1"><i class="fas fa-thumbtack"></i>
				공지사항
				<ul class="nav-flyout">
					<li class="w3-bar-item w3-button"
						value="./noticeList.do">공지사항</li>
					<li class="w3-bar-item w3-button" value="">공지사항</li>
				</ul></li>

			<li class="w3-bar-item nav1"><i class="far fa-calendar"></i>일정관리
				<ul class="nav-flyout">
					<li class="w3-bar-item w3-button"
						value="./loadForm.do">일정관리</li>
					<li class="w3-bar-item w3-button" value="">일정관리</li>
				</ul></li>

			<li class="w3-bar-item nav1"><i class="far fa-calendar-check"></i>예약관리
				<ul class="nav-flyout">
					<li class="w3-bar-item w3-button" value="">예약관리</li>
					<li class="w3-bar-item w3-button" value="">예약관리</li>
				</ul></li>

			<li class="w3-bar-item nav1"><i class="far fa-file"></i>업무일지
				<ul class="nav-flyout">
					<li class="w3-bar-item w3-button" value="">업무일지</li>
					<li class="w3-bar-item w3-button" value="">업무일지</li>
				</ul></li>

			<li class="w3-bar-item nav1"><i class="fas fa-sms"></i>채팅
				<ul class="nav-flyout">
					<li class="w3-bar-item w3-button" value="">채팅</li>
					<li class="w3-bar-item w3-button" value="">채팅</li>
				</ul></li>
			<li class="w3-bar-item nav1"><i class="fas fa-file"></i>양식함
				<ul class="nav-flyout">
					<li class="w3-bar-item w3-button" value="./formlist.do">양식목록</li>
					<li class="w3-bar-item w3-button" value="./forminsert.do">양식등록</li>
				</ul></li>
			<li class="w3-bar-item nav1"><i class="fas fa-users"></i>사원관리
				<ul class="nav-flyout">
					<li class="w3-bar-item w3-button "
						value="./insert_emp_form.do">사원등록</li>
					<li class="w3-bar-item w3-button "
						value="">사원조회</li>
				</ul></li>
		</ul>
	</article>
	<div id="content"style="margin-left: 230px; margin-top: 50px; padding: 50px; width: 900px; height: 700px;">
		인덱스 화면
	</div>
	<footer class="footer">
		<div class="footer-content">
			<p>주소: 서울특별시 금천구 가산디지털2로 00 </p>
		</div>
    </footer>
</body>