<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기안하기</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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

#title {
	border: 1px solid #ddd;
	font-size: 1.3rem;
	width: 850px;
}

#title:focus {
	outline: 1px solid #073865;
}

#sign {
	text-align: center;
}

#line {
	font-size: 1.1rem;
	width: 80px;
}

#nextbtn {
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

#formname {
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

.editor {
	margin-left: 73px;
	margin-top: 30px;
}

#modalcontent{
	border: 1px solid silver;
	float: left;
	width: 30%;
	height: 95%;
    overflow-y: auto;
}

#jstree {
	float: left;
	height: 300px;
}

.modal-dialog{
    overflow-y: initial !important
}

#modalwrap{
	height: 320px;
}

#line {
	float: right;
	width: 58%;
	height: 47%;
	overflow-y: auto;
	border: 1px solid black;
	margin-bottom: 5px;
}

#ref {
	float: right;
	width: 58%;
	height: 46%;
	overflow-y: auto;
	border: 1px solid black;
}

#find{
	width: 30%;
	margin-bottom: 3px;
}

#plugins4_q{
	border-radius: 3px;
	border: 1px solid silver;
	width: 60%;
}

#selected{
	float:left;
	border: 1px solid silver;
	margin: 8px;
	width: 10%;
	height: 90%;
}

</style>
<body>
   
      <div class="container" >
         <h1>기안하기</h1>
         <p>결재문서 작성하기</p>
         <hr>
         <div>
            <button id="formselect" onclick="location.href='./formlist.do'">양식 선택하기</button>
            <button type="button" id="lineselect" class="btn btn-primary" data-toggle="modal" data-target="#approverline">결재라인 지정</button>
            <label id="formname">지출결의서</label>
         </div>
      <form action="./docinsert.do" method="post">
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
         <textarea rows="20" cols="135" id="ir1"></textarea>
         </div>
         <div id="nextbtn">
         <button type="button" id="btn" onclick="stopdoc()">임시저장</button>
         <input type="submit" id="btn" onclick="location.href='./appline.do'" value="상신" />
         <button type="button" id="btn" onclick="stopdoc()">기안취소</button>
         </div>
      </form>
   </div>
   
   
   <div class="modal bs-example-modal-lg" tabindex="-1" id="approverline" role="dialog" data-backdrop="static">
      <div class="modal-dialog modal-lg">

         <!-- Modal content-->
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title">결재라인 지정</h4>
            </div>

            <div class="modal-body">
            <div id="modalwrap">
            <div id="find">검색할 사원 : <input type="text" id="plugins4_q" value="" class="input"></div>
               <div id="modalcontent">
                  <div id="jstree">
                     <!-- in this example the tree is populated from inline HTML -->
                     <ul>
                        <c:forEach var="deptline" items="${deptlists}">
                           <li>${deptline.dept_nm}
                              <ul>
                                 <c:forEach var="plists" items="${plists}">
                                       <li>${plists.position_nm}
                                       	  <ul>
                                       	  <c:forEach var="empline" items="${emplists}">
                                       	  <c:if test="${plists.position_nm eq empline.pVo.position_nm && deptline.dept_no eq empline.dept_no}">
                                       	  	<li>${empline.emp_nm}</li>
                                       	  </c:if>
                                       	  </c:forEach>
                                       	  </ul>
                                       </li>
                                 </c:forEach>
                              </ul>
                           </li>
                        </c:forEach>
                     </ul>
                  </div>
               </div>
               <div id="selected">으아아가</div>
               <div id="line">
                  dhkfkfkfkk
               </div>
               <div id="ref">
                  dhkfkfkfkk
               </div>
            </div>
           </div>
            <div class="modal-footer">
               <input type="button" class="btn btn-success" value="등록" onclick="replyValue()" />
               <input type="reset" class="btn btn-default" value="초기화" />
               <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
            </div>
         </div>
      </div>
   </div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
	<script>
	$(function () { 
		$("#jstree").jstree({ "plugins": ["search"] }); 
		var to = false; 
		$('#plugins4_q').keyup(function () {
			 if (to) { clearTimeout(to); 
			} to = setTimeout(function () {
				 var v = $('#plugins4_q').val();
				  $('#jstree').jstree(true).search(v); 
				}, 
				250); 
			}); 
		});
	</script>
</body>
</html>