<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String ctx = request.getContextPath(); //콘텍스트명 얻어오기.
%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyyMM" var="docnum" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재문서 상세화면</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="./js/insertDoc.js"></script>
<script type="text/javascript" src="<%=ctx%>/SE/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
var template = '${template}';
$(function(){
	if($('#ir1').length > 0){
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
	}
});
</script>
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
	text-align: center;
	font-size: 1.3rem;
	width: 80px;
}

#empnm {
	width: 80px;
}

#nextbtn {
	display:flex;
	padding:10px 100px;;
	justify-content: center;
	align-items: center;
}

.btn {
	width: 120px;
	height: 35px;
	border-radius: 5px;
	border: 1px solid #ddd;
	background-color: #073865;
	margin-top: 20px;
	margin-left: 100px;
	color: white;
}

.listbtn {
	height: 30px;
	border-radius: 5px;
	border: 1px solid #ddd;
	background-color: #073865;
	margin-left: 900px;
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

#formnm {
	margin: 0 auto;
	font-size: 3rem;
	text-align: center;
	margin-bottom: 10px;
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

#myModal {
	height: 600px;
}

#sign-td {
	padding: 25px;
	border: 0px;
}

.signImg {
	width: 75px;
	height: 75px;
	border: 1px solid #ddd;
}

.signImg:hover {
	border: 1px solid red;
}

.skyblue {
	border: 2px solid red;
}

#reason {
	margin-top: 20px;
	display: none;
}

#doccont{
	margin: 0 auto;
	width: 1000px;
}

#doccontents{
	margin-top: 20px;
}

.icon-box{
	display: flex;
	justify-content:space-evenly;
	align-items: center;
}
.icon-box1{
	display: flex;
	flex-direction: column;	
	justify-content: center;
	align-items: center;
}
.ref-modal{
	margin-top: 20px;
}
</style>
<body>

	<div class="container">
		<h1>결재문서상세보기</h1>
		<h2 style="display:inline;">${docBox}</h2>
		<button id="backto" class="listbtn">목록으로 돌아가기</button>
		<hr>
		<div id="doccont">
		<div id="formnm">
			<label id="formname">${detaildoc.fvo.form_nm}</label>
		</div>

		<div>
			<table class="docinfo">
				<tr>
					<th>문서번호</th>
					<td>${docnum}-${detaildoc.app_doc_no}</td>
						<c:forEach var="app" items="${appInfo}" varStatus="status">
							<td id="liner">결재자</td>
						</c:forEach>
					</tr>
				<tr>
					<th>작성일자</th>
					<td>${detaildoc.app_doc_reg_dt}</td>
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
				<tr>
					<th>작성자</th>
					<td>${empinfo.emp_nm}${empinfo.pVo.position_nm}</td>
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
					<td colspan=5><c:forEach var="name" items="${refName}"
							varStatus="status">
							<c:if test="${status.last}">
								 	#${name}&nbsp
								</c:if>
							<c:if test="${!status.last}">
									#${name},
								</c:if>
						</c:forEach></td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan=5>${detaildoc.app_doc_title}</td>
				</tr>
			</table>
		</div>

		<div id="doccontents">
				${detaildoc.app_doc_content}
		</div>
		
	</div>

		<c:if test="${docBox == '참조'}">
		<div id="nextbtn">	
			<button class="btn" id="btn-ref" class="btn-ref">피드백</button>
		</div>
			
			<!-- 피드백 Modal창 -->
			<div class="modal fade" id="myModal3" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">피드백</h4>
						</div>
						<div class="modal-body">

							<div class="icon-box">

								<div class="icon-box1">
									<i class="far fa-tired fa-3x" class="icon-ref" id="icon-ref"
										style="color: red"></i> <input type="radio" name="ref"
										value="fa-tired" />
								</div>

								<div class="icon-box1">
									<i class="far fa-frown-open fa-3x" class="icon-ref"
										id="icon-ref" style="color: orange"></i> <input type="radio"
										name="ref" value="fa-frown-open" />
								</div>


								<div class="icon-box1">
									<i class="far fa-meh fa-3x" class="icon-ref" id="icon-ref"
										style="color: #fff44f"></i> <input type="radio" name="ref"
										value="fa-meh" />

								</div>
								<div class="icon-box1">
									<i class="far fa-smile fa-3x" class="icon-ref" id="icon-ref"
										style="color: #90ee90"></i> <input type="radio" name="ref"
										value="fa-smile" />
								</div>

								<div class="icon-box1">
									<i class="far fa-grin-beam fa-3x" class="icon-ref"
										id="icon-ref" style="color: green"></i> <input type="radio"
										name="ref" value="fa-grin-beam" />
								</div>






							</div>
						</div>
						<div class="modal-footer ref-modal">
							<button id="feedbackSave" type="button" class="btn btn-default"
								data-dismiss="modal">저장</button>
						</div>

					</div>
				</div>
			</div>
		</c:if>
		
		<c:if test="${docBox == '결재대기'}">
		<div id="nextbtn">	
			<button class="btn" id="btn-approve" class="btn-app">승인</button>
			<button class="btn" id="btn-return" class="btn-app">반려</button>
		</div>

		<!-- 반려 Modal창 -->
		<div class="modal fade" id="myModal2" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">반려 사유</h4>
					</div>
					<div class="modal-body">

						<div>
							<textarea id="reason" rows="6" cols="70" name="reason" placeholder="반려사유를 적어주세요"></textarea>
						</div>

					</div>
					<div class="modal-footer">
						<button id="reasonSave" type="button" class="btn btn-default" data-dismiss="modal">저장</button>
					</div>
				</div>

			</div>
		</div>

		<!-- 승인 Modal -->
		<div class="modal fade" id="myModal1" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">전자서명 선택</h4>
					</div>
					<div class="modal-body">

						<div id="sign-td">
							<p>기본 이미지</p>
							<img class="signImg" src="img/sign/approve.PNG" value="0">
						</div>
						<hr>
						<c:set var="i" value="0" />
						<c:set var="j" value="4" />

						<table>
							<tbody>
								<c:if test="${!empty signlist}">
									<c:forEach var="sign" items="${signlist}" varStatus="status">
										<c:if test="${i%j == 0 }">
											<tr>
										</c:if>
										<td id="sign-td">
										<p>서명${status.count}</p>
										<img class="signImg" src="img/sign/${sign.sign_img}" value="${sign.sign_no}">
										</td>
										<c:if test="${i%j == j-1 }">
											</tr>
										</c:if>
										<c:set var="i" value="${i+1}" />
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
					<div class="modal-footer">
						<button id="signSave" type="button" class="btn" data-dismiss="modal">승인</button>
					</div>
				</div>

			</div>
		</div>
		</c:if>
		
		
	
	
		<div id="Box">
		<c:if test="${docBox eq '임시저장'}">
			<div id="nextbtn">
				<button class="btn" id="btn-update" >수정/재상신</button>
				<button id="btn-delete" class="btn" >삭제</button>
			</div>
		</c:if>
		
		
		<c:if test="${docBox eq '개인대기'}">
			<div id="nextbtn">
				<button class="btn" onclick="location.href='./appline.do'">기안취소</button>
			</div>
		</c:if>
		</div>

	</div>






