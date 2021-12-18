<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String ctx = request.getContextPath();    //콘텍스트명 얻어오기.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기안하기</title>
<script type="text/javascript" src="<%=ctx %>/SE/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
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
	.editor{
		margin-left: 73px;
		margin-top: 30px;
	}
	.modal_wrap{
        display: none;
        width: 500px;
        height: 500px;
        position: absolute;
        top:50%;
        left: 50%;
        margin: -250px 0 0 -250px;
        background:#eee;
        z-index: 2;
    }
    .black_bg{
        display: none;
        position: absolute;
        content: "";
        width: 100%;
        height: 100%;
        background-color:rgba(0, 0,0, 0.5);
        top:0;
        left: 0;
        z-index: 1;
    }
    .modal_close{
        width: 26px;
        height: 26px;
        position: absolute;
        top: -30px;
        right: 0;
    }
    .modal_close> a{
        display: block;
        width: 100%;
        height: 100%;
        background:url(https://img.icons8.com/metro/26/000000/close-window.png);
        text-indent: -9999px;
    }
    .selectbox {
    	margin: 20px;
    }
    #formList {
    	width: 200px;
    	height: 30px;
    }
</style>
<body>
	<form action="./docinsert.do" method="post">
		<div class="container" >
			<h1>기안하기</h1>
			<p>결재문서 작성하기</p>
			<hr>
			<div>
				<select id="formList" name="formList">
					<option value="">양식 선택하기</option>
					<c:forEach var="form" items="${formList}">
						<option value="${form.form_no}">${form.form_nm}</option>
					</c:forEach>
				</select>
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
			<div class="editor">
			<textarea rows="20" cols="135" id="ir1" name="content"></textarea>
			</div>
			<div id="nextbtn">
				<button id="btn" onclick="location.href=''">임시저장</button>
				<button type="submit" id="save">상신</button>
				<button id="btn" onclick="location.href=''">기안취소</button>
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
          		<textarea rows="5" class="form-control" id="content"></textarea>
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
	  $(function(){
		  $('#formList').change(function(){
			  let form_no = this.value;
			  $.ajax({
	                type : "GET",            // HTTP method type(GET, POST) 형식이다.
	                url : "formselect.do",// 컨트롤러에서 대기중인 URL 주소이다.
	                data : {
	                	"form_no":form_no
	                },
	                contentType : "charset:UTF-8",
	                /* dataType : "string",// Json 형식의 데이터이다. */
	                success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
	                    // 응답코드 > 0000
	                    console.log(res);
	                   	var sHTML = res;
	                   	oEditors.getById["ir1"].exec("SET_IR", [sHTML]);
	                },
	                error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
	                    alert("통신 실패.")
	                }
	            });
		  });
	  });
   
   function replyValue(){
	   console.log('답글 submit');
	   var frm = document.getElementById('frmReply');
	   frm.action = './replyBoard.do';
	   frm.submit();
   }
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
            	 oEditors.getById["ir1"].exec("PASTE_HTML", [""]);
             },
             fCreator: "createSEditor2"
         });
         
         $("#save").click(function(){
             oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
             var content = document.getElementById("ir1").value;
             $("#frm").submit();
         });
   });
   </script>
</body>
</html>