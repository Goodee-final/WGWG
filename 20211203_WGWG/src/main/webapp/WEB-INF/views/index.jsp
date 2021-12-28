<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인덱스</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 

<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>

<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"/> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script> -->

<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<script src="https://kit.fontawesome.com/d42fd504d6.js" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/signature_pad@2.3.2/dist/signature_pad.min.js"></script>

<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>

<!-- <link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css" rel="stylesheet"/> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js"></script> -->

<link rel="shortcut icon" href="img/favicon2.ico" type="image/x-icon" >
<link rel="icon" href="img/favicon2.ico" type="image/x-icon" sizes="16x16">
  
<link href="fullcalenda/lib/main.css" rel="stylesheet" />
<script type="text/javascript" src="fullcalenda/lib/main.js"></script>
<script type="text/javascript" src="fullcalenda/lib/locales-all.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script> 
 
 <script>
 $(function(){
	 
	 var eventModal = $('#reply');
	 	var modalTitle = $('.modal-title');
	   	var editTitle = $('#edit-title');
	   	var editStart = $('#edit-start');
	    var editEnd = $('#edit-end');
	    var editColortx = $('#edit-colortx');
	    var editColorbg = $('#edit-colorbg');
	    var editDesc = $('#edit-desc');
	    var editid = $('#editid');
	    
	    var addBtnContainer = $('.modalBtnContainer-addEvent');
	    var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');
     
    
     
     
var request = $.ajax({
  url: "./calendarlist.do?emp_no=${emp.emp_no}", //나중에 세션자리
  method: "post",
  dataType: "json",
  data: {},
	  success: function (msg) {
		  console.log(msg);
		  $.each(msg,function(key,value){	
			  console.log(value.description);
			  events: ([
			         {
					   title: value.title,
			           start: value.start,
			           end: value.end,
			           textColor:value.textColor,
			           backgroundColor:value.backgroundColor,
			           extendedProps:value.description,	
			           id:value.id
			  }]);
		         
		 });
	  } 
});

var doubleSubmitFlag = false;
function doubleSubmitCheck(){
    if(doubleSubmitFlag){
        return doubleSubmitFlag;
    }else{
        doubleSubmitFlag = true;
        return false;
    }
}


request.done(function(data) {
	console.log(data);
	
    
	var calendarEl = document.getElementById('calendar');
	
    var calendar = new FullCalendar.Calendar(calendarEl, {
    	height: '800px', // calendar 높이 설정
    	expandRows: true, // 화면에 맞게 높이 재설정
        slotMinTime: "00:00", // Day 캘린더에서 시작 시간
        slotMaxTime: "23:59", // Day 캘린더에서 종료 시간
    	headerToolbar: {
    		left: 'prev,next today',
    		center: 'title',
    		right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek',  
    		
    },
    
      initialView: 'dayGridMonth',
      navLinks: false, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
      editable: false, // 수정 가능?
   	  selectMirror: true,
      selectable: true, // 달력 일자 드래그 설정가능
      nowIndicator: true, // 현재 시간 마크
      dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
      //showNonCurrentDates:false, 달력에 3~4일씩 추가로 보이도록 설정
      locale: 'ko',
      
      
      //드래그로 이벤트발생
      select: function(msg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
    	  
    	 
    	  modalTitle.html('일정 등록');
      	    
          editTitle.val('');
          editStart.val(dateFormat(msg.start));
          editEnd.val(dateFormat2(msg.end));
          editColortx.val();
          editColorbg.val();
          editDesc.val('');
          
      	  addBtnContainer.show();
      	  modifyBtnContainer.hide();
      	  eventModal.modal('show');
      	 
      	  $('#save-event').on('click', function () {

             var eventData = {		                    
                 title: editTitle.val(),
                 start: editStart.val(),
                 end: editEnd.val(),		                     
                 textColor: editColortx.val(),
                 backgroundColor: editColorbg.val(),
                 description: editDesc.val()
             };

             if (eventData.start > eventData.end) {
                 alert('끝나는 날짜가 앞설 수 없습니다.');
                 return false;
             }

             if (eventData.title === '') {
                 alert('일정명은 필수입니다.');
                 return false;
             }

             
	                 
             eventModal.modal('hide');
             
             //새로운 일정 저장
				console.log(${emp.emp_no});
				console.log(eventData.title);
				console.log(eventData.start);
				console.log(eventData.end);
				console.log(eventData.textColor);
				console.log(eventData.backgroundColor);
				console.log(eventData.description);
             $.ajax({
         		url : "./calendarsave.do",
         		type : "post",
         		dataType : "json",
         		data :
         		{
         			"emp_no" : ${emp.emp_no},
         			"title" : eventData.title,         			
         			"start" : eventData.start,
         			"end" : eventData.end,
         			"textColor": eventData.textColor,
                    "backgroundColor": eventData.backgroundColor,
                    "description": eventData.description
         		},
        		success : function(msg){
        			 if(doubleSubmitCheck()) return;

        			alert("일정 등록에 성공했습니다");
        			/*  calendar.addEvent({         				
        			   title: msg.title,
  			           start: msg.start,
  			           end: msg.end,
  			           textColor:msg.textColor,
  			           backgroundColor:msg.backgroundColor,
  			           extendedProps:msg.description,	
  			           id:msg.id
        			});  */   
        			$('#content').load("./loadForm.do"); 
        		},
        		
         		error : function() {
         			alert("등록에 실패하셨습니다.");
         		}
         	});
         });
      	  
     },

      /*
    	//일정 등록	
    	  dateClick: function (msg) {
      	  	modalTitle.html('일정 등록');
      	  	
      	    
      	    
          editTitle.val('');
          editStart.val(dateFormat(msg.start));
          editEnd.val(dateFormat(msg.end));
      	    editType.val('');
      	    editDesc.val('');
      	    editColor.val('');
			
      	    addBtnContainer.show();
      	    modifyBtnContainer.hide();
      	    eventModal.modal('show');
    	
      },*/
      eventClick: function(msg) { // 있는 일정 클릭시, 
    	 
      	    if (msg.event.end == null) {
      	        msg.event.end = msg.event.start;
      	    }
      	  	     
      		console.log(msg.event.extendedProps.description);
          	
      	    modalTitle.html('일정 수정');
      	    editTitle.val(msg.event.title);
      	    console.log(msg.event.start);
      	    console.log(msg.event.end);
      	  	editStart.val(dateFormat3(msg.event.start));
      	    editEnd.val(dateFormat3(msg.event.end));
      		console.log(msg.event.textColor);
      	 	console.log(msg.event.backgroundColor);
      	    editColortx.val(msg.event.textColor).css('color', msg.event.textColor);
      	    editColorbg.val(msg.event.backgroundColor).css('color', msg.event.backgroundColor);
      	 	console.log(msg.event.description);
      	 	console.log(typeof(data));
      	    editDesc.val(msg.event.extendedProps.description);
      	    editid.val(msg.event.id);
      	    console.log(msg.event.id);
      	    console.log(editid.val());
      	    addBtnContainer.hide();
      	    modifyBtnContainer.show();
      	    eventModal.modal('show');

			
      	   $('#updateEvent').on('click', function () {
      		 if (editStart.val() > editEnd.val()) {
                 alert('끝나는 날짜가 앞설 수 없습니다.');
                 return false;
             }

             if (editTitle.val() === '') {
                 alert('일정명은 필수입니다.')
                 return false;
             }
             
             eventModal.modal('hide');
             $.ajax({
            		url : "./calendarupdate.do",
            		type : "post",
            		dataType : "json",
            		data :
            		{
            			"emp_no" : ${emp.emp_no},
            			"title" : editTitle.val(),         			
            			"start" : editStart.val(),
            			"end" : editEnd.val(),
            			"textColor": editColortx.val(),
                        "backgroundColor": editColorbg.val(),
                        "description": editDesc.val(),
                        "no":editid.val()
            		},
           		success : function(msg){
           		    if(doubleSubmitCheck()) return;
           			alert("일정 수정을 성공했습니다");
           			$('#content').load("./loadForm.do"); 
           		},
            		error : function() {
            			alert("수정을 실패하셨습니다.");
            		}
            	});
      	   });
    		
      	  $('#deleteEvent').on('click', function () {
      	    
      	    eventModal.modal('hide');

      	    //삭제시
      	    $.ajax({
      	    	url : "./calendardelete.do",
        		type : "post",
        		dataType : "json",
        		data :
        		{
        			"no":editid.val()
        		},
      	        success: function (msg) {
      	            alert('일정이 삭제되었습니다.');
      	            $('#content').load("./loadForm.do");
      	        },
      	      	error : function() {
      			alert("일정삭제를 실패하셨습니다.");
      		}
      	    });

      	});
      },
     
    	 
      events: data
    });

    calendar.render();								
});		 
		
		
});
    

 

 
	$("#updateEvent").click(function(e){
		e.preventDefault();
		console.log($("#edit-start").val());
	})	  

 function dateFormat(date) {
	 let month = date.getMonth() +1;
     let day = date.getDate();
     let hour = date.getHours()+9;
     let minute = date.getMinutes();

     month = month >= 10 ? month : '0' + month;
     day = day >= 10 ? day : '0' + day;
     hour = hour >= 10 ? hour : '0' + hour;
     minute = minute >= 10 ? minute : '0' + minute;

     return date.getFullYear() + '-' + month + '-' + day + 'T' + hour + ':' + minute;
} 
	function dateFormat2(date) {
		 let month = date.getMonth() +1;
	     let day = date.getDate()-1;
	     let hour = date.getHours()+10;
	     let minute = date.getMinutes();

	     month = month >= 10 ? month : '0' + month;
	     day = day >= 10 ? day : '0' + day;
	     hour = hour >= 10 ? hour : '0' + hour;
	     minute = minute >= 10 ? minute : '0' + minute;

	     return date.getFullYear() + '-' + month + '-' + day + 'T' + hour + ':' + minute;
	} 	
	function dateFormat3(date) {
		 let month = date.getMonth() +1;
	     let day = date.getDate();
	     let hour = date.getHours();
	     let minute = date.getMinutes();

	     month = month >= 10 ? month : '0' + month;
	     day = day >= 10 ? day : '0' + day;
	     hour = hour >= 10 ? hour : '0' + hour;
	     minute = minute >= 10 ? minute : '0' + minute;

	     return date.getFullYear() + '-' + month + '-' + day + 'T' + hour + ':' + minute;
	} 


