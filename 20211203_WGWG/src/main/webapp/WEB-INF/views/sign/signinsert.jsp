<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서명 등록 화면</title>

<!--  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$("#profileImg").click(function() {
			$("#input_img").click();
		})
	})
</script>


<script>
	var sel_file;

	$(document).ready(function() {
		$("#input_img").on("change", fileChange);
	});

	function fileChange(e) {
		e.preventDefault();

		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}

			sel_file = f;

			var reader = new FileReader();
			reader.onload = function(e) {
				$("#profileImg").attr("src", e.target.result);
				$("#profileImg").css("height", "150px")
			}
			reader.readAsDataURL(f);
		});

		var file = files[0]
		console.log(file)
		var formData = new FormData();

		formData.append("file", file);

		// 		$.ajax({
		// 			url : '/uploadAjax.do',
		// 			data : formData,
		// 			dataType : 'text',
		// 			processData : false,
		// 			contentType : false,
		// 			type : 'POST',
		// 			success : function(data) {

		// 				alert("프로필 이미지가 변경 되었습니다.")

		// 			}
		// 		})

		// 		function checkImageType(fileName) {
		// 			var pattern = /jpg$|gif$|png$|jpeg$/i;
		// 			return fileName.match(pattern);
		// 		}

		// 		function getOriginalName(fileName) {
		// 			if (checkImageType(fileName)) {
		// 				return;
		// 			}

		// 			var idx = fileName.indexOf("_") + 1;
		// 			return fileName.substr(idx);

		// 		}

		// 		function getImageLink(fileName) {

		// 			if (!checkImageType(fileName)) {
		// 				return;
		// 			}
		// 			var front = fileName.substr(0, 12);
		// 			var end = fileName.substr(14);

		// 			return front + end;

		// 		}

	}
</script>
<!--  -->

<style type="text/css">
.flex-box {
	display: flex;
	justify-content: center;
	align-items: flex-end;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/common/side2.jsp"></jsp:include>
	<!-- Page Content -->
	<div style="margin-left: 230px; padding: 50px;">
		<h1>전자서명 등록</h1>

		<form action="./uploadForm.do" id="form1" method="POST"
			enctype="multipart/form-data">
			<table border="1px solid black">
				<tr>
					<td>
						<p><b>유의 사항</b></p>
					</td>
					<td>
						<p>전자서명은 최대 3개까지 등록 가능 합니다.</p>
						<p>확장자는 이미지 파일(.png)만 업로드 가능합니다.</p>
						<p>용량은 10MB를 초과 할 수 없습니다.</p>
					</td>
				</tr>
				<tr>
					<td>
						<p><b>기본 이미지</b></p>
					</td>
					<td><img src="img/sign/approve.PNG" width="75px" height="75px">
					</td>
				</tr>
				<tr>
					<td>
						<p><b>등록된 결재 이미지</b></p>
					</td>
					<td class="flex-box">

						<div>
							<img id="profileImg" src="" style="border-radius: 10%; padding-top: 10px; height: 125px; width: 125px;">
						</div> <input type="file" id="input_img" name="file">

					</td>


				</tr>
			</table>
			<input type="submit" class="btn btn-primary" value="저장하기"> 
			<input type="button" class="btn btn-primary" value="취소하기" onclick="href.location='sign'"> savedFileName =
			${savedFileName}

		</form>
	</div>
</body>
</html>