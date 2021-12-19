<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">


<title>전자 서명 관리</title>
<style type="text/css">
td {
	padding: 35px;
}


</style>
</head>
<body>

	<!-- Page Content -->
	<div>
		<div>
			<h1>서명관리</h1>
			<div>
				<c:if test="${empty signList}">

					<p style="margin-top: 50px;">등록된 전자서명이 없습니다.</p>
					<button class="btn btn-primary" id="move-btn1"
						onclick="location.href='./'">전자서명 등록</button>
				</c:if>

				<c:if test="${!empty signList}">
					<c:set var="i" value="0" />
					<c:set var="j" value="5" />

					<table>
						<tbody>
							<c:forEach var="sign" items="${signList}" varStatus="status">

								<c:if test="${i%j == 0 }">
									<tr>
								</c:if>
								<td style="padding: 35px;">
									<P>서명${status.count}</P> 
									<img src="img/sign/${sign.sign_img}" width="150px" height="150px">
									<p>등록일:${sign.sign_reg_dt}</p>
									<p style="color: red">만료일:${sign.sign_exp_dt}</p>
									<button class="btn btn-primary"
										onclick="location.href='./signdelete.do?sign_no=${sign.sign_no}'">삭제하기</button>
								</td>
								<c:if test="${i%j == j-1 }">
									</tr>
								</c:if>
								<c:set var="i" value="${i+1 }" />


							</c:forEach>
						</tbody>
					</table>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>