</script>

<script type="text/javascript">
	
	var loc =  "<%=session.getAttribute("loc") %>"

	$(document).ready(function() {
		console.log(loc);
	
		if (loc != "") {
			$("#content").load(loc);
		}else{
			$("#content").load("index.jsp");
		}

		$('.nav-flyout li').on('click', function(e) {

			console.log($(this).attr('value'));
		
			$("#content").load($(this).attr('value'));

		});
		
		$('.nav li').on('click', function(e) {

			console.log($(this).attr('value'));
		
			$("#content").load($(this).attr('value'));

		});
		
		$('#logo-image').click(function(){
			$('#content').load('./main.do');
		});
		
	
		$('#alert-img').popover({title: "<h6>결재 요청</h6>", container: 'body', 
			content:	" <c:if test='${!empty doclist}'><c:forEach var='doc' items='${doclist}' varStatus='i'><div class='noticeDoc' value='${doc.app_doc_no}'><p id='pp'>${doc.emp_nm}에게서 새로운 결재요청이 왔습니다.</p><input type='hidden' value='${doc.app_doc_no}'> </div> <hr> </c:forEach></c:if>"
    					, html: true, placement: "bottom"}); 
		
	
		$('.docSign').click(function(){
			console.log()
			var state = '진행';
			var no =  $(this).attr('value');
			
			$("#content").load("./docdetail.do?docno=" + no + "&docBox=" + state);

		});
	
	});
	
	
	
	function docwait(){

		$('.noticeDoc').click(function(){
			var no =  $(this).find('input[type=hidden]').val();
			console.log(no);
			var state = '결재대기'
		
		$("#content").load("./docdetail.do?docno=" + no + "&docBox=" + state);
		});
	}	