</body>

<script>
	$(document).ready(function() {
		
		$("#btn-ref").click(function(e) {
			e.preventDefault();
			$("#myModal3").modal();
		});
		
		$("#btn-approve").click(function(e) {
			e.preventDefault();
			$("#myModal1").modal();
		});
		
		$("#btn-return").click(function(e) {
			e.preventDefault();
			$("#myModal2").modal();
		});

		$(".signImg").click(function(e) {
			console.log(1);
			$(".signImg").removeClass('skyblue');
			$(this).addClass('skyblue');
			var signNo = $(this).attr('value');
		});
		
		$("#signSave").click(function(){
			var signNo = $(".skyblue").attr('value');
			console.log(signNo);
			console.log(${detaildoc.app_doc_no});
			
			var sendData = {"signNo":signNo, "docNo":${detaildoc.app_doc_no}}
			console.log(sendData);
			
			$.ajax({
				type:"post",
				url:"./approve.do",
				data: sendData,
				success:function(data){
					var docBox = data["docBox"];
					var docno = data["docno"];
					console.log("docBox: "+ data["docBox"]);
// 					setTimeout(function() {
// 						alert("승인 되었습니다.");
// 						}, 1000);
					alert("승인 되었습니다.");
					console.log('데이터 왔다감');
					$('#content').load('./docdetail.do?docBox='+ docBox + "&docno="+docno);
// 					$('#content').load('./docdetail.do?')
				},
				error:function(jqXHR, textStatus, errorThrown){
					console.log("데이터 왔다갔다 실패!!");
					alert('오류 발생');
				}
			});
// 			location.href="./approve.do?signNo="+signNo+"&docNo="+${detaildoc.app_doc_no};
			
		});
		
		$("#btn-return").click(function() {
			$("#reason").css('display','block');
		});
		
		$("#reasonSave").click(function(){
			var reason = $('#reason').val();
			console.log(reason);
			location.href="./docReturn.do?reason="+reason+"&docNo="+${detaildoc.app_doc_no};
		});
		
		$("#feedbackSave").click(function(){
			
			var feedback = $(":input:radio[name=search_type]:checked").val();
			var sendData = {"feedback":feedback, "docNo":${detaildoc.app_doc_no}}
				$.ajax({
				type:"post",
				url:"./feedback.do",
				data:sendData,
				success:function(data){
					var tired = data["fa-tired"];
					var frown_open = data["frown-open"];
					var meh = data["meh"];
					var smile = data['smile'];
					var grin_beam = data['grim-beam'];
					console.log('tired : ' + tired + 'frown-open : ' + frown_open + 'meh : ' + meh +'smile : ' + smile +'grin-beam : ' + grin_beam );
				}
			});
		});
		
		$('#btn-update').click(function(){
			$('#content').load('./updateForm.do?docno=' + ${detaildoc.app_doc_no});
		});
		
		$("#btn-delete").click(function(){
		
			location.href="./docDelte.do?docno="+${detaildoc.app_doc_no};
		});
		
	});
	
	

</script>
</html>
