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
  <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
  <jsp:include page="/WEB-INF/views/common/side2.jsp"></jsp:include>
	<!-- Page Content -->
	<div style="margin-left: 230px; padding:50px;">
		<div>
			<h1>서명관리</h1>
			<div>
			<c:forEach var="sign" items="${signList}" varStatus="status">
				<div>
					<P>서명${status.count}</P>
					<img src="<%=request.getContextPath()%>${sign.sign_img}" width="150px" height="150px">
					<p>등록일:${sign.sign_reg_dt}</p>
					<p>만료일:${sign.sign_exp_dt}</p>
					<button onclick="location.href=''">삭제하기</button>
				</div>
		
			</c:forEach>
			</div>
		</div>
		
	
	
</body>
</html>