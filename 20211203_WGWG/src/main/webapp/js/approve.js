/**
 * 
 */

function detailAjax(no, docBox) {
	var sendData = { "docno": no, "docBox": docBox }
	$.ajax({
		url: "./detailAjax.do"
		, method: 'POST'
		, data: sendData
		, success: function(data) {
			var data2 = "문서번호 : " + data["docno"] + ", 문서함 : " + data["docBox"];
			var no2 = data["docno"];
			var docBox2 = data["docBox"];

			$("#content").load("./docdetail.do?docno=" + no2 + "&docBox=" + docBox2);
		}
	});
}