</script>
<script type="text/javascript">
/* function openChat(){
	var newWindow = open("./memberList.do", "memberList", "height=550px, width=400px, top=200px, left=200px, location, resizable=no")
} */
   
       var openWin;
   
       function openChat()
       {
           // window.name = "부모창 이름"; 
           window.name = "index";
           // window.open("open할 window", "자식창 이름", "팝업창 옵션");
           openWin = window.open("./memberList.do",
                   "memberList", "height=550px, width=400px, top=200px, left=200px, location, resizable=no");    
       }
       
       function setChildText(){
           openWin.document.getElementById("cInput").value = document.getElementById("pInput").value;
       }

</script>

<style>
#docSign{

	display: flex;
	border: 1px solid #eee;
	
}
#docSign:hover{
	background-color: #eee;
	cursor: pointer;
}

#docSignInfo{
	display: flex;
	flex-direction:column;
	justify-content: center;
	align-items: center;
}


#Isign{

	width: 30px;
	height: 30px;
}

#docSignImg{
	display:flex;
	justify-content:center;
	align-items:center;
	background-color: #073865;
	width: 80px;
	height: 100px;
	margin-right: 30px;
	padding-right: 10px;
	padding-bottom: 10px;
}
.noticeDoc:hover{ 
	background-color: #eee; 
	cursor: pointer; 
} 

