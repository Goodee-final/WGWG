var isShow = true;
function validateForm(){
	var form = document.forms[0];
	console.log(form);
	
	/*var id = document.getElementById("id")
	var title = document.getElementById("title");
	var content = document.getElementById("content");
	if(id.value =="" || title.value == "" || content.value ==""){
		alert("필수값을 입력해 주세요");
	}else{
		var str = content.value;
		str = str.replace(/\r\n|\r|\n|\n\r/g,'<br>');
		content.value = str;
		isShow = false;
		form.submit();
	}*/
	var worklog_content = document.getelegetElementsByName("worklog_content");
	if(worklog_content.value ==""){
		alert("글을 입력해 주세요.");
	}else{
		var str = content.value;
		str = str.replace(/\r\n|\r|\n|\n\r/g,'<br>');
		content.value = str;
		isShow = false;
		form.submit();
	}
}

window.onbeforeunload =  function(){
	if(isShow){
		return "화면을 벗어 납니다";
	}
}


