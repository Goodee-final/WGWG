<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재문서 상세화면</title>
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

#myModal {
	height: 600px;
}

#sign-td{
	padding: 35px;
	border: 0px;

}

.signImg {
	width: 75px;
	height: 75px;	
	border: 1px solid #ddd;"
}

.signImg:hover {
	background: skyblue;
}

.skyblue{
	background: skyblue;
}
</style>
<body>

	<div class="container">
		<h1>결재문서상세보기</h1>

		<hr>
		<div>

			<label id="formname">${detaildoc.fvo.form_nm}</label>
		</div>

		<div>
			<table class="docinfo">
				<tr>
					<th>문서번호</th>
					<td>년월+${detaildoc.app_doc_no}</td>
					<c:forEach var="approver" items="${appline}">
						<th id="line">결재자</th>
					</c:forEach>
				</tr>
				<tr>
					<th>작성일자</th>
					<td>${detaildoc.app_doc_reg_dt}</td>
					<c:forEach var="approver" items="${appline}">
						<td rowspan=2 id="sign"><img src="./img/sign/sponge.png"
							width=60 height=60></td>
					</c:forEach>
				</tr>
				<tr>
					<th>부서</th>
					<td>${empinfo.dVo.dept_nm}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${empinfo.emp_nm}${empinfo.pVo.position_nm}</td>
					<c:forEach var="approver" items="${appline}">
						<td id="sign">John</td>
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

		<textarea rows="10" cols="80" readonly>
			${detaildoc.app_doc_content}
			</textarea>

		<%-- 			<c:if test="${docSt == '참조'}"> --%>

		<%-- 			</c:if> --%>
		<%-- 			<c:if test="${docSt == '결재대기'}"> --%>
		<div id="nextbtn">
			<!-- 			./appresult.do -->
			<button id="btn-approve">승인</button>
			<button id="btn-return" onclick="location.href='./'">반려</button>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">전자서명 선택</h4>
					</div>
					<div class="modal-body">


						<c:set var="i" value="0" />
						<c:set var="j" value="3" />

						<table>
							<tbody>
								<c:if test="${!empty signlist}">
									<c:forEach var="sign" items="${signlist}">
										<c:if test="${i%j == 0 }">
											<tr>
										</c:if>
										<td id="sign-td" >
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
						<button id="signSave" type="button" class="btn btn-default" data-dismiss="modal">승인</button>
					</div>
				</div>

			</div>
		</div>
		<%-- 			</c:if> --%>
		<%-- 			<c:if test="${docSt == '개인' & detaildoc.app_doc_st == '대기'} "> --%>

		<%-- 			</c:if> --%>

		<div id="nextbtn">
			<button id="btn" onclick="location.href='./appline.do'">재상신</button>
			<button id="btn" onclick="location.href='./appline.do'">기안취소</button>
			<button id="btn" onclick="location.href='./appline.do'">문서삭제</button>
		</div>
	</div>





</body>

<script>
	$(document).ready(function() {
		$("#btn-approve").click(function(e) {
			e.preventDefault();
			$("#myModal").modal();
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
			location.href="./approve.do?signNo="+signNo;
		});
	});
</script>
</html>