/*header  */
html, body {
	
	margin: 0;
	padding: 0;
}

#id{
	margin: 0px;
}

.popover{ 
    max-width: 100%; /* Max Width of the popover (depending on the container!) */
} 

/*a {

	text-decoration: none;
	width: max-content;
	height: max-content;
	color: black;
	cursor: pointer;
}*/


ul {
	list-style: none;
}



.header {
	display: inline-block;
	width: 100%;
	height: 80px;
	margin: 0 auto;
	padding: 0;
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	z-index: 10;
	border-bottom: 2px solid #EEEEEE;
	background-color: white;
}

#logo-image {
	width: 190px;
	height: 50px;
	background-image: url("./img/logo1.png");
	background-color: white;
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	margin-top: 15px;
	margin-left: 30px;
}

#logo-image:hover{
	cursor: pointer;
}

.right {
	color: white;
}

.right .nav{
	position: fixed;
	top: 0;
	right: 60px;
}

.right .nav li {
	margin-left: 15px;
	display: inline-block;
}

.nav-icon {
	width: 35px;
	height: 35px;
	margin: 0 auto;
	margin-right: 5px;
	margin-top: 15px;
}

.nav-icon:hover {
	cursor: pointer;
}

#mypage-img {
	background-image: url("./img/user1.svg");
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}

#alert-img {
	background-image: url("./img/bell1.svg");
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}

#logout-img {
	background-image: url("./img/logout.svg");
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}


/*side  */
.w3-sidebar {
	background-color: #073865 !important;
}
.nav1 {
	padding-left: 20px !important;
	padding-top: 20px !important;
}


.nav-flyout {
	display: none;
	margin: 0;
	width: 150px;
	font-size: 15px !important;
}

.nav1:hover>.nav-flyout {
	display: block;
}

