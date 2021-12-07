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
		height: 120px;
		background-color: rgb(54, 69, 94) !important;
		margin: 0;
		padding: 0;
	}
	#logo {
		color: white;
		font-size: 1.7rem;
		font-family: 'Roboto Slab', serif;
		margin-top: 25px;
	}
	
	#logo-image{
		width: 70px;
		height: 70px;
		margin: 10px;
		background-image: url("");
		background-color: white;
		background-repeat: no-repeat;
		background-position: center;
		background-size: cover;
	}
	
	.nav li{
		float: left;
	}
	
	.left {
        float: left;
    }
  
    .right {
    	float: right;
    }
</style>
<body>
	<div class="header">
		<div class="left">
			<ul class="nav">
				<li><div id="logo-image">로고이미지</div></li>
				<li id="logo">GOODEE COMPANY</li>
			</ul>
		</div>
		<div class="right">
		
		</div>
	</div>
</body>