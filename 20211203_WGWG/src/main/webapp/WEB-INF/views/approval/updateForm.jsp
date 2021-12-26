<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String ctx = request.getContextPath(); //콘텍스트명 얻어오기.
%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
<fmt:formatDate value="${now}" pattern="yyyyMM" var="docnum" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기안하기</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="./js/insertDoc.js"></script>
<script type="text/javascript" src="<%=ctx%>/SE/js/service/HuskyEZCreator.js" charset="utf-8"></script>
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
	width: 80px;
	text-align: center;
}

#liner {
	font-size: 1.1rem;
	width: 80px;
}

#empnm {
	width: 80px;
}

#nextbtn {
	margin-left: 285px;
}

.bttn {
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
	font-size: 3rem;
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

#modalcontent {
	border: 1px solid silver;
	float: left;
	width: 35%;
	height: 95%;
	overflow-y: auto;
}

#jstree {
	float: left;
	height: 300px;
}

.modal-dialog {
	overflow-y: initial !important
}

#modalwrap {
	height: 320px;
}

#linebox {
	float: right;
	width: 50%;
	height: 47%;
	overflow-y: auto;
	border: 1px solid silver;
	margin-bottom: 5px;
	font-size: 1rem;
}

#refbox {
	float: right;
	width: 50%;
	height: 46%;
	overflow-y: auto;
	border: 1px solid silver;
	font-size: 1rem;
}

#find {
	width: 30%;
	margin-bottom: 3px;
}

#plugins4_q {
	border-radius: 3px;
	border: 1px solid silver;
	width: 60%;
}

#selected {
	float: left;
	border: 1px solid silver;
	margin: 8px;
	width: 10%;
	height: 90%;
	text-align: center;
}

.addbtn {
	width: 60%;
	margin-top: 40px;
}

.removebtn {
	width: 60%;
	margin-bottom: 10px;
}

.editor {
	margin-left: 73px;
	margin-top: 30px;
}

.selectbox {
	margin: 20px;
}

#formList {
	width: 200px;
	height: 30px;
}

#boxtitle {
	font-size: 1.5rem;
	padding: 5px;
	border-bottom: 1px solid silver;
}

.docheader{
	width: 1000px;
	margin: 0 auto;
}

