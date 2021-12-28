<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Signature Pad</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/signature_pad@2.3.2/dist/signature_pad.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<style>


.signature-pad {
	position: relative;
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	-ms-flex-direction: column;
	flex-direction: column;
	font-size: 10px;
	width: 100%;
	height: 100%;
	max-width: 600px;
	max-height: 350px;
	border: 1px solid #e8e8e8;
	background-color: #fff;
	box-shadow: 0 1px 4px rgba(0, 0, 0, 0.27), 0 0 40px rgba(0, 0, 0, 0.08)
		inset;
	border-radius: 4px;
	padding: 16px;
}

.signature-pad::before, .signature-pad::after {
	position: absolute;
	z-index: -1;
	content: "";
	width: 40%;
	height: 10px;
	bottom: 10px;
	background: transparent;
	box-shadow: 0 8px 12px rgba(0, 0, 0, 0.4);
}

.signature-pad::before {
	left: 20px;
	-webkit-transform: skew(-3deg) rotate(-3deg);
	transform: skew(-3deg) rotate(-3deg);
}

.signature-pad::after {
	right: 20px;
	-webkit-transform: skew(3deg) rotate(3deg);
	transform: skew(3deg) rotate(3deg);
}

.signature-pad--body
canvas {
	width: 100%;
	height: 253px;
	border-radius: 4px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.02) inset;
}

.signature-pad--footer {
	color: #C3C3C3;
	text-align: center;
	font-size: 1.2em;
	margin-top: 8px;
	display:flex;
}

#container-box {
	width: 80%;
	height: 500px;
	display: flex;
	flex-direction:column;
	align-items: center;
	justify-content: center;
}

.save{
	margin-top: 40px;
}

</style>

</head>
<body>


	<!-- Page Content -->
	<div class="container">
	
		<h1 id="title">전자서명 만들기</h1>
		<div id="container-box">
			<div id="signature-pad" class="signature-pad">
				<div class="signature-pad--body">
					<canvas></canvas>
				</div>
				<div class="signature-pad--footer">
						<div data-action="clear">
							<i style='font-size:24px; color: black; ' class='fas'>&#xf01e;</i>
						</div>
				</div>
			</div>
			<button type="button" class="btn btn-primary save" data-action="save">생성하기</button>
			
		</div>

	</div>

	<script>
		var canvas = $("#signature-pad canvas")[0];
		
		var sign = new SignaturePad(canvas, {
			minWidth : 4,
			maxWidth : 4,
			penColor : "rgb(0, 0, 0)"
		});

		$("[data-action]").on("click", function() {
			if ($(this).data("action") == "clear") {
				sign.clear();
			} else if ($(this).data("action") == "save") {
				if (sign.isEmpty()) {
					alert("전자서명을 해주세요!");
				} else {
					var dataURL = canvas.toDataURL();
					download(dataURL, "signature.png");
				}
			}
		});

		function resizeCanvas() {
			var canvas = $("#signature-pad canvas")[0];

			var ratio = Math.max(window.devicePixelRatio || 1, 1);
			canvas.width = canvas.offsetWidth * ratio;
			canvas.height = canvas.offsetHeight * ratio;
			canvas.getContext("2d").scale(ratio, ratio);
		}

		$(window).on("resize", function() {
			resizeCanvas();
		});

		resizeCanvas();

		function download(dataURL, filename) {
			if (navigator.userAgent.indexOf("Safari") > -1
					&& navigator.userAgent.indexOf("Chrome") === -1) {
				window.open(dataURL);
			} else {
				var blob = dataURLToBlob(dataURL);
				var url = window.URL.createObjectURL(blob);

				var a = document.createElement("a");
				a.style = "display: none";
				a.href = url;
				a.download = filename;

				document.body.appendChild(a);
				a.click();

				window.URL.revokeObjectURL(url);
			}
		}

		// One could simply use Canvas#toBlob method instead, but it's just to show
		// that it can be done using result of SignaturePad#toDataURL.
		function dataURLToBlob(dataURL) {
			// Code taken from https://github.com/ebidel/filer.js
			var parts = dataURL.split(';base64,');
			var contentType = parts[0].split(":")[1];
			var raw = window.atob(parts[1]);
			var rawLength = raw.length;
			var uInt8Array = new Uint8Array(rawLength);

			for (var i = 0; i < rawLength; ++i) {
				uInt8Array[i] = raw.charCodeAt(i);
			}

			return new Blob([ uInt8Array ], {
				type : contentType
			});
		}
	</script>


</body>

</html>
