<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기안하기</title>
</head>
<style type="text/css">

	.docinfo {
		margin: 0 auto;
		width: 1000px;
		border-collapse: collapse;
	}
	th, td {
		padding: 8px;
		text-align: left;
		border: 1px solid #ddd;
	}
	th {
		background-color: #eee;
		text-align: center !important;
	}
	#title{
		border: 1px solid #ddd;
		font-size: 1.3rem;
		width: 850px;
	}
	#title:focus {
		outline:1px solid #073865;
	}
	#sign{
		text-align: center;
	}
	
	#line{
		font-size: 1.1rem;
		width: 80px;
	}
	
	#nextbtn{
		margin-left: 200px;
	}
	
	#btn {
		width: 120px;
		height: 35px;
		border-radius: 5px;
		border: 1px solid #ddd;
		background-color: #073865;
		margin-top: 20px;
		margin-left: 100px;
		color: white;

	}
	
	#formselect {
		justify-content: space-between;
		width: 120px;
		height: 35px;
		border-radius: 5px;
		border: 1px solid #ddd;
		background-color: #073865;
		color: white;
		margin: 10px;
		margin-left: 70px;
	}
	
	#formname{
		justify-content: space-between;
		font-size: 3rem;
		margin-left: 150px;
	}
	
	#lineselect {
		justify-content: space-between;
		width: 120px;
		height: 35px;
		border-radius: 5px;
		border: 1px solid #ddd;
		background-color: #073865;
		color: white;
		margin: 10px;
		margin-left: 5px;
	}
	
</style>
<body>
	<form action="./docinsert.do" method="post">
		<div class="container" >
			<h1>기안하기</h1>
			<p>결재문서 작성하기</p>
			<hr>
			<div>
				<button id="formselect" onclick="location.href='./formlist.do'">양식 선택하기</button>
				<button id="lineselect" class="btn btn-primary" data-toggle="modal" data-target="#approverline">결재라인 지정</button>
				<label id="formname">지출결의서</label>
			</div>
			
			<div>
				<table class="docinfo">
					<tr>
						<th>문서번호</th>
						<td>년월+시퀀스</td>
						<c:forEach var="approver" items="${appline}">
						<th id="line">결재자</th>
						</c:forEach>
					</tr>
					<tr>
						<th>작성일자</th>
						<td>2021-12-15</td>
						<c:forEach var="approver" items="${appline}">
						<td rowspan=2 id="sign"><img src="./img/sign/sponge.png" width=60 height=60></td>
						</c:forEach>
					</tr>
					<tr>
						<th>부서</th>
						<td>${empinfo.dVo.dept_nm}</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${empinfo.emp_nm} ${empinfo.pVo.position_nm}</td>
						<c:forEach var="approver" items="${appline}">
						<td id="sign">John</td>
						</c:forEach>
					</tr>
					<tr>
						<th>참조</th>
						<td colspan=5>John</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan=5><input id="title" type="text" placeholder="제목을 입력해주세요"/></td>
					</tr>
				</table>
			</div>
			
			<textarea rows="10" cols="80"></textarea>
			<div id="nextbtn">
				<button id="btn" onclick="location.href='./appline.do'">임시저장</button>
				<button id="btn" onclick="location.href='./appline.do'">상신</button>
				<button id="btn" onclick="location.href='./appline.do'">기안취소</button>
			</div>
		</div>
	</form>

	
	   <!-- Modal -->
  <div class="modal bs-example-modal-lg" tabindex="-1" id="approverline" role="dialog" >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">결재라인 지정</h4>
        </div>
        <form action="" method="post" id="frmReply" class="form-margin">
        <div class="modal-body">
          	<div class="form-group">
          		<label>작성자</label>
          		<p></p>
          	</div>
          	<div class="form-group">
          		<label>제목</label>
          		<input type="text" class="form-control" id="title" name="title"/>
          	</div>
          	<div class="form-group">
          		<label>내용</label>
          		<textarea rows="5" class="form-control" id="content" name="content"></textarea>
          	</div>
          
        </div>
        <div class="modal-footer">
        	<input type="button" class="btn btn-success" value="등록" onclick="replyValue()"/>
        	<input type="reset" class="btn btn-default" value="초기화"/>
          	<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        </div>
        </form>
      </div>
      
    </div>
  </div>
   
   <script type="text/javascript">
   
   function replyValue(){
	   console.log('답글 submit');
	   var frm = document.getElementById('frmReply');
	   frm.action = './replyBoard.do';
	   frm.submit();
   }
   </script>




</body>
</html>