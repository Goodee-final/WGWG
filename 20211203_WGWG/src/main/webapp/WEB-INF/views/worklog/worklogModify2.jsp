<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String ctx = request.getContextPath(); //콘텍스트명 얻어오기.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업무일지 수정 화면</title>
<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript" src="<%=ctx %>/SE/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>

<script type="text/javascript">
var oEditors = [];
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
              oEditors.getById["ir1"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]);
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
	/* margin-left: 80px;
	padding-left: 100px; */
}
h1{
	text-align: center;
}
.editor {
	margin-left: 73px;
	margin-top: 30px;
}
.fgroup{
	margin: 20px 0 20px 0;
	display:inline;
	width: 1200px;
	height:30px;
}
#writer{
	width: 85%;
	height:30px;
	margin: 20px 10px 20px 10px;
	float:left;
}
#save{
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
hr{
	margin: 10px;
}
</style>
</head>
<body>


<div class="container">
<h1>업무일지 수정 화면</h1>
	<form action="./insertWL.do" method="post">
		<input type="hidden" id="emp_no" name="emp_no" value="${emp.emp_no}">
		
			<div class="fgroup">
				<!-- <label class="control-label col-sm-2" for="emp_nm">작성자 </label> -->
				<div id="writer">
				작성자  ${emp.emp_nm}
					<%-- <input type="text" class="form-control" id="emp_no" name="emp_no" value="${sessionScope.emp_no}"> --%>
				</div>
				<input type="submit" id="save" value="수정하기" onclick="validateForm()">
			</div>
			<hr>
		
			<div class="editor">
				<textarea rows="20" cols="135" id="ir1" name="worklog_content">${vo.worklog_content}</textarea>
			</div>
	
	</form>
</div>

</body>
</html>