#formnm{
	margin: 0 auto;
	width: 1000px;
	text-align: center;
}
</style>
<body>

	
		<div class="container">
			
			<div id="formnm">
			<label id="formname">${detaildoc.fvo.form_nm}</label>
			</div>
			<div class="docheader">
				<button type="button" id="lineselect" class="bttn" data-toggle="modal" data-target="#approverline">결재라인 지정</button>
				<input type="text" hidden="hidden" value="" name="app_line_no">
			</div>

			<div>
				<table class="docinfo" id="docinfotable">
					<tr id="tr1">
						<th>문서번호</th>
						<td id="AppDocNo">년월+${detaildoc.app_doc_no}</td>
						<c:forEach var="app" items="${appInfo}" varStatus="status">
							<td id="liner">결재자</td>
						</c:forEach>
					</tr>
					</tr>
					<tr id="tr2">
						<th>작성일자</th>
					<td id="AppDocRegDt">${detaildoc.app_doc_reg_dt}</td>
					<c:forEach var="app" items="${appInfo}" varStatus="status">
						<td rowspan=2 id="sign">
						<c:if test="${approver[status.index].signimg != null}" >
						<img src="img/sign/${approver[status.index].signimg}" style="width: 60px; height: 60px;">				
						</c:if>
						</td>
					</c:forEach>
					</tr>
					<tr>
						<th>부서</th>
						<td>${empinfo.dVo.dept_nm}</td>
					</tr>
				
					<tr id="tr3">
							<th>작성자</th>
					<td id="EmpNM">${empinfo.emp_nm}${empinfo.pVo.position_nm}</td>
					<c:forEach var="app" items="${appInfo}" varStatus="status">
						<td rowspan=2>
						<c:if test="${appInfo[status.index].emp_nm != null }">
						<p>${appInfo[status.index].pVo.position_nm}<br>${appInfo[status.index].emp_nm }</p>
						</c:if>
						</td>
					</c:forEach>
					</tr>
					<tr>
						<th>참조</th>
						<td colspan=5>John</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan=5>${detaildoc.app_doc_title}</td>
					</tr>
				</table>
			</div>
			<div class="editor">
				<textarea rows="20" cols="135" id="ir1" name="app_doc_content">${detaildoc.app_doc_content} </textarea>
			</div>
		
			<div id="nextbtn">
				<button type="button" class="bttn" onclick="">임시저장</button>
				<button type="submit" class="bttn" id="save" >재상신</button>
			</div>
			
		</div>
		


	<div class="modal" tabindex="-1" id="approverline" role="dialog"
		data-backdrop="static">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">결재라인 지정</h4>
				</div>

				<div class="modal-body">
					<div id="modalwrap">
						<div id="find">
							검색 : <input type="text" id="plugins4_q" value="" class="input">
						</div>
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
																<c:if
																	test="${plists.position_nm eq empline.pVo.position_nm && deptline.dept_no eq empline.dept_no}">
																	<li>${empline.emp_nm}<input type="text"
																		value="${empline.emp_no}" hidden="hidden" /></li>
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
						<div id="selected">
							<button class="addbtn" id="addline">▷</button>
							<button class="removebtn" id="removeline">◁</button>
							<button class="addbtn" id="addref">▷</button>
							<button class="removebtn" id="removeref">◁</button>
						</div>
						<div id="linebox">
							<p id="boxtitle">결재자</p>
							<div id="line"></div>
						</div>
						<div id="refbox">
							<p id="boxtitle">참조인</p>
							<div id="ref"></div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<input type="button" id="lineSaveBtn" class="btn btn-success" value="등록" data-dismiss="modal" onclick="submitLine()" />
					 <input type="reset" class="btn btn-default" value="초기화" onclick="resetLine()" />
					<button type="button" id="close" class="btn btn-default"
						data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>

	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script> -->
	<script>
	
	$(function () { 
		$('#jstree').jstree({ "plugins": ["search"] }); 
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

	
 	var empid = "";
 	var cntline = 0;
 	var cntref = 0;
 	var divvv = "";
 	var apprline = "";
 	var idarr = []; 
	var nmarr = [];
	
	$('#jstree').bind('select_node.jstree', function(event, data){
		var a = $('#jstree').jstree('get_selected',true);
		empid = data.instance.get_node(data.selected).text;

		console.log(a);
		console.log(empid);
	});
	
	
	$("#addline").click(function(){
		var newappdiv = document.createElement('div');
		newappdiv.innerHTML = empid;
		newappdiv.setAttribute("id","lineDiv"+cntline);
		cntline++;
		newappdiv.style.fontSize="1.2rem";
		newappdiv.style.padding="5px";
		newappdiv.style.width="100%";
		console.log(newappdiv);
		var line = document.getElementById("line"); // <p "id=p"> 태그의 DOM 객체 찾기 
		line.appendChild(newappdiv);
		console.log("cntline: " + cntline);
	});
	
	$(document).ready(function(){ 
		
		$('#line').click(function(e){
			divvv = e.target.getAttribute('id');
			document.getElementById(divvv).style.backgroundColor = "lightskyblue";

			console.log(divvv);
		});
		
		$('#ref').click(function(e){
			divvv = e.target.getAttribute('id');
			document.getElementById(divvv).style.backgroundColor = "gainsboro";

			console.log(divvv);
		});
	});
	
	
	$("#removeline").click(function(){
		var myDiv = document.getElementById(divvv);
		var parent = myDiv.parentElement; // 부모 객체 알아내기 
		parent.removeChild(myDiv); // 부모로부터 myDiv 객체 떼어내기
/* 		for(var i=idarr.length; i>0; i--){
			idarr = idarr.filter(function(item) {
			    return item !== idarr[i];
			});
			nmarr = nmarr.filter(function(item) {
			    return item !== nmarr[i];
			});
		} */
/* 		idarr.splice(cntline, 1);
		nmarr.splice(cntline, 1); */
		cntline--;
		console.log(cntline);
	});
	
	$("#addref").click(function(){
		var newappdiv = document.createElement('div');
		newappdiv.innerHTML = empid;
		newappdiv.setAttribute("id","refDiv"+cntref);
		cntref++;
		newappdiv.style.float="left";
		newappdiv.style.fontSize="1.2rem";
		newappdiv.style.padding="5px";
		newappdiv.style.width="30%";
		console.log(newappdiv);
		var line = document.getElementById("ref"); // <p "id=p"> 태그의 DOM 객체 찾기 
		line.appendChild(newappdiv);
		console.log(cntref);
	});
	
	$("#removeref").click(function(){
		var myDiv = document.getElementById(divvv);
		var parent = myDiv.parentElement; // 부모 객체 알아내기 
		parent.removeChild(myDiv); // 부모로부터 myDiv 객체 떼어내기
		cntref--;
		console.log(cntref);
	}); 
	
	function resetLine(){
		$('#line div').remove();
		$('#ref div').remove();
		$("#jstree").jstree("close_all");
		cntline = 0;
		cntref = 0;
	}
		
	$("#close").click(function(){

		$("#jstree").jstree("close_all");
	});
	
	
	
	function submitLine(){
		var idarr = []; 
		var nmarr = [];
		
		var docno = $('#AppDocNo').text();
		var regdate =$('#AppDocRegDt').text();
		var empinfo = $('#EmpNM').text();
		
		for(var i = 0; i < 4; i++){
			if(document.getElementById('lineDiv'+i) != null){
				var lineid = document.getElementById('lineDiv'+i).innerHTML.split('"');
				idarr[i] = lineid[3];
				console.log("lineid : " + idarr[i])
				var jbText = $('#lineDiv'+i).text();
				nmarr[i] = jbText;
				console.log('nmarr[i] : ' + nmarr[i]);
			}
		}
		console.log("idarr: "+idarr);

		

		$.ajax({
            type : "post",  
            url : "appline.do",// 컨트롤러에서 대기중인 URL 주소이다.
            dataType : "json",
            data : {
            	"arr":idarr
            },
            success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                console.log(res);
               	var linenoooo = res;
               	$("input[name=app_line_no]").attr("value", linenoooo);
               	
               	var varhtml1 = "";
        		var varhtml2 = "";
        		var varhtml3 = "";
               	
        		varhtml1 += "<th>문서번호</th>                                               ";
        		varhtml1 += "<td id='AppDocNo'>년월+"+docno+"</td>                           ";
        	                                                                   
        		varhtml2 += "<th>작성일자</th>                                      ";
        		varhtml2 += "<td id='AppDocRegDt'>"+regdate+"</td>                   ";
		                        
			
        		varhtml3 += "<th>작성자</th>                                                 ";
        		varhtml3 += "<td id='EmpNM'>"+empinfo+"</td>        ";
                                                                                     
        		for(var i=0; i<nmarr.length; i++){
	        		varhtml1 += "	<td id='liner'>결재자</td>                                   ";    			
	        		varhtml2 += "	<td id='sign' rowspan=2>이미지</td>                                   ";    			
	        		varhtml3 += "	<td id='empnm'>"+nmarr[i]+"</td>                                   ";    			
        		}
				
        		$("#tr1").html(varhtml1);
        		$("#tr2").html(varhtml2);
        		$("#tr3").html(varhtml3);
    		
        		
            },
            error : function(){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.")
            }
        });
		
		
// 		$('#approverline').modal('hide'); 
		
	}
	
	</script>

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
             //var data = data.replace(/[<][^>]*[>]/g, '');
             //console.log(data);
             var form_no = $('#formList option:selected').val();
             console.log(form_no);
             $("input[name=form_num]").attr("value", form_no);
             $("#frm").submit();
         });
   });
   </script>

</body>
</html>