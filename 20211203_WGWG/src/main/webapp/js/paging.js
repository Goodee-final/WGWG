/**
 *
 */
var pageAjax = function(){
	var active =  $('.active').attr('val');
	console.log(active);
	
	var app_chk = $('#app_chk').val();
	var searchKeyword = $('#searchKeyword').val();
	var index = $('#index').val();
	var pageStartNum = $('#pageStartNum').val();
	var listCnt = $('#listCnt').val();
	
	var sendData = { "app_chk": app_chk, "searchKeyword": searchKeyword, "index": index, "pageStartNum": pageStartNum, "listCnt": listCnt, "active": active };

	console.log(sendData);

	$.ajax({
		url: "./page.do",
		type:"post",
		async:true,
		data : sendData,
		success : function(reData){
			console.log(reData);
			var doclists = reData["doclists"];
			var pageCnt = reData["pageCnt"];
			var index = reData["index"];
			var pageStartNum = reData["pageStartNum"];
			var listCnt = reData["listCnt"];
			var total = reData["total"];
			var app_chk = reData["app_chk"];
			var searchkeyword = reData["searchkeyword"];
			var active = reData["active"];
			var count = reData["count"];
			var paging = reData["paging"];
			
			console.log("paging : " + paging);
			
			
			
			var varhtml ="";
			
			var varhtml2= "";
			
			var n = $(".table tr:eq(0) th").length;
			
	varhtml += " 	<thead>                                                                                      ";
	varhtml += " 					<tr>                                                                         ";
	varhtml += " 						<th>문서번호</th>                                                        ";
	varhtml += " 						<th>문서제목</th>                                                        ";
	varhtml += " 						<th>양식</th>                                                            ";
	varhtml += " 						<th>참조</th>                                                            ";
	varhtml += " 						<th>상태</th>                                                            ";
	varhtml += " 						<th>기안일</th>                                                          ";
	varhtml += " 					</tr>                                                                        ";
	varhtml += " 				</thead>                                                                         ";
	varhtml += " 				<tbody>                                                                          ";
	$.each(doclists, function(index,doc){
//		if(doc.app_doc_st == '진행'){
			
	varhtml += " 						<tr>                                                                     ";
	varhtml += " 							<td>"+doc.app_doc_no+"</td>                                           ";
	varhtml += " 							<td>"+doc.app_doc_title+"</td>                                        ";
	varhtml += " 							<td>"+doc.form_no+"</td>                                              ";
	varhtml += " 							<td>"+doc.ref_emp_no+"</td>                                           ";
	varhtml += " 							<td>"+doc.app_doc_st+"</td>                                           ";
	varhtml += " 							<td>"+doc.app_doc_reg_dt+"</td>                                       ";
	varhtml += " 						</tr>                                                                    ";
//		}
	});
	varhtml += " 				</tbody>";

			

	                                                                                                                                    
	
		for(let i= pageStartNum; i<=count; i++){
			console.log("i값은 : " + i);
				if(index+1 == i){
					  varhtml2 += "  <li style='background: #eee;'><a style='background: #eee;' onclick='pageIndex("+i+")'>"+i+"</a></li>                                                                                                   ";					
				}else{
					varhtml2 += "		<li><a onclick='pageIndex("+i+")'>"+i+"</a></li>                                                                                 ";
					
				}
					}				                                                                            
                                                                                                                       

//		varhtml2 += "	<li><a href='#' onclick='pageNext("+paging.pagestartnum+","+paging.total+","+paging.listcnt+","+paging.pagecnt+")'>&rsaquo;</a></li>   ";
//		varhtml2 += "	<li><a href='#' onclick='pageLast("+paging.pagestartnum+","+paging.total+","+paging.listcnt+","+paging.pagecnt+")'>&raquo;</a></li>    ";
		varhtml2 += "	<li><a href='#' onclick='pageNext("+pageStartNum+","+total+","+listCnt+","+pageCnt+")'>&rsaquo;</a></li>   ";
		varhtml2 += "	<li><a href='#' onclick='pageLast("+pageStartNum+","+total+","+listCnt+","+pageCnt+")'>&raquo;</a></li>    ";
			
			$(".table").html(varhtml);
			$(".pagination").html(varhtml2);
			
		},
		error: function(){
			alert("잘못된 요청 입니다");
		}
		
	});
}

function AppPaging() {
		
	var active =  $('.active').attr('val');
	console.log(active);
	
	var app_chk = $('#app_chk').val();
	var searchKeyword = $('#searchKeyword').val();
	var index = $('#index').val();
	var pageStartNum = $('#pageStartNum').val();
	var listCnt = $('#listCnt').val();
	
	var sendData = { "app_chk": app_chk, "searchKeyword": searchKeyword, "index": index, "pageStartNum": pageStartNum, "listCnt": listCnt, "active": active };

	console.log(sendData);



	if(app_chk == '완료'){		
		$('#content').load('./completedoc.do?app_chk=' + app_chk + '&searchKeyword=' + searchKeyword + '&index=' + index + '&pageStartNum=' + pageStartNum + '&listCnt=' + listCnt + "&active=" + active);
	}else if(app_chk == '임시'){
		$('#content').load('./tempdoc.do?app_chk=' + app_chk + '&searchKeyword=' + searchKeyword + '&index=' + index + '&pageStartNum=' + pageStartNum + '&listCnt=' + listCnt + "&active=" + active);
	}else if(app_chk == '참조'){
		$('#content').load('./refdoclist.do?app_chk=' + app_chk + '&searchKeyword=' + searchKeyword + '&index=' + index + '&pageStartNum=' + pageStartNum + '&listCnt=' + listCnt);				
	}else if(app_chk == '개인'){
		$('#content').load('./mydoclist.do?app_chk=' + app_chk + '&searchKeyword=' + searchKeyword + '&index=' + index + '&pageStartNum=' + pageStartNum + '&listCnt=' + listCnt + "&active=" + active);
	}else if(app_chk == '결재대기'){
//		alert('안녕');
		console.log('왜 이동을 안하는가');
		$('#content').load('./waitdoclist.do?app_chk=' + app_chk + '&searchKeyword=' + searchKeyword + '&index=' + index + '&pageStartNum=' + pageStartNum + '&listCnt=' + listCnt + "&active=" + active);		
	}

}


function noticepagingAjax() {
	
	var notice_chk = $('#notice_chk').val();
	var searchKeyword = $('#searchKeyword').val();
	var index = $('#index').val();
	var pageStartNum = $('#pageStartNum').val();
	var listCnt = $('#listCnt').val();
	
	var sendData = { "notice_chk": notice_chk, "searchKeyword": searchKeyword, "index": index, "pageStartNum": pageStartNum, "listCnt": listCnt }
 	console.log(sendData);


	$.ajax({
		url: "./noticepagingAjax.do"
		, method: 'POST'
		, data: sendData
		, success: function(data) {
			console.log("데이터 왔다갔다 성공");
			var reData = "notice_chk: " + data["notice_chk"] + "searchKeyword:" + searchKeyword +"index: " + index+ "startNum: " + pageStartNum+ "listCnt: "+ listCnt ;
			var redata1 = data["notice_chk"];
			var redata2 = data["searchKeyword"];
			var redata3 = data["index"];
			var redata4 = data["pageStartNum"];
			var redata5 = data["listCnt"];

			$('#content').load('./noticeList.do?notice_chk=' + redata1 + '&searchKeyword=' + redata2 + '&index=' + redata3 + '&pageStartNum=' + redata4 + '&listCnt=' + redata5);
		}
	});
}
//paging submit 공통
function frmPaging() {  
	console.log("도착");

  if(document.getElementById("notice_chk")){

 	  noticepagingAjax();
	}else if(document.getElementById('emppaging')){
		  empPaging();
	}else if(document.getElementById('app_chk')){
   		AppPaging();
//		pageAjax();
	}	
	
}
//몇개씩 보여줄 것인지 
function listCnt(){
	document.getElementById("index").value=0;
	document.getElementById("pageStartNum").value=1;
	document.getElementById("listCnt").value=document.getElementById("listCount").value	
	frmPaging();
}
function nchk(){
	console.log("체크");
	document.getElementById("index").value=0;
	document.getElementById("pageStartNum").value=1;
	document.getElementById("listCnt").value=document.getElementById("listCount").value		
	document.getElementById("notice_chk").value=document.getElementById("notice_chk").value		
	document.getElementById("searchKeyword").value=document.getElementById("searchKeyword").value
	console.log(document.getElementById("notice_chk").value);
	//$('#content').load('./noticeList.do?notice_chk=' + document.getElementById("listCnt").value + '&searchKeyword=' + document.getElementById("searchKeyword").value + 
	//'&index=' + document.getElementById("index").value + '&pageStartNum=' + document.getElementById("pageStartNum").value + '&listCnt=' + document.getElementById("listCnt").value);
	frmPaging();
}
function empListCnt(){
	document.getElementById("index").value=0;
	document.getElementById("pageStartNum").value=1;
	empPaging();
}

function empPaging(){
   var index = $('#index').val();
   var pageStartNum = $('#pageStartNum').val();
   var listCnt = $('#listCnt').val();
   var searchBy = $('#searchBy').val();
   var searchWord = $('#searchWord').val();
	
   console.log("select Box : "+searchBy + "검색어 : " + searchWord + "index : "+index + "pageStartNum : "+pageStartNum+"listCnt"+listCnt );
   $('#content').load('./empList.do?searchWord=' + searchWord + '&searchBy=' + searchBy + '&index=' + index + '&pageStartNum=' + pageStartNum + '&listCnt=' + listCnt);            
}

function pageFirst() {
	var index = document.getElementById('index');
	var pageStartNum = document.getElementById('pageStartNum');
	index.value = 0;
	pageStartNum.value = 1;
	frmPaging();
}

function pagePre(num, pageCnt) { //num: 출력한 페이지의 시작번호, pageCnt: 출력할 페이지 번호 개수
	if (0 < num - pageCnt) {
		num -= pageCnt
		var index = document.getElementById('index');
		var pageStartNum = document.getElementById('pageStartNum');
		pageStartNum.value = num;
		index.value = num - 1;
	}
	frmPaging();
}

function pageIndex(idx) {
	var index = document.getElementById('index');
	index.value = idx - 1;
	frmPaging();
}

//출력할 페이지의 시작번호, 리스트의 총 개수, 출력할 리스트의 개수, 출력한 페이지번호 개수
function pageNext(num, total, listNum, pageCnt) {
	var index = Math.ceil(total / listNum);
	var max = Math.ceil(index / pageCnt);

	if (max * pageCnt > num + pageCnt) {
		num += pageCnt;
		var index = document.getElementById('index');
		var pageStartNum = document.getElementById('pageStartNum');

		pageStartNum.value = num;
		index.value = num - 1;
	}
	frmPaging();
}

function pageLast(num, total, listNum, pageCnt) {
	var index = Math.ceil(total / listNum);
	var max = Math.ceil(index / pageCnt);

	while(max * pageCnt > num + pageCnt) {
		num += pageCnt;
	}
	var index = document.getElementById('index');
	var pageStartNum = document.getElementById('pageStartNum');

	pageStartNum.value = num;
	index.value = num - 1;
	frmPaging();
}

