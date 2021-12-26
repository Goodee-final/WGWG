<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인덱스</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<!-- <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>  -->
<!-- <!-- include summernote css/js--> -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>

<!--  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"/> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script> -->

<script src="https://kit.fontawesome.com/d42fd504d6.js" crossorigin="anonymous"></script>

<!-- <script src="https://cdn.jsdelivr.net/npm/signature_pad@2.3.2/dist/signature_pad.min.js"></script> -->

<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css" rel="stylesheet"/>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js"></script>

<link rel="shortcut icon" href="img/favicon2.ico" type="image/x-icon" >
<link rel="icon" href="img/favicon2.ico" type="image/x-icon" sizes="16x16">


<script type="text/javascript">
	
	var loc =  "<%=session.getAttribute("loc") %>"
	var cal =  "<%=session.getAttribute("cal") %>"

	$(document).ready(function() {
		console.log(loc);

		if (loc != "") {
			$("#content").load(loc);
		}else{
			$("#content").load("index.jsp");
		}

		$('.nav-flyout li').on('click', function(e) {

			console.log($(this).attr('value'));
		
			$("#content").load($(this).attr('value'));

		});
		
		$('#logo-image').click(function(){
			$('#content').load('./main.do');
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
	color: black;
	cursor: pointer;
}

ul {
	list-style: none;
}

.header {
	display: inline-block;
	width: 100%;
	height: 80px;
	margin: 0 auto;
	padding: 0;
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	z-index: 10;
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

#logo-image:hover{
	cursor: pointer;
}

.right {
	color: white;
}

.right .nav{
	position: fixed;
	top: 0;
	right: 60px;
}

.right .nav li {
	margin-left: 15px;
	display: inline-block;
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
    width: 100%;
    height: 200px;
    margin-left: 180px;
    background-color: #f1f1f1;
    display: block;    
}
.footer-content {
	width: 800px;
	height: 150px;
	padding: 30px;
	margin: 30px !important;
}
#content{
	height: 100%;
}
#main-content {
	display: inline-flex;
}
#main-content1 {
	width: 600px;
}

#main-content2 {
	width: 600px;
}
.f1 {
	font-weight: bold;
	font-size: 1.5rem !important;
	color: #5f5f5f;
	display: inline;
	margin-right: 10px;
}
.faddr {
	margin-top: 30px;
}
.main-loginemp {
	width: 550px;
	height: 200px;
	display: inline-flex;
	padding:15px;
	border: 1px solid #ccc;
}
.main-calendar {
	width:550px;
	height: 300px;
	background-color: pink;
	margin-top: 30px;
}

.main-notice{
	width: 550px;
	height: 250px;
}
.main-approval {
	width: 550px;
	height: 250px;
	background-color: green;
	margin-top: 30px;
}

#emp-img {
	width: 150px;
	height: 160px;
}
#emp-info {
	width: 400px;
	height: 150px;
	padding: 30px;
}
#emp-info span:first-child{
	font-size: 1.8em !important;
}

#emp-info span:nth-child(1),#emp-info span:nth-child(2){
	font-size: 1.5em !important;
}

#emp-info button{
	width: 130px;
	height: 35px;
	border-radius: 5px;
	border:none;
	font-size: 1.1em;
}

#on{
	background-color: #073865;
	color: white;
	margin-top: 10px;
	margin-right: 20px;
	
}
#notili{
	width: 550px;
	height: 220px;
	border-collapse: collapse;
	border-top: 2px solid #ccc;
	border-bottom: 2px solid #ccc;
}
#notili th {
	text-align: center;
	border-bottom: 2px solid #ccc;
	height: 40px;
	font-weight: normal;
}
#notili td {
	text-align: center;
}
#allno{
	font-size: 1.3em;
}
#moreno {
	margin-left: 380px;
}
#empphoto{
	width:150px;
	height: 160px;
}
</style>

</head>

