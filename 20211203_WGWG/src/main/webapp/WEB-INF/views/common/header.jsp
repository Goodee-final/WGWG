<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<header class="header">
		<div class="left">
			<ul class="nav">
				<li><div onclick="location.href='index.jsp'" id="logo-image"></div></li>
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
