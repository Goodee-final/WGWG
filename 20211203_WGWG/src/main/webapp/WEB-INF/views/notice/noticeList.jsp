<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이징 처리</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- bootstrap -->



<link rel="stylesheet" href="./css/paging.css">
<!-- 사용자 Css -->
<script type="text/javascript" src="./js/paging.js"></script>
<!-- 사용자 js -->
<style type="text/css">
	
	.content{
 		width: 1200px;
		padding: 0px 30px;
 	}
	.test{
		margin: 0 auto;
		width: 50%;
	}
	.btn-primary{
		border-color:rgb(54, 69, 94);
		background-color: rgb(54, 69, 94);
		margin: 5px;
		width: 120px;
	}
	.btn-primary:hover{
		background-color: rgb(54, 69, 94);
	}
	
</style>

</head>
<body>	

<div class="content">
		<div id="select">
			<span>
				<select class="btn btn-primary" id="listCount" name="listCount"	onchange="nchk()">
					<option value="5"
						<c:if test="${paging.listCnt == 5}">selected</c:if>>5줄 보기</option>
					<option value="10"
						<c:if test="${paging.listCnt == 10}">selected</c:if>>10줄 보기</option>
					<option value="15"
						<c:if test="${paging.listCnt == 15}">selected</c:if>>15줄 보기</option>
				</select>
			</span>
				<c:if test="${emp.position_no == 4}">
				<input type="button" class="btn btn-primary" value="글쓰기" style="float: right;" onclick="Cclick();">
				</c:if>	
			
				<c:if test="${emp.dept_no == 10}">
					<input type="button" class="btn btn-primary" value="회사글쓰기" style="float: right;" onclick="Pclick();">	
				</c:if>	
		</div><br>
		<form action="./noticeList.do" method="post" id="frmPaging">
			<select class="btn btn-primary" id="notice_chk" name="notice_chk" onchange="nchk()">
					<option value="모두보기"
						<c:if test="${paging.notice_chk eq '모두보기'}">selected</c:if>>모두보기</option>
					<option value="회사"
						<c:if test="${paging.notice_chk eq '회사'}">selected</c:if>>회사</option>
					<option value="10"
						<c:if test="${paging.notice_chk eq '10'}">selected</c:if>>사업지원팀</option>
					<option value="20"
						<c:if test="${paging.notice_chk eq '20'}">selected</c:if>>개발팀</option>	
					<option value="30"
						<c:if test="${paging.notice_chk eq '30'}">selected</c:if>>인사팀</option>	
					<option value="40"
						<c:if test="${paging.notice_chk eq '40'}">selected</c:if>>총무팀</option>	
					<option value="50"
						<c:if test="${paging.notice_chk eq '50'}">selected</c:if>>영업1팀</option>	
					<option value="60"
						<c:if test="${paging.notice_chk eq '60'}">selected</c:if>>영업2팀</option>	
					<option value="70"
						<c:if test="${paging.notice_chk eq '70'}">selected</c:if>>마케팅팀</option>	
					<option value="80"
						<c:if test="${paging.notice_chk eq '80'}">selected</c:if>>기획팀</option>	
					<option value="90"
						<c:if test="${paging.notice_chk eq '90'}">selected</c:if>>보안팀</option>					
			</select>
			
			 <input type="text" id="searchKeyword" name="searchKeyword" value="${paging.searchKeyword }" onkeypress="if(event.keyCode=='13'){event.preventDefault(); nchk();}" style="width:200px; height:30px;" placeholder="제목으로 검색" />
				<a href="#"  onclick="nchk();" class="btn btn-primary">검색</a>
		
		<div class="test">
		<!-- paging 처리 관련 값 -->
			<input type="hidden" name="index" id="index" value="${paging.index}">
			<input type="hidden" name="pageStartNum" id="pageStartNum"	value="${paging.pageStartNum}"> 
			<input type="hidden" name="listCnt" id="listCnt" value="${paging.listCnt}">

			<div class="center">
			
				<ul class="pagination">

					<li><a href="#" onclick="pageFirst()">&laquo;</a></li>
					<li><a href="#" onclick="pagePre(${paging.pageStartNum},${paging.pageCnt})">&lsaquo;</a></li>

					<!-- 페이지 번호 -->
					<c:forEach var="i" begin="${paging.pageStartNum}" end="${paging.pageLastNum}" step="1">
						<li><a onclick="pageIndex(${i})">${i}</a></li>
					</c:forEach>

					<li><a href="#" onclick="pageNext(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt})">&rsaquo;</a></li>
					<li><a href="#" onclick="pageLast(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt})">&raquo;</a></li>

				</ul>
				
			</div>
		</div>
		<!-- 몇개씩 보여줄 것인지  -->
		
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>no.</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${lists}">
						<tr>
							<td>${list.notice_no }</td>
							<td><a href="#" onclick="achk(${list.notice_no})">${list.notice_title}</a></td>
							<td>${list.emp_no }</td>
							<td>${list.notice_reg_dt}</td>
							<td>${list.notice_cnt }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			
	 </form> 
</div>
<script type="text/javascript">
function achk(no){
	$('#content').load("./detailnotice.do?notice_no="+no);
}
function Cclick(){
	$('#content').load("./noticeInsertForm.do");
}
function Pclick(){
	$('#content').load("./noticeInsertFormCompany.do");
}
</script>
</body>
</html>