<body oncontextmenu="return false">

	<header class="header">
		<div class="left">
			<ul class="nav">
				<li><div id="logo-image" ></div></li>
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
					<li class="w3-bar-item w3-button" 
              value="./docinsert.do">기안하기</li>
					<li class="w3-bar-item w3-button" 
              value="">결재 진행함</li>
					<li class="w3-bar-item w3-button" 
              value="./waitdoclist.do">결재 대기함</li>
					<li class="w3-bar-item w3-button"
						  value="./completedoc.do">결재 완료함</li>
					<li class="w3-bar-item w3-button" 
              value="./refdoclist.do">참조문서함</li>
					<li class="w3-bar-item w3-button"
              value="./mydoclist.do">개인문서함</li>
					<li class="w3-bar-item w3-button"
               value="./tempdoc.do">임시문서함</li>
				</ul>
			</li>
			
			
			<li class="w3-bar-item nav1"><i class="fas fa-file-signature"></i>전자서명
				<ul class="nav-flyout">
				
					<li class="w3-bar-item w3-button"
						  value="./signlist.do">전자서명 관리</li>
					<li class="w3-bar-item w3-button"
						  value="./signinsert.do">전자서명 등록</li>
					<li class="w3-bar-item w3-button"
						  value="./signdraw.do">전자서명만들기</li>
		
				</ul>
			</li>

			<li class="w3-bar-item nav1"><i class="fas fa-thumbtack"></i> 공지사항
				<ul class="nav-flyout">
					<li class="w3-bar-item w3-button"
						value="./noticeList.do">공지사항</li>
					<li class="w3-bar-item w3-button" value="">공지사항</li>
				</ul>
			</li>

			<li class="w3-bar-item nav1"><i class="far fa-calendar"></i>일정관리
				<ul class="nav-flyout">
					<li class="w3-bar-item w3-button"
						value="#"><a href="./loadForm.do">일정관리</a></li>
					<li class="w3-bar-item w3-button" value="">일정관리</li>
				</ul>
			</li>

			<li class="w3-bar-item nav1"><i class="far fa-calendar-check"></i>예약
				<ul class="nav-flyout">
					<li class="w3-bar-item w3-button" value="#"><a href="./reservation.do">예약하기</a></li>
					<li class="w3-bar-item w3-button" value="./reservationist.do">예약목록</li>
				</ul></li>

			<li class="w3-bar-item nav1"><i class="far fa-file"></i>업무일지
				<ul class="nav-flyout">
					<li class="w3-bar-item w3-button" value="./worklogInsert.do">업무일지 작성</li>
					<li class="w3-bar-item w3-button" value="./worklogList.do">업무일지 조회</li>
				</ul>
			</li>

			<li class="w3-bar-item nav1"><i class="fas fa-sms"></i>채팅
				<ul class="nav-flyout">
					<li class="w3-bar-item w3-button" value="./chatOpen.do">채팅 시작</li>
					<!-- <li class="w3-bar-item w3-button" value="./socketOpen.do">채팅 시작</li> -->
				</ul></li>
			<c:if test="${emp.dept_no eq 10}">
				<li class="w3-bar-item nav1"><i class="fas fa-file"></i>양식함
					<ul class="nav-flyout">
						<li class="w3-bar-item w3-button" value="./formlist.do">양식목록</li>
						<li class="w3-bar-item w3-button" value="./forminsert.do">양식등록</li>
					</ul>
				</li>
			</c:if>
			
			<li class="w3-bar-item nav1"><i class="fas fa-users"></i>사원관리
				<ul class="nav-flyout">
					<li class="w3-bar-item w3-button "
						value="./insert_emp_form.do">사원등록</li>
					<li class="w3-bar-item w3-button "value="./empList.do">사원조회</li>
				</ul></li>
			<li class="w3-bar-item nav1"><i class="fas fa-id-badge"></i>부서관리
				<ul class="nav-flyout">
					<li class="w3-bar-item w3-button "
						value="./deptList.do">부서조회 및 관리</li>
				</ul></li>
		</ul>
	</article>
	<section id="content"style="margin-left: 230px; margin-top: 50px; padding: 50px;">

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

	<footer class="footer">
		<div class="footer-content">
			<span class="f1">회사소개</span>
			<span class="f1">약관</span>
			<span class="f1">개인정보취급방침</span> 
			<span class="f1">파트너</span> 
			<span class="f1">뉴스레터</span> 
			<span class="f1">리포트</span>
			<p class="faddr">주소: 서울특별시 금천구 가산디지털2로 00 </p>
			<p>사업자등록번호: 101-00-00000</p>
			<p>상호명: GOODEE</p>
		</div>
    </footer>
</body>