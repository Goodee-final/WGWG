<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>완료 문서함</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/approve.js" ></script> 
<script type="text/javascript" src="./js/paging.js"></script>
<script type="text/javascript">
	$(document).ready(function(){

		
	
// 		if(active == 2){
// 			$(location).attr('href','#menu2');
// 		}else{
// 			$(location).attr('href','#menu1');
// 		}
		var state = '완료';
		
		detailMove(state);
		
// 		search();

		$('.tog').click(function(){
			var active =  $('.active').attr('val');
			var tog = $(this).attr('val');
			
			var app_chk = $('#app_chk').val();
			var searchKeyword = $('#searchKeyword').val();
			var index = $('#index').val();
			console.log('index: '+index);
			var pageStartNum = $('#pageStartNum').val();
			var listCnt = $('#listCnt').val();
			
			
			if(tog != active){
				active = tog;
				index = 0;
			}
			
			$('#content').load('./completedoc.do?app_chk=' + app_chk + '&searchKeyword=' + searchKeyword + '&index=' + index + '&pageStartNum=' + pageStartNum + '&listCnt=' + listCnt + "&active=" + active);
		});

	});
	


</script>

<style>

.container{
	margin-left: 10px;
}

th, td {
	padding: 8px;
	text-align: center;
	border-bottom: 1px solid #ddd;
	width: 150px;
}

#search {
	float: right;
}

#searchbtn {
	width: 50px;
	height: 30px;
	border-radius: 5px;
	font-size: 1.3rem; border : 1px solid #ddd;
	background-color: #073865;
	color: white;
	margin-left: 5px;
	border: 1px solid #ddd
}

#inputsearch{
	border: 1px solid #ddd;
	font-size: 1.3rem;
}

#inputsearch:focus {
	outline:1px solid #073865;
}

.test{
		margin: 0 auto;
		width: 28%;
	}
	
</style>
</head>
<body>

	<div class="container">
		<h1 id="appChk" value="완료1" val="완료2">완료 문서함</h1>
		
		<br>
<!-- 		<form action="./mydoclist.do" method="post"> -->
			
			
			<c:if test="${paging.active != '2'}">
			<ul class="nav nav-pills" id="active" style="height: 18px;">
			
				<li class="active tog" val="1"><a data-toggle="pill" href="#menu1" style="font-size: 0.8rem;">상신</a></li>
				<li val="2" class="tog"><a data-toggle="pill" href="#menu2" style="font-size: 0.8rem;">송신</a></li>			
			
			<div id="search">
					<input type="text" placeholder="문서제목으로 검색" id="searchKeyword" name="title" value="${paging.searchkeyword}"> 
					<input type="button" id="searchbtn"value="검색" onclick="search();">
				</div>
			</ul>
			<hr>
			<div class="tab-content" style="margin-top: 20px;">

				<div id="menu1" class="tab-pane active">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>문서번호</th>
								<th>문서제목</th>
								<th>양식</th>
								<th>작성자</th>
								<th>상태</th>
								<th>기안일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="doc" items="${doclist1}" varStatus="status">
								<tr>
									<td>${doc.app_doc_no}</td>
									<c:set var="docno" value="${doc.app_doc_no}" />
									<td>${doc.app_doc_title}</td>
									<td>${doc.form_no}</td>
									<td>${doc.emp_no}</td>
									<td>${doc.app_doc_st}</td>
									<td>${doc.app_doc_reg_dt}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div id="menu2" class="tab-pane">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>문서번호</th>
								<th>문서제목</th>
								<th>양식</th>
								<th>작성자</th>
								<th>상태</th>
								<th>기안일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="doc" items="${doclist2}" varStatus="status">
								<tr>
									<td>${doc.app_doc_no}</td>
									<td>${doc.app_doc_title}</td>
									<td>${doc.form_no}</td>
									<td>${doc.emp_no}</td>
									<td>${doc.app_doc_st}</td>
									<td>${doc.app_doc_reg_dt}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

			</div>
			
			</c:if>
			
			
			<c:if test="${paging.active == '2'}">
			<ul class="nav nav-pills" id="active" style="height: 18px;">
			
				<li val="1" class="tog"><a data-toggle="pill" href="#menu1" style="font-size: 0.8rem;">상신</a></li>
				<li class="active tog" val="2"><a data-toggle="pill" href="#menu2" style="font-size: 0.8rem;">송신</a></li>			
			
				<div id="search">
					<input type="text" placeholder="문서제목으로 검색" id="searchKeyword" name="title" value="${paging.searchkeyword}"> 
					<input type="submit" id="searchbtn"value="검색">
				</div>
			</ul>
			<hr>
			<div class="tab-content" style="margin-top: 20px;">

				<div id="menu1" class="tab-pane">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>문서번호</th>
								<th>문서제목</th>
								<th>양식</th>
								<th>작성자</th>
								<th>상태</th>
								<th>기안일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="doc" items="${doclist1}" varStatus="status">
								<tr>
									<td>${doc.app_doc_no}</td>
									<c:set var="docno" value="${doc.app_doc_no}" />
									<td>${doc.app_doc_title}</td>
									<td>${doc.form_no}</td>
									<td>${doc.emp_no}</td>
									<td>${doc.app_doc_st}</td>
									<td>${doc.app_doc_reg_dt}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div id="menu2" class="tab-pane active">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>문서번호</th>
								<th>문서제목</th>
								<th>양식</th>
								<th>작성자</th>
								<th>상태</th>
								<th>기안일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="doc" items="${doclist2}" varStatus="status">
								<tr>
									<td>${doc.app_doc_no}</td>
									<td>${doc.app_doc_title}</td>
									<td>${doc.form_no}</td>
									<td>${doc.emp_no}</td>
									<td>${doc.app_doc_st}</td>
									<td>${doc.app_doc_reg_dt}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

			</div>
				
			</c:if>
			
			
			
			<div class="test">
				<!-- paging 처리 관련 값 -->
				<input type="hidden" name="index" id="index" value="${paging.index}">
				<input type="hidden" name="pageStartNum" id="pageStartNum"
					value="${paging.pageStartNum}"> <input type="hidden"
					name="listCnt" id="listCnt" value="${paging.listCnt}">
					<input type="hidden" name="app_chk" id="app_chk" value="완료"/>

				<div class="center">

					<ul class="pagination">

						<li><a href="#" onclick="pageFirst()">&laquo;</a></li>
						<li><a href="#"
							onclick="pagePre(${paging.pageStartNum},${paging.pageCnt})">&lsaquo;</a></li>

						<!-- 페이지 번호 -->
							<c:forEach var="i" begin="${paging.pageStartNum}"
							end="${paging.pageLastNum}" step="1">
							
							<c:if test="${paging.index+1 == i}">
							<li style="background: #eee;"><a style="background: #eee;" onclick="pageIndex(${i})">${i}</a></li>
							</c:if>
							<c:if test="${paging.index+1 != i}">
							<li><a onclick="pageIndex(${i})">${i}</a></li>
							</c:if>
						</c:forEach>

						<li><a href="#"
							onclick="pageNext(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt})">&rsaquo;</a></li>
						<li><a href="#"
							onclick="pageLast(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt})">&raquo;</a></li>

					</ul>

				</div>
			</div>
<!-- 		</form> -->
	</div>

</body>
</html>