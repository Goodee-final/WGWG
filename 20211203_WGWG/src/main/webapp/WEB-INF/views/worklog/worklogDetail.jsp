<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String ctx = request.getContextPath(); //콘텍스트명 얻어오기.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업무일지 상세조회</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript" src="<%=ctx%>/SE/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script type="text/javascript">
var oEditors = [];
var template = '${template}';
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "ir1", 
          sSkinURI: "./SE/SmartEditor2Skin.html",  
          htParams : {
              bUseToolbar : true,             
              bUseVerticalResizer : true,     
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
                   
              }
          }, 
          fOnAppLoad : function(){
              oEditors.getById["ir1"].exec("PASTE_HTML", [template]);
          },
          fCreator: "createSEditor2"
      });
      
      //저장버튼 클릭시 form 전송
      $("#save").click(function(){
          oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
          $("#frm").submit();
      });    
});
</script>
<style type="text/css">
.container {
	margin: 0;
	width: 1200px;
	padding: 10px;
}
h1 {
	text-align: center;
}
.editor {
	width:100%;
}
#ir1 {
	margin: auto;
}
.fgroup {
	margin: 20px 0 20px 0;
	display: inline;
	width: 100%;
	height: 30px;
}
/* .writer {
	width: 85%;
	height: 30px;
	margin: 20px 10px 20px 10px;
	float: left;
} */
#save {
	float: right;
	width: 10%;
	height: 30px;
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 1rem;
	color: white;
	background-color: #073865;
	margin: 20px 10px 20px 10px;
}
hr {
	margin: 10px;
}

#btn {
		width: 100px;
		height: 30px;
		border: 1px solid #ddd;
		border-radius: 5px;
		font-size: 1rem;
		color: white;
		background-color: #073865;
		margin: 10px;
}
table{
	margin: 0;
	width: 90%;
	height: 500px;
	font-size: 1.5rem;
}
td, th{
	text-align: center;
	vertical-align: middle;
}
/* .table>thead>tr>th{
	vertical-align: middle;
} */
p{
	font-size: 1.5rem;
	margin: auto;
}
</style>
</head>
<body>
	<div class="container">
		<h1>업무일지 상세조회</h1>
<!-- 		<button id="btn" onclick="location.href='./worklogList.do'">목록 가기</button> -->		<input class="btn" type="button" value="글수정하기" onclick="location.href='./worklogModifyForm.do?worklog_no=${selectWorklog.worklog_no}'">
		<button type="button" class="btn" data-toggle="modal" data-target="#reply">댓글 달기</button>
		<input type="button" class="btn" value="전체글목록" onclick="history.back(-1)">	
		<table class="table table-hover">
			<thead>
            	<tr>
					<th>문서번호</th>
					<td>
						${selectWorklog.worklog_no}
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${selectWorklog.emp.emp_nm}</td>
				</tr>
				<tr>
					<th>등록일</th>
					<td>
						${selectWorklog.worklog_reg_dt}
					</td>
				</tr>
				<tr>
					<th style="vertical-align: middle;">내용</th>
					<td>
						${selectWorklog.worklog_content}
					</td>
				</tr>
			</table>
			
			
			<form action="#" method="post" name="frm">
			<input type="hidden" id="worklog_no" name="worklog_no">
			<div style="text-align: center;">
				<%-- <c:if test="${sessionScope.emp_no eq vo.emp_no}">
					<input class="btn" type="button" value="글삭제" onclick="location.href='./worklogDelete.do?no=${vo.worklog_no}'">
					<input class="btn" type="button" value="글수정" onclick="location.href='./worklogModifyForm.do?no=${vo.worklog_no}'">
				</c:if> --%>
				<c:if test="${sessionScope.emp_no eq selectWorklog.emp_no}">
					<input class="btn" type="button" value="글삭제" onclick="location.href='./worklogDelete.do?worklog_no=${selectWorklog.worklog_no}'">
					<input class="btn" type="button" value="글수정" onclick="location.href='./worklogModifyForm.do?worklog_no=${selectWorklog.worklog_no}'">
				</c:if>
								
			</div>
		</form>
	</div>
		
		<!-- Modal -->
<div class="modal fade" id="reply" role="dialog">
<div class="modal-dialog">
  
    <!-- Modal content-->
    <div class="modal-content">
    <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">답글 작성</h4>
    </div>
    <form action="" method="post" id="frmREply" class="form-margin">
		<div class="modal-body">
        	<div class="form-group">
         		<label>작성자</label>
         		<p>${sessionScope.emp_no}</p>
         	</div>
         	<div class="form-group">
         		<label>댓글 제목 : </label>
         		<input type="text" class="form-control" id="title" name="title">
         	</div>
         	<div class="form-group">
         		<label>댓글 내용 : </label>
         		<textarea rows="5" class="form-control" id="content" name="content">댓글을 작성해주세요.</textarea>
         	</div>
      	</div>
       <div class="modal-footer">
         <input type="hidden" name="worklog_no" value="${selectWorklog.worklog_no}">
         <input type="button" class="btn btn-success" value="답글작성" onclick="replyValue()">
         <input type="reset" class="btn btn-success" value="초기화">
         <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
       </div>
     </form>
    </div>
  </div>
</div>

<script type="text/javascript">
	function replyValue() {
		console.log('답글 submit');
		var frm = document.getElementById('frmREply');
		frm.action = './replyBoard.do';
		frm.submit();
	}

	function formProcess(req, worklog_no) {
		console.log(worklog_no);
		document.getElementById('worklog_no').value = worklog_no;
		const frm = document.frm;
		frm.action = req;
		frm.submit();
	}
</script>


</body>
</html>