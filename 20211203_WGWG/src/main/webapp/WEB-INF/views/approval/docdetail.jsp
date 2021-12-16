<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재문서 상세화면</title>
</head>
<body>

	<table>
		<tbody>
			<tr>
				<th>문서번호</th>
				<td>${doc.app_doc_no}</td>

			</tr>
			<tr>
				<th>작성일자</th>
				<td>${doc.app_doc_reg_dt}</td>
			</tr>
			<tr>
				<th>부서</th>
				<td>부서가져오기(emp)</td>

			</tr>
			<tr>
				<th>작성자</th>
				<td>작성자 가져오기(emp)</td>
			</tr>
			
		</tbody>
	</table>

		참조:참조리스트가져오기 ${doc.app_ }


</body>
</html>