<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/sign/signside.jsp"></jsp:include>
	<!-- Page Content -->
	<div style="margin-left: 18%">

		<div>
			<h1 style="margin: 50px;">서명관리</h1>
			
			<div>
			<c:forEach var="sign" items="${signList}" varStatus="status">

				<p>${sign.sign_img}</p>
				<div>
					<P>서명${status.count}</P>
					<img src="${sign.sign_img}" width="300px" height="300px">
					<button>상세보기</button>
				</div>
		
			</c:forEach>
			</div>
			
			<div style="background: url('images/signature.png'); width: 300px; height: 300px;">
			<div style="background: url('/20211203_WGWG/src/main/webapp/img/sponge.png'); width: 300px; height: 300px;">
			</div>
				<img src="images/signature.png" width="300px" height="300px">
				<img  src="C:\Users\Sanghun\git\WGWG\20211203_WGWG\src\main\webapp\img\signature.png" width="300px" height="300px">
				<img  src="/20211203_WGWG/src/main/webapp/img/signature.png" width="300px" height="300px">
		</div>
</body>
</html>