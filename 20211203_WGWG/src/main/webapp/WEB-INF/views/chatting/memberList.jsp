<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 중인 사원들 목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<META HTTP-EQUIV="refresh" CONTENT="5">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
function openChatRoom(mem_id){
	var newWindow = open("/chatOpen.do?mem_id="+mem_id, "chat", "height=550px, width=400px, top=200px, left=200px, location, resizable=no");
}

</script>
<style type="text/css">
td{
	text-align: center;
	/* vertical-align: middle; */
}
</style>
</head>
<body>
	<!-- <form action="./chooseChatMember.do" method="post"> -->
		<!-- <h1>사이드 메뉴에서 채팅시작 눌렀을 때 나오는 로그인 중인 사원들 목록</h1> -->
		<div class="container">

			<%-- <hr>
			${sessionScope.loginList}
			<hr>
			${loginList}
			<hr> --%>

			<h2>접속 중인 사원</h2>
				
			    <input type="button" value="채팅종료하기" onclick="window.close()">

			<%-- <c:if test="${!empty loginEmp}"> --%>
			
			<c:if test="${!empty sessionScope.loginList}">
				<table class="table table-hover">
					<thead>
					</thead>
					
					<%-- <c:if test="${sessionEmp eq loginList}">
						<!-- 본인 정보를 가장 위에 보여주고 본인 제외한 접속 회원을 쭉 보여주고 싶은디.. -->
						</c:if> --%>
						<c:forEach var="ing" items="${sessionScope.loginList}">
						<tbody>
							<tr>
								<td style="vertical-align: middle;"><img id="empphoto" src="./img/${ing.photo}" style="width:50px; height:50px;"></td>
								<td style="vertical-align: middle;">${ing.emp_nm}</td>
								<td style="vertical-align: middle;">${ing.dVo.dept_nm}</td>
								<td style="vertical-align: middle;">${ing.pVo.position_nm}</td>
								<td style="vertical-align: middle;">
									<input type="hidden" value="${ing.emp_no}" name="mem_id" id="mem_id">
									<input type="submit" class="btn btn-primary" value="채팅" onclick=openChatRoom(mem_id)> 
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>

			<c:if test="${empty sessionScope.loginList}">
		접속중인 사원이 없습니다.
		</c:if>
		
		
		<%-- </c:if>
		<c:if test="${empty loginEmp}">
		로그아웃 되셨습니다.
		</c:if> --%>
		
		</div>
	<!-- </form> -->
</body>
</html>