ul {
	list-style: none;
	margin: 0 !important;
	padding: 0 !important;
}

.nav-flyout li:hover {
	background-color: #073865;
	color: white;

}

.w3-sidebar>ul>li {
	text-decoration: none;
	color: white;
	list-style: none;
	margin-left: 0;
	font-size: 18px !important;
}

.w3-sidebar>ul>li:hover {
	background-color: white;
	color: #073865;
}

.w3-sidebar>ul>li:hover>ul>li {
	background-color: white;
	color: #073865;
	font-size: 16px !important;
}

.w3-sidebar>ul li:hover>i {
	color: #073865;
}

.w3-button:hover {
	background-color: #073865 !important;
	color: white !important;
	width: 130px;
}

.w3-bar-block .w3-bar-item {
	padding: 8px 0px;
}

i {
	color: white;
	padding-left: 2px;
	padding-right: 4px;
}

.far {
	margin-top: 5px;
	margin-left: 5px;
}

.fas {
	margin-top: 5px;
	margin-left: 5px;
}

.far:hover .fas:hover {
	color: black;
	cursor: pointer;
}

.li-btn {
	display: flex;
	justify-content: center;
	align-items: center;
}

.btn {
	width: 100px;
	height: 35px;
	margin-top: 5px;
	margin-bottom: 5px;
	background-color: #073865;
	color: white;
}

.btn:hover {
	color: white;
}

.footer {
    width: 100%;
    height: 200px;
    margin-left: 180px;
    background-color: #f1f1f1;
    display: block;    
}
.footer-content {
	width: 800px;
	height: 150px;
	padding: 30px;
	margin: 30px !important;
}
#content{
	height: 100%;
}
#main-content {
	display: inline-flex;
}
#main-content1 {
	width: 600px;
}

#main-content2 {
	width: 600px;
}
.f1 {
	font-weight: bold;
	font-size: 1.5rem !important;
	color: #5f5f5f;
	display: inline;
	margin-right: 10px;
}
.faddr {
	margin-top: 30px;
}
.main-loginemp {
	width: 550px;
	height: 200px;
	display: inline-flex;
	padding:15px;
	border: 1px solid #ccc;
}
.main-calendar {
	width:550px;
	height: 300px;
	margin-top: 30px;
}

.main-notice{
	width: 550px;
	height: 250px;
}
.main-approval {
	width: 550px;
	height: 250px;
	
	margin-top: 30px;
}

#emp-img {
	width: 150px;
	height: 160px;
}
#emp-info {
	width: 400px;
	height: 150px;
	padding: 30px;
}
#emp-info span:first-child{
	font-size: 1.8em !important;
}

#emp-info span:nth-child(1),#emp-info span:nth-child(2){
	font-size: 1.5em !important;
}

#emp-info button{
	width: 130px;
	height: 35px;
	border-radius: 5px;
	border:none;
	font-size: 1.1em;
}

#on{
	background-color: #073865;
	color: white;
	margin-top: 10px;
	margin-right: 20px;
	
}
#notili{
	width: 550px;
	height: 220px;
	border-collapse: collapse;
	border-top: 2px solid #ccc;
	border-bottom: 2px solid #ccc;
}
#notili th {
	text-align: center;
	border-bottom: 2px solid #ccc;
	height: 40px;
	font-weight: normal;
}
#notili td {
	text-align: center;
}
#allno{
	font-size: 1.3em;
}
#moreno {
	margin-left: 380px;
}
#empphoto{
	width:150px;
	height: 160px;
}
</style>

</head>

<body oncontextmenu="return false">

	<header class="header">
		<div class="left">
			<ul class="nav">
				<li><div id="logo-image" ></div></li>
			</ul>
		</div>
		<div class="right">
			<ul class="nav">
				<li value="./chkPWForm.do">
					<div class="nav-icon" id="mypage-img" ></div>
				</li>
				<li>
					<div class="nav-icon" id="alert-img"></div>
