<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctx = request.getContextPath();    //콘텍스트명 얻어오기.
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript" src="<%=ctx %>/SE/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>

<style>
	#backbtn {
		width: 150px;
		height: 35px;
		border-radius: 5px;
		border: 1px solid #ddd;
		background-color: #073865;
		margin-top: 20px;
		color: white;
		
	}
	#save {
		width: 100px;
		height: 35px;
		border-radius: 5px;
		border: 1px solid #ddd;
		background-color: #073865;
		margin-top: 20px;
		margin-left: 750px;
		color: white;
	}
	#formcselect{
		width: 150px;
		height: 35px;
		border: 1px solid #ccc;
		margin-bottom: 10px;
	}
	#title{
		width: 935px;
		height: 40px;
		margin-bottom: 20px;
	}
	
</style>
</head>
<body>
	<div class="container">
		<h1 class="title">양식 등록</h1>
		<form id="frm" action="./insertform.do" method="post" >
			양식분류 <select name="formclassification" id="formcselect">
				<option>양식분류선택</option>
				<c:forEach items="${fclist}" var="list">
					<option value="${list.form_class_no}">${list.form_class_nm}</option>
				</c:forEach>
			</select>
			<br>	
	        양식제목 <input type="text" id="title" name="title"/>
	        <textarea rows="20" cols="135" id="ir1" name="content"></textarea>
			<p class="count"><span>0</span> / 40000</p>
			<input id="save" type="button" value="저장">
			<input type="button" id="backbtn" value="목록으로 돌아가기">
		</form>
	</div>
</body>
<script type="text/javascript">
var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "ir1", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "./SE/SmartEditor2Skin.html",  
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
                   
              }
          }, 
          fOnAppLoad : function(){
              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
              oEditors.getById["ir1"].exec("PASTE_HTML", [""]);
          },
          fCreator: "createSEditor2"
      });
      
      //저장버튼 클릭시 form 전송
      $("#save").click(function(){
          oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
          var formclassification = $("select[name=formclassification]").val();
          $("#frm").submit();
      });
      
      //양식 등록 시 문자수 지정
      setTimeout(function(){
    	  var ctnarea = document.querySelector("iframe").contentWindow.document.querySelector("iframe").contentWindow.document.querySelector(".se2_inputarea");
    	  ctnarea.addEventListener("keyup", function(e){
    		  var text = this.innerHTML;
    		  text = text.replace(/<br>/ig, "");
    		  text = text.replace(/&nbsp;/ig, "");
    		  text = text.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");
    		  
    		  var len = text.length;
    		  document.querySelector(".count span").innerHTML = len;
    		  
    		  if(len > 40000){
    			  alert("최대 40000 byte까지 입력 가능합니다.");
    		  }
    	  });
      }, 1000)

    	   $('#backbtn').click(function(){
    		   $('#content').load('./formlist.do');
    	   });

});

</script>
</html>