<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="fullcalenda/lib/main.css" rel="stylesheet" />
<script type="text/javascript" src="fullcalenda/lib/main.js"></script>
<script type="text/javascript" src="fullcalenda/lib/locales-all.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script> 
 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <script>
 $(function(){
		$('.docSign').click(function(){
			console.log()
			var state = '진행';
			var no =  $(this).attr('value');
			
			$("#content").load("./docdetail.do?docno=" + no + "&docBox=" + state);

		});
	
	 
	 
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
</head>
<body>

	<section id="content">
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

</body>
</html>