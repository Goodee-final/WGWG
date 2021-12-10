<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/d42fd504d6.js"
	crossorigin="anonymous"></script>
<style type="text/css">
#container {
	display: flex;
	flex-direction: row;
}

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
	padding: 5px;
	list-style: none;
	margin-top: 5px;
	margin-left: 0;
	padding-left: 0;
}

.nav-flyout a {
	text-decoration: none;
	color: #fff;
	font-size: 16px;
	
}

.nav-flyout li{
	background-color: #0a5aa3;
}


.w3-sidebar>ul>li:hover>a {
	color: black;
}

.w3-sidebar>ul>li:hover>.far .fas {
	color: black;
}

.w3-sidebar>ul>li>a {
	text-decoration: none;
	color: #ffff;
	font-size: 20px;
}

.w3-bar-block .w3-bar-item {
	padding: 8px 0px;
}

i {

	padding: 2px;
	padding-right: 4px;
}

.far{
	margin-top: 5px;
	margin-left: 5px;
}

.fas{
	margin-top:5px;
	margin-left: 5px;
}

.fas:hover{
	color:black;
	cursor:pointer;
}

.li-btn{
	display: flex;
	justify-content: center;
	align-items: center;
}

.btn{
	margin-top: 5px;
	margin-bottom: 5px;
}

</style>

</head>


<body>

	<!-- Sidebar -->
	<!--  w3-light-grey -->
	<div class="w3-sidebar w3-bar-block"
		style="width: 18%; background-color: #073865;">
		<ul>
			<li class="w3-bar-item nav1"><i class="fas fa-file-signature"
				style="color: white"></i><a href="#">전자결재</a>
				<ul class="nav-flyout">
					<li class="li-btn"><button class="w3-btn w3-white w3-round btn">기안하기</button></li>
					<li><a href="./signlist.do" class="w3-bar-item w3-button">&nbsp;&nbsp;전자서명 관리</a></li>
					<li><a href="./signinsert.do" class="w3-bar-item w3-button">&nbsp;&nbsp;전자서명 등록</a></li>
					<li><a href="./signdraw.do" class="w3-bar-item w3-button">&nbsp;&nbsp;전자서명만들기</a></li>
					<li><a href="#" class="w3-bar-item w3-button">&nbsp;&nbsp;결재 진행함</a></li>
					<li><a href="#" class="w3-bar-item w3-button">&nbsp;&nbsp;결재 대기함</a></li>
					<li><a href="#" class="w3-bar-item w3-button">&nbsp;&nbsp;결재 완료함</a></li>
					<li><a href="#" class="w3-bar-item w3-button">&nbsp;&nbsp;참조 문서함</a></li>
					<li><a href="#" class="w3-bar-item w3-button">&nbsp;&nbsp;개인 문서함</a></li>
					<li><a href="#" class="w3-bar-item w3-button">&nbsp;&nbsp;임시 문서함</a></li>
				</ul></li>
			<li class="w3-bar-item nav1"><i class="fas fa-business-time"
				style="color: white"></i><a href="#">근태관리</a>
				<ul class="nav-flyout">
					<li><a href="#" class="w3-bar-item w3-button">&nbsp;&nbsp;전자서명 관리</a></li>
					<li><a href="./signdraw.do" class="w3-bar-item w3-button">&nbsp;&nbsp;전자서명만들기</a></li>
				</ul></li>
			<li class="w3-bar-item nav1">
				<i class="fas fa-thumbtack" style="color: white"></i>
				<a href="#">공지사항</a>
				<ul class="nav-flyout">
					<li><a href="#" class="w3-bar-item w3-button">&nbsp;&nbsp;전자서명 관리</a></li>
					<li><a href="./signdraw.do" class="w3-bar-item w3-button">&nbsp;&nbsp;전자서명만들기</a></li>
				</ul>
				</li>

			<li class="w3-bar-item nav1"><i class="far fa-calendar" style="color: white"></i>
				<a href="#">일정관리</a>
				<ul class="nav-flyout">
					<li><a href="#" class="w3-bar-item w3-button">&nbsp;&nbsp;전자서명 관리</a></li>
					<li><a href="./signdraw.do" class="w3-bar-item w3-button">&nbsp;&nbsp;전자서명만들기</a></li>
				</ul></li>

			<li class="w3-bar-item nav1"><i class="far fa-calendar-check"
				style="color: white"></i><a href="#">예약관리</a>
				<ul class="nav-flyout">
					<li><a href="#" class="w3-bar-item w3-button">&nbsp;&nbsp;전자서명 관리</a></li>
					<li><a href="./signdraw.do" class="w3-bar-item w3-button">&nbsp;&nbsp;전자서명만들기</a></li>
				</ul></li>

			<li class="w3-bar-item nav1"><i class="far fa-file"
				style="color: white"></i><a href="#">업무일지</a>
				<ul class="nav-flyout">
					<li><a href="#" class="w3-bar-item w3-button">&nbsp;&nbsp;전자서명 관리</a></li>
					<li><a href="./signdraw.do" class="w3-bar-item w3-button">&nbsp;&nbsp;전자서명만들기</a></li>
				</ul></li>
			<li class="w3-bar-item nav1"><i class="fas fa-sms"
				style="color: white"></i><a href="#">채팅</a>
				<ul class="nav-flyout">
					<li><a href="#" class="w3-bar-item w3-button">&nbsp;&nbsp;전자서명 관리</a></li>
					<li><a href="./signdraw.do" class="w3-bar-item w3-button">&nbsp;&nbsp;전자서명만들기</a></li>
				</ul></li>
		</ul>
	</div>




</body>
</html>