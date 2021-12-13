<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@500&display=swap" rel="stylesheet">
<style type="text/css">

	html, body {
		margin: 0;
		padding: 0;
	}
	
	a {
		text-decoration: none;
		width: max-content;
		height: max-content;
	}
	ul{
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
	
	#logo-image{
		width: 200px;
		height: 45px;
		background-image: url("./img/logo.png");
		background-color: white;
		background-repeat: no-repeat;
		background-position: center;
		background-size: cover;
		margin: 0 auto;
	}
	
	.nav li{
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
    	height:35px;
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
</style>
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
					<div class="nav-icon" id="logout-img" onclick="location.href='./logout.do'"></div>
				</li>
				<li>
					<div class="nav-icon"><a href="./loginForm.do">로그인</a></div>
				</li>
			</ul>
		</div>
	</div>
</body>