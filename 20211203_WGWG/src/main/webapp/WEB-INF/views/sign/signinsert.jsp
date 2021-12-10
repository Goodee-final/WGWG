<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서명 등록 화면</title>
<style type="text/css">
	.flex-box{
		display: flex;
		justify-content: center;
		align-items: flex-end;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/common/side2.jsp"></jsp:include>
	<!-- Page Content -->
	<div style="margin-left: 230px; padding:50px;">
		<h1 >전자서명 등록</h1>

		<table >
			<tr>
				<td>
					<p>유의 사항</p>
				</td>
				<td>
					<p>전자서명은 최대 3개까지 등록 가능 합니다.</p>
					<p>확장자는 이미지 파일(.png)만 업로드 가능합니다.</p>
					<p>용량은 5MB를 초과 할 수 없습니다.</p>
				</td>
			</tr>
			<tr>
				<td>
					<p>기본 이미지</p>
				</td>
				<td>
					<img src="img/sign/approve.PNG" width="75px" height="75px">
				</td>
			</tr>
			<tr>
				<td>
					<p>등록된 결재 이미지</p>
				</td>
				<td class="flex-box">
					<img alt="" src="" width="100px" height="100px">
					<input type="file">
				</td>
			
			</tr>
		</table>
	</div>
</body>
</html>