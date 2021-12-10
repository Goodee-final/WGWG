<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <jsp:include page="/WEB-INF/views/common/side2.jsp"></jsp:include>
  <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<!-- Page Content -->
	<div style="margin-left: 230px; padding:50px;">
		<div>
			<h1>서명관리</h1>
			<div>
			<c:forEach var="sign" items="${signList}" varStatus="status">
				<div>
					<P>서명${status.count}</P>
					<img src=<spring:url value='/img/sign/sponge.png'/> width="300px" height="300px">
					<button>상세보기</button>
				</div>
		
			</c:forEach>
			</div>
		</div>
		<img src="./img/sign/signature.png" width="300px" height="300px">
		<img src="../img/sign/signature.png" width="300px" height="300px">
		<img src="<spring:url value='/img/sign/signature.png'/>" width="300px" height="300px">
		<img src="img/sign/sponge.png" width="300px" height="300px">
		<img src="img/sign/signature.png" width="300px" height="300px">
	</div>
</body>
</html>