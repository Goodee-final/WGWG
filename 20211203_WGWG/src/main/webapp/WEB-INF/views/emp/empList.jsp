<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/paging.css" >
<script type="text/javascript" src="./js/paging.js"></script>
<script type="text/javascript">
	$(".selectRow").click(function(){
		var tr = $(this);
		var td = tr.children();
		var empnoVal = td.eq(1).text();
		
		console.log(empnoVal);
		
		$("#content").load("./updateEmpForm.do?emp_no="+empnoVal);
  	});
</script>
<style type="text/css">
	#searchBy{
		display: inline-block;
		width: 110px;
	}
	#searchWord {
		display: inline-block;
		width: 300px;
	}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="container" style="margin-left:50px;">
  <h2 id="emppaging">사원목록</h2>
  	<select name="searchBy" id="searchBy" class="form-control">
  	<c:if test="${paging.searchBy == '전체보기'}">
  		<option value="전체보기" selected>전체보기</option>
  		<option value="사원번호">사원번호</option>
  		<option value="이름">이름</option>
  		<option value="부서">부서</option>
  	</c:if>
  	<c:if test="${paging.searchBy == '사원번호'}">
  		<option value="전체보기" >전체보기</option>
  		<option value="사원번호" selected>사원번호</option>
  		<option value="이름">이름</option>
  		<option value="부서">부서</option>
  	</c:if>
  	<c:if test="${paging.searchBy == '이름'}">
  		<option value="전체보기" >전체보기</option>
  		<option value="사원번호">사원번호</option>
  		<option value="이름" selected>이름</option>
  		<option value="부서">부서</option>
  	</c:if>
  	<c:if test="${paging.searchBy == '부서'}">
  		<option value="전체보기" >전체보기</option>
  		<option value="사원번호">사원번호</option>
  		<option value="이름">이름</option>
  		<option value="부서" selected>부서</option>
  	</c:if>
  	
  </select>
  <input type="search" class="form-control" name="searchWord" id="searchWord" value="${paging.searchWord}" placeholder="검색 내용을 입력해주세요.">
  <input type="button" class="btn" value="검색" onclick="empListCnt()">
  <table class="table table-hover">
    <thead>
      <tr>
        <th>부서</th>
        <th>사원번호</th>
        <th>이름</th>
        <th>직급</th>
        <th>근무상태</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="empList" items="${empList}">
    	<tr class="selectRow" style="cursor: pointer;">
          <td>${empList.dVo.dept_nm}</td>
          <td>${empList.emp_no}</td>
          <td>${empList.emp_nm}</td>
          <td>${empList.pVo.position_nm}</td>
          <td>${empList.work_st}</td>
        </tr>
    </c:forEach>
      
    </tbody>
  </table>
  <input type="hidden" name="index" id="index" value="${paging.index}"><br>
  <input type="hidden" name="pageStartNum" id="pageStartNum" value="${paging.pageStartNum}"><br>
  <input type="hidden" name="listCnt" id="listCnt" value="${paging.listCnt}">
  <div class="center">
			<ul class="pagination">
				<li><a href="#" onclick="pageFirst()">&laquo;</a></li>
				<li><a href="#" onclick="pagePre(${paging.pageStartNum},${paging.pageCnt})">&lsaquo;</a></li>
				<!-- 페이지 번호 -->
				<c:forEach var="i" begin="${paging.pageStartNum}" end="${paging.pageLastNum}">
					<li><a onclick="pageIndex(${i})">${i}</a></li>
				</c:forEach>

				<li><a href="#" onclick="pageNext(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt})">&rsaquo;</a></li>
				<li><a href="#" onclick="pageLast(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt})">&raquo;</a></li>
			</ul>
		</div>
</div>
</body>
</html>