<%-- 					<input type="hidden" name="emp_nm" id="doclist" value="${emp_nm}" hidden="hidden"/> --%>
					
				</li>
				<li>
					<div class="nav-icon" id="logout-img" onclick="location.href='./logout.do'"></div>
				</li>
			</ul>
		</div>
	</header>


	<!-- Sidebar -->
	<!--  w3-light-grey -->
	<article class="w3-sidebar w3-bar-block"
		style="width: 180px; margin-top: 50px; background-color: white; border-right: 2px solid #EEEEEE;">
		<ul>
			<li class="w3-bar-item nav1"><i class="fas fa-file-signature"></i>전자결재
				<ul class="nav-flyout">
					<li class="w3-bar-item w3-button" 
              value="./docinsert.do">기안하기</li>
					<li class="w3-bar-item w3-button" 

              value="./progdoclist.do">결재 진행함</li>

					<li class="w3-bar-item w3-button" 
              value="./waitdoclist.do">결재 대기함</li>
					<li class="w3-bar-item w3-button"
						  value="./completedoc.do">결재 완료함</li>
					<li class="w3-bar-item w3-button" 
              value="./refdoclist.do">참조문서함</li>
					<li class="w3-bar-item w3-button"
              value="./mydoclist.do">개인문서함</li>
					<li class="w3-bar-item w3-button"
               value="./tempdoc.do">임시문서함</li>
				</ul>
			</li>
			
			
			<li class="w3-bar-item nav1"><i class="fas fa-file-signature"></i>전자서명
				<ul class="nav-flyout">
				
					<li class="w3-bar-item w3-button"
						  value="./signlist.do">전자서명 관리</li>
					<li class="w3-bar-item w3-button"
						  value="./signinsert.do">전자서명 등록</li>
					<li class="w3-bar-item w3-button"
						  value="./signdraw.do">전자서명만들기</li>
		
				</ul>
			</li>

			<li class="w3-bar-item nav1"><i class="fas fa-thumbtack"></i> 공지사항
				<ul class="nav-flyout">
					<li class="w3-bar-item w3-button"
						value="./noticeList.do">공지사항</li>
					<li class="w3-bar-item w3-button" value="">공지사항</li>
				</ul>
			</li>

			<li class="w3-bar-item nav1"><i class="far fa-calendar"></i>일정관리
				<ul class="nav-flyout">
					<li class="w3-bar-item w3-button"
						value="./loadForm.do">개인일정</li>
					<li class="w3-bar-item w3-button" 
						value="./companyloadForm.do">회사일정</li>
				</ul>
			</li>

			<li class="w3-bar-item nav1"><i class="far fa-calendar-check"></i>예약
				<ul class="nav-flyout">
					<li class="w3-bar-item w3-button" value="./reservation.do">예약하기</li>
					<li class="w3-bar-item w3-button" value="./empReservationList.do">예약목록</li>
					<c:if test="${emp.dept_no eq 40}">
					<li class="w3-bar-item w3-button" value="./adminRsvlist.do">회의실 관리</li>
					</c:if>
				</ul>
			</li>

			<li class="w3-bar-item nav1"><i class="far fa-file"></i>업무일지
				<ul class="nav-flyout">
					<li class="w3-bar-item w3-button" value="./worklogInsert.do">업무일지 작성</li>
					<li class="w3-bar-item w3-button" value="./worklogList.do">업무일지 조회</li>
				</ul>
			</li>

			<li class="w3-bar-item nav1"><i class="fas fa-sms"></i>채팅
				<ul class="nav-flyout">
				<li class="w3-bar-item w3-button" onclick="openChat()">채채팅팅
					<input type="hidden" value="${loginEmp}" id="pInput">
					<input type="button" value="전달" onclick="setChildText()">
				</li>
					<li class="w3-bar-item w3-button" value="./chatOpen.do">채팅 시작</li>
					<!-- <li class="w3-bar-item w3-button" value="./socketOpen.do">채팅 시작</li> -->
				</ul></li>
			<c:if test="${emp.dept_no eq 10}">
				<li class="w3-bar-item nav1"><i class="fas fa-file"></i>양식함
					<ul class="nav-flyout">
						<li class="w3-bar-item w3-button" value="./formlist.do">양식목록</li>
						<li class="w3-bar-item w3-button" value="./forminsert.do">양식등록</li>
					</ul>
				</li>
			</c:if>
			<c:if test="${emp.dept_no eq 30}">
			<li class="w3-bar-item nav1"><i class="fas fa-users"></i>사원관리
				<ul class="nav-flyout">
					<li class="w3-bar-item w3-button "
						value="./insert_emp_form.do">사원등록</li>
					<li class="w3-bar-item w3-button "value="./empList.do">사원조회</li>
				</ul></li>
			</c:if>
			<c:if test="${emp.dept_no eq 30}">
			<li class="w3-bar-item nav1"><i class="fas fa-id-badge"></i>부서관리
				<ul class="nav-flyout">
					<li class="w3-bar-item w3-button "
						value="./deptList.do">부서조회 및 관리</li>
				</ul></li>
			</c:if>
		</ul>
	</article>
	<section id="content"style="margin-left: 230px; margin-top: 50px; padding: 50px;">

		<div id="main-content">
			<div id="main-content1">
				<div class="main-loginemp">

					<div id="emp-img"><img id="empphoto" src="./img/emp/${emp.photo}"></div>
					<div id="emp-info">
						<span>${emp.emp_nm}</span><br>
						<span>${emp.dVo.dept_nm}</span>
						<span>${emp.pVo.position_nm}</span><br>
						<!-- <button type="button" id="on">출근하기</button>
						<button type="button" id="off">퇴근하기</button> -->
					</div>
				</div>
				<div id="calendar" class="main-calendar">
					
				</div>
			</div>
			<div id="main-content2">
				<div class="main-notice">
				<span id="allno">전체공지사항</span>
				<span id="moreno"><a href="./noticeList.do">더보기</a></span>
					<table id="notili">
						<tbody>
							<c:forEach var="notice" items="${noticeList}">
								<tr>
									<td>${notice.notice_no}</td>
									<td><a href="./detailnotice.do?notice_no=${notice.notice_no}">${notice.notice_title}</a></td>
									<td>등록일: ${notice.notice_reg_dt}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
				</div>
				<div class="main-approval">
				<h4>전자결재</h4>
				<hr>
				<c:if test="${empty doclist1}">
					진행중인 결재가 없습니다.
				</c:if>
				<c:if test="${!empty doclist1}">
				<p>진행중</p>
				
						<c:forEach items="${doclist1}" var="doc">
				<div id="docSign" class="docSign" value="${doc.app_doc_no}">
					<div id="docSignImg">
						<i id="Isign" class="fas fa-file-signature fa-3x"></i>
					</div>
					<div id="docSignInfo">
						<h5><b>${doc.app_doc_title }</b></h5>
						<p>${doc.emp_nm}</p>
						<p>${doc.app_doc_reg_dt}</p>
					</div>
				</div>
				</c:forEach>
				</c:if>
				</div>
			</div>
		</div>



	</section>

	<footer class="footer">
		<div class="footer-content">
			<span class="f1">회사소개</span>
			<span class="f1">약관</span>
			<span class="f1">개인정보취급방침</span> 
			<span class="f1">파트너</span> 
			<span class="f1">뉴스레터</span> 
			<span class="f1">리포트</span>
			<p class="faddr">주소: 서울특별시 금천구 가산디지털2로 00 </p>
			<p>사업자등록번호: 101-00-00000</p>
			<p>상호명: GOODEE</p>
		</div>
    </footer>
    
   
</body>
