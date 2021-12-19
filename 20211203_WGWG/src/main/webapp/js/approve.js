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

function pagingAjax() {
	
	var app_chk = $('#app_chk').val();
	var searchKeyword = $('#searchKeyword').val();
	var index = $('#index').val();
	var pageStartNum = $('#pageStartNum').val();
	var listCnt = $('#listCnt').val();
	
	var sendData = { "app_chk": app_chk, "searchKeyword": searchKeyword, "index": index, "pageStartNum": pageStartNum, "listCnt": listCnt }
 	console.log(sendData);

	$.ajax({
		url: "./pagingAjax.do"
		, method: 'POST'
		, data: sendData
		, success: function(data) {
			console.log("데이터 왔다갔다 성공");
			var reData = "app_chk: " + data["app_chk"] + "searchKeyword:" + searchKeyword +"index: " + index+ "startNum: " + pageStartNum+ "listCnt: "+ listCnt ;
			var redata1 = data["app_chk"];
			var redata2 = data["searchKeyword"];
			var redata3 = data["index"];
			var redata4 = data["pageStartNum"];
			var redata5 = data["listCnt"];

			$('#content').load('./noticeList.do?app_chk=' + redata1 + '&searchKeyword=' + redata2 + '&index=' + redata3 + '&pageStartNum=' + redata4 + '&listCnt=' + redata5);
		}
	});
}