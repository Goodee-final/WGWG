<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기안하기</title>
</head>
<style type="text/css">

	.docinfo {
		margin: 0 auto;
		width: 1000px;
		border-collapse: collapse;
	}
	th, td {
	  padding: 8px;
	  text-align: left;
	  border: 1px solid #ddd;
	}
	th {
		background-color: #eee;
		text-align: center !important;
	}
	#title{
		border: 1px solid #ddd;
		font-size: 0.9rem;
		width: 850px;
	}
	#title:focus {
		outline:1px solid #073865;
	}
	#sign{
		text-align: center;
	}
	
	#backbtn {
		width: 150px;
		height: 35px;
		border-radius: 5px;
		border: 1px solid #ddd;
		background-color: #073865;
		margin-top: 20px;
		color: white;
		margin-left: 920px;
	}
</style>
<body>
	<form action="./docinsert.do" method="post">
		<div class="container" >
			<h1>기안하기</h1>
			<p>결재문서 작성하기</p>
			<hr>
			<div>
			
			</div>
			<div>
				<table class="docinfo">
					<tr>
						<th>문서번호</th>
						<td>John</td>
						<th style="font-size: 0.8rem; width: 80px;">1차 결재자</th>
						<th style="font-size: 0.8rem; width: 80px;">2차 결재자</th>
						<th style="font-size: 0.8rem; width: 80px;">3차 결재자</th>
						<th style="font-size: 0.8rem; width: 80px;">최종 결재자</th>
					</tr>
					<tr>
						<th>작성일자</th>
						<td>John</td>
						<td rowspan=2 id="sign"><img src="./img/sign/sponge.png" width=60 height=60></td>
						<td rowspan=2 id="sign"><img src="./img/sign/sponge.png" width=60 height=60></td>
						<td rowspan=2 id="sign"><img src="./img/sign/sponge.png" width=60 height=60></td>
						<td rowspan=2 id="sign"><img src="./img/sign/spong.png" width=60 height=60></td>
					</tr>
					<tr>
						<th>부서</th>
						<td>John</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>John</td>
						<td id="sign">John</td>
						<td id="sign">John</td>
						<td id="sign">John</td>
						<td id="sign">John</td>
					</tr>
					<tr>
						<th>참조</th>
						<td colspan=5>John</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan=5><input id="title" type="text" placeholder="제목을 입력해주세요"/></td>
					</tr>
				</table>
			</div>
			<textarea rows="10" cols="80"></textarea>
		</div>
	</form>

</body>
</html>