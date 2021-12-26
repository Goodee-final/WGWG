<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/paging.css" >
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	#searchWord {
		display: inline-block;
		width: 300px;
	}
	
	#modal_btn{
		width: 80px;
	}
</style>
<script type="text/javascript" src="./js/paging.js"></script>
<script type="text/javascript">
$(".selectRow").click(function(){
	var tr = $(this);
	var td = tr.children();
	var deptnoVal = td.eq(0).text();
	
	console.log(deptnoVal);
	
	$("#content").load("./updateDeptForm.do?dept_no="+deptnoVal);
	});
	
	$("#newDept").click(function(){
		$("#content").load("./newDeptForm.do);
	});
</script>
</head>
<body>
<div class="container" style="margin-left:50px;">
<h2 id="deptpaging">부서목록</h2>
<input type="search" class="form-control" name="searchWord" id="searchWord" value="${paging.searchWord}" placeholder="검색할 부서 이름을 입력해주세요.">
  <input type="button" class="btn" value="검색" onclick="deptListCnt()">
  <table class="table table-hover">
    <thead>
      <tr>
        <th>부서번호</th>
        <th>부서명</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="deptList" items="${deptList}">
    	<tr class="selectRow" style="cursor: pointer;">
          <td>${deptList.dept_no}</td>
          <td>${deptList.dept_nm}</td>
        </tr>
    </c:forEach>
    </tbody>
  </table>
  <button class="btn" id="newDept" name="newDept">부서 등록</button>
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