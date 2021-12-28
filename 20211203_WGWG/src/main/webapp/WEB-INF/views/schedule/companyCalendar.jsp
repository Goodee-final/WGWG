<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>회사일정</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<link href="fullcalenda/lib/main.css" rel="stylesheet" />
<script type="text/javascript" src="fullcalenda/lib/main.js"></script>
<script type="text/javascript" src="fullcalenda/lib/locales-all.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script> 
 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
  url: "./calendarcompanylist.do", 
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
      select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
    	  
    	  var starts=new Date(arg.start);
    	 
    	  modalTitle.html('일정 등록');
      	  console.log(arg);
      	  console.log(arg.startStr);
      	  console.log(arg.endStr); 
      	    
          editTitle.val('');
          editStart.val(dateFormat(arg.start));
          editEnd.val(dateFormat2(arg.end));
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

             if (eventData.title.trim() == '') {
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
                    "description": eventData.description,
                    "chk":"회사"
         		},
        		success : function(msg){
        			 if(doubleSubmitCheck()) return;
        			alert("회사일정 등록에 성공했습니다");
        			$('#content').load("./companyloadForm.do"); 
        		},
         		error : function() {
         			alert("회사일정 등록에 실패하셨습니다.");
         		}
         	});
         });
      	  
     },

      /*
    	//일정 등록	
    	  dateClick: function (arg) {
      	  	modalTitle.html('일정 등록');
      	  	
      	    
      	    
          editTitle.val('');
          editStart.val(dateFormat(arg.start));
          editEnd.val(dateFormat(arg.end));
      	    editType.val('');
      	    editDesc.val('');
      	    editColor.val('');
			
      	    addBtnContainer.show();
      	    modifyBtnContainer.hide();
      	    eventModal.modal('show');
    	
      },*/
      eventClick: function(arg) { // 있는 일정 클릭시, 
    	 
      	    if (arg.event.end == null) {
      	        arg.event.end = arg.event.start;
      	    }
          
      	    
      	    modalTitle.html('일정 수정');
      	    editTitle.val(arg.event.title);
      	    console.log(arg.event.start);
      	    console.log(arg.event.end);
      	  	editStart.val(dateFormat3(arg.event.start));
      	    editEnd.val(dateFormat3(arg.event.end));
      		console.log(arg.event.textColor);
      	 	console.log(arg.event.backgroundColor);
      	    editColortx.val(arg.event.textColor).css('color', arg.event.textColor);
      	    editColorbg.val(arg.event.backgroundColor).css('color', arg.event.backgroundColor);
      	 	console.log(arg.event.description);
      	 	console.log(typeof(data));
      	 	editDesc.val(arg.event.extendedProps.description);
      	    editid.val(arg.event.id);
      	    console.log(arg.event.id);
      	    console.log(editid.val());
      	    addBtnContainer.hide();
      	    modifyBtnContainer.show();
      	    eventModal.modal('show');

			
      	   $('#updateEvent').on('click', function () {
      		 if (editStart.val() > editEnd.val()) {
                 alert('끝나는 날짜가 앞설 수 없습니다.');
                 return false;
             }

             if (editTitle.val().trim() == '') {
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
                        "no":editid.val(),
                        "chk":"회사"
            		},
           		success : function(msg){
           		    if(doubleSubmitCheck()) return;
           			alert("회사일정 수정을 성공했습니다");
           			$('#content').load("./companyloadForm.do"); 
           		},
            		error : function() {
            			alert("회사일정 수정을 실패하셨습니다.");
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
         			"no":editid.val(),
         			"chk":"회사"
         		},
       	        success: function (msg) {
       	            alert('일정이 삭제되었습니다.');
       	            $('#content').load("./companyloadForm.do");
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
		
    <div id="calendar"></div>
    
    		<!-- 일정 추가 MODAL -->
        
  <div class="modal fade" id="reply" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">등록</h4>
          
        </div>
          <form action="" method="post" id="calendarinsert" class="form-margin">
          <input type="hidden" id="editid" name="editid">
         <div class="modal-body">
                       

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작</label>
                                <input class="inputModal" type="datetime-local" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">끝</label>
                                <input class="inputModal" type="datetime-local" name="edit-end" id="edit-end" />
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-colortx">글자색</label>
                                <input type="color" class="inputModal" name="edit-colortx" id="edit-colortx" style="width: 50px" value="#FFFAFA">                             
                                
                            </div>
                        </div>     
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-colorbg">배경색</label>
                                <input type="color" class="inputModal" name="edit-colorbg" id="edit-colorbg" style="width: 50px" value="#74c0fc">                             
                                
                            </div>
                        </div> 
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">설명</label>
                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
                                    id="edit-desc"></textarea>
                            </div>
                        </div>                   
                    </div>
                    
                    <div class="modal-footer modalBtnContainer-addEvent">
                    	<c:if test="${emp.dept_no == 10 }">
                    	<button type="button" class="btn btn-primary" id="save-event">저장</button>
                    	</c:if>
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>                        
                    </div>
                    
                     
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                    <c:if test="${emp.dept_no == 10 }">
                    	<button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    	<button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                     </c:if>
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                    </div>
                     
            </form>     
      </div>      
    </div>
  </div>	

  </body>
</html>