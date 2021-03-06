<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<script src="https://kit.fontawesome.com/d42fd504d6.js" crossorigin="anonymous"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		$("#result").load("data.php");

	});
</script>

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
	color: #073865;
	font-size: 16px;
}

.nav-flyout li {
	background-color: whitesmoke;
}

.nav-flyout li:hover>a {
	color: #107EE6;
}

.w3-sidebar>ul li:hover>a {
	color: #107EE6;
}

.w3-sidebar>ul li:hover>i {
	color: #107EE6;
}

.w3-sidebar>ul>li>a {
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
	<!-- Sidebar -->
	<!--  w3-light-grey -->
	<div class="w3-sidebar w3-bar-block"
		style="width: 180px; background-color: white; border-right: 2px solid #073865; border-left: 2px solid #073865; margin-left: 150px;">
		<ul>
			<li class="w3-bar-item nav1"><i class="fas fa-file-signature"></i><a href="#">????????????</a>
				<ul class="nav-flyout">
					<li class="li-btn"><button class="w3-btn w3-blue w3-round btn">????????????</button></li>
					<li><a href="./signlist.do"
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;???????????? ??????</a></li>
					<li><a href="./signinsert.do"
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;???????????? ??????</a></li>
					<li><a href="./signdraw.do"
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?????????????????????</a></li>
					<li><a href="#" 
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?????? ?????????</a></li>
					<li><a href="#" 
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?????? ?????????</a></li>
					<li><a href="./completedoc.do" 
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?????? ?????????</a></li>
					<li><a href="#" 
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;???????????????</a></li>
					<li><a href="#" 
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;???????????????</a></li>
					<li><a href="#" 
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;???????????????</a></li>
				</ul></li>
				
			<li class="w3-bar-item nav1"><i class="fas fa-business-time"></i><a href="#">????????????</a>
				<ul class="nav-flyout">
					<li><a href="#" 
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;????????????</a></li>
					<li><a href="./signdraw.do"
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;????????????</a></li>
				</ul></li>
				
			<li class="w3-bar-item nav1"><i class="fas fa-thumbtack"></i> <a href="#">????????????</a>
				<ul class="nav-flyout">
					<li><a href="./noticeList.do" 
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;????????????</a></li>
					<li><a href="./signdraw.do"
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;????????????</a></li>
				</ul></li>

			<li class="w3-bar-item nav1"><i class="far fa-calendar"></i> <a href="#">????????????</a>
				<ul class="nav-flyout">
					<li><a href="./loadForm.do" 
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;????????????</a></li>
					<li><a href="./signdraw.do"
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;????????????</a></li>
				</ul></li>

			<li class="w3-bar-item nav1"><i class="far fa-calendar-check"></i><a href="#">????????????</a>
				<ul class="nav-flyout">
					<li><a href="#" 
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;????????????</a></li>
					<li><a href="./signdraw.do"
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;????????????</a></li>
				</ul></li>

			<li class="w3-bar-item nav1"><i class="far fa-file"></i><a href="#">????????????</a>
				<ul class="nav-flyout">
					<li>
						<a href="./worklogInsert.do" class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;???????????? ??????</a>
					</li>
					<li>
						<a href="./worklogListMy.do" class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;????????? ???????????? ??????</a>
					</li>
					<li>
						<a href="./worklogListDept.do" class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;????????? ???????????? ??????</a>
					</li>
				</ul>
			</li>
				
			<li class="w3-bar-item nav1"><i class="fas fa-sms"></i><a href="#">??????</a>
				<ul class="nav-flyout">
					<li><a href="#" 
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;??????</a></li>
					<li><a href="./signdraw.do"
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;??????</a></li>
				</ul>
			</li>
			<li class="w3-bar-item nav1"><i class="fas fa-sms"></i><a href="#">?????????</a>
				<ul class="nav-flyout">
					<li><a href="./formlist.do" 
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;????????????</a></li>
					<li><a href="./forminsert.do"
						class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;????????????</a></li>
				</ul>
			</li>
			<li class="w3-bar-item nav1"><i class="fas fa-users"></i><a href="#">????????????</a>
            <ul class="nav-flyout">
               <li><a href="./insert_emp_form.do" 
                  class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;????????????</a></li>
               <li><a href="./signdraw.do"
                  class="w3-bar-item w3-button w3-hover-blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;????????????</a></li>
            </ul>
         </li>
		</ul>
	</div>