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
<div class="container">
  <h2 id="emppaging">사원목록</h2>
  <select id="searchBy" class="form-control">
  	<option value=1>사원번호</option>
  	<option value=2>이름</option>
  	<option value=3>부서</option>
  </select>
  <input type="search" class="form-control" id="searchWord" placeholder="검색 내용을 입력해주세요.">
  <table class="table table-hover">
    <thead>
      <tr>
        <th>부서</th>
        <th>사원번호</th>
        <th>이름</th>
        <th>직급</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="empList" items="${empList}">
    	<tr>
          <td>${empList.dVo.dept_nm}</td>
          <td>${empList.emp_no}</td>
          <td>${empList.emp_nm}</td>
          <td>${empList.pVo.position_nm}</td>
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