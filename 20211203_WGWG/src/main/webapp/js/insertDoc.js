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

