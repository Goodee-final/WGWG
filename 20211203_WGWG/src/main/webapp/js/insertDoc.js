/**
 * 
 */
var isShow = true;
function validateForm(){
	var form = document.forms[0];
	console.log(form);
	
	var id = document.getElementById("id");
	var title = document.getElementById("title");
	var content = document.getElementById("content");
	
	if(id.value == "" || title.value == "" || content.value == ""){
		alert("필수값을 입력해 주세요");
	}else{
		var str = content.value;
		str = str.replace(/\r\n|\r|\n|\n\r/g, '<br>');
		content.value = str;
	//	document.getElementById("changeTextArea").innerHTML = str;
		isShow = false;
		form.submit();
	}
}


function stopdoc(){
	if (confirm("기안을 취소하면 작성한 내용이 사라집니다.") == true) {    //확인
		window.location = './mydoclist.do';
	} else {   //취소
		return false;
	}
}

/*function selectLine(){
	console.log("결재라인 지정");
	var id = document.getElementById("inputId");
	var pw = document.getElementById("inputPw");
	
	var frm = document.forms[0];
	frm.action = "./login.do";
	
	//유효성 검사 후 ajax 로그인
	if(id.value == "" || id.value.trim() == ""){
		swal("로그인","아이디를 입력해 주세요");
		id.value="";
		id.focus();
	}else if(pw.value=="" || id.value.trim() == ""){
		swal("로그인","비밀번호를 입력해 주세요");
		pw.value="";
		pw.focus();
	}else{
		$.ajax({
         type: "post",
         //url: "./loginCheckText.do",
         url: "./loginCheckMap.do",
         data: "id = " + id.value + "& pw = " + pw.value,
         success: function(msg) {
            if(msg.isc == '성공'){
               console.log(msg.isc);
               frm.submit();
            }else{
               swal("로그인", "해당 사용자는 존재하지 않습니다.")
            }
            console.log(msg);
         },
         error: function() {
            swal("로그인", "로그인에 문제가 있습니다.");
         }
      });

	}
}*/



/*var id = "";
	
	$('#jstree').bind('select_node.jstree', function(event, data){
		var a = $('#jstree').jstree('get_selected',true);
		id = data.instance.get_node(data.selected).text;

		console.log(a);
		console.log(id);
	});*/


/*$(function() {
    $('#submitLine').click(function() {
            
        var shopCode = $('#shopCode').val();
        var adminPw = $('#adminPw').val();
        var memberBirth = $('#memberBirth').val();         
            
        // ajax 호출을 위한 정보 기입
        var request = $.ajax({
            url: "/spendAdminCheck", // 호출 url
            method: "POST", // 전송방식
           data: {shopCode, adminPw, memberBirth}, // 파라미터
            dataType: "text" // 전송 받을 타입 ex) xml, html, text, json
        });
             
        // 호출 정상일 시 실행되는 메서드
        request.done(function( data ) {
            console.log(data);
        });
 
        // 호출 에러일 시 실행되는 메서드
        request.fail(function( jqXHR, textStatus ) {
            alert( "Request failed: " + textStatus );
        });
 
        // 호출 정상 또는 에러 상관없이 실행
        request.always(function() {
            console.log('완료');
        });
    });
});*/