<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.list-group {
	width: 230px;
}

.alarm {
	width: 200px;
	height: 50px;
}

#icon {
	width: 10px;
	margin-right: 10px;
	font-size: 20px;
	text-align: center;
}

#content {
	width: 200px;
	height: 10px;
}

#title {
	font-size: 1.2rem;
	font-weight: bold;
	margin-top: 0;
	margin-bottom: 0;
}

#message {
	margin-top: 0;
	font-size: 1rem;
}

#date {
	margin-top: 12px;
	text-align: center;
	font-size: 0.8rem;
}

#delbtn {
	color: rgb(54, 54, 54);
	font-size: 20px;
	margin: 10px;
}

table p {
	margin-left: 5px;
}
</style>
<body>
	<div class="container">
		<div class="nav-icon" id="alert-img" title="#건의 알림이 있습니다."
			data-toggle="popover" data-placement="bottom" data-trigger="focus"
			data-content="신짱구 사원">
			<span class="badge">5</span>
			<div class="list-group">
				<a href="#" class="list-group-item">
					<div class="alarm">
						<table id="content">
							<tr style="height: 10px;">
								<td rowspan="2"><span id="icon"
									class="glyphicon glyphicon-circle-arrow-down"
									aria-hidden="true"></span></td>
								<td><p id="title">신짱구 사원</p></td>
								<td><p id="date">오늘</p></td>
							</tr>
							<tr>
								<td><p id="message">1건의 결재요청이 있습니다.</p></td>
							</tr>
						</table>
					</div>
				</a>
			</div>
		</div>
	</div>

	<script>
  $(document).ready(function(){
      $('[data-toggle="popover"]').popover();
  });
  </script>
</body>
</html>