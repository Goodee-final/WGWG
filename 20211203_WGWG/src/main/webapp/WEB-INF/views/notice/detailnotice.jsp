<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기</title>
</head>
<style>
	h2 { text-align: center;}
  table { width: 100%;}
  textarea { width: 100%;}
 	#outter {
		display: block;
		width: 30%;
		margin: auto;
	}
</style>
<body>

<h2>상세정보</h2>
<br><br><br>
<div id="outter">
	<table border="1">
		<tr>
			<td>제목: ${vo.notice_title }</td>
		</tr>
		<tr>
			<td>
				작성자: ${vo.emp_no }
				<span style="float: right;">${vo.notice_reg_dt }</span>
			</td>
		</tr>
		<tr>
			<td><div class="content">${vo.notice_content }</div></td>
		</tr>
		<tr>
			<td>
				${vo.filename }
			</td>
		</tr>
	</table>
	
	<div style="float: right;">
		<input type="button" value="수정" onclick="location.href='./noticeupdate.do?notice_no=${vo.notice_no}'">
		<input type="button" value="삭제" onclick="noticedelete(${vo.notice_no})">
		<input type="button" value="글 목록" onclick="location.href='./noticeList.do';">
	</div>	 
</div>
</body>
<script>
	function noticedelete(notice_no) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href='./noticedelete.do?notice_no='+notice_no;
		}
	}	
</script>
</html>