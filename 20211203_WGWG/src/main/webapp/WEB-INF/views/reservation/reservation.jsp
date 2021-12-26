<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- fullcalendar CDN -->
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js"></script>
    <!-- fullcalendar 언어 CDN -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js"></script>
    <script>
$(function () {
    	function XMLToString(oXML) {
            //code for IE
            if (window.ActiveXObject) {
                var oString = oXML.xml;
                return oString;
            }
            // code for Chrome, Safari, Firefox, Opera, etc.
            else {
                return new XMLSerializer().serializeToString(oXML);
            }
        }
    	
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
        	height: '800px', // calendar 높이 설정
        	expandRows: true, // 화면에 맞게 높이 재설정
            slotMinTime: "09:00", // Day 캘린더에서 시작 시간
            slotMaxTime: "19:00", // Day 캘린더에서 종료 시간
        	headerToolbar: {
        		left: 'prev,next',
        		center: 'title',
        		right: 'timeGridWeek,timeGridDay'
        },
          initialView: 'timeGridWeek',
          navLinks: false, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
          editable: false, // 수정 가능?
       	  selectMirror: true,
          selectable: true, // 달력 일자 드래그 설정가능
          nowIndicator: true, // 현재 시간 마크
          dayMaxEvents: false, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
          locale: 'ko', // 한국어 설정
          hiddenDays: [ 0, 6 ],
          eventDidMount: function(arg){
             
           },
           datesSet: function(dateInfo){
               calendar.removeAllEvents();
                let url = "chkReservation.do";
				let room_no = $("select[name=roomselect]").val();
				console.log(room_no);
				$.get(url, { "room_no": room_no }, function (data) {//회의실 번호 별 예약내역 확인(페이지 접속 시 확인 가능(default 1번))
                    var reservation = $(data).find("reservation");
                    if ($(reservation).length > 0) {
                        $(reservation).each(function (idx, item) {
                            var rsvtime = $(item).find("res_dt").text();
                            var rsvendtime = $(item).find("res_et").text();
                            var title = $(item).find("title").text();
                            if (rsvtime != "") {
                                calendar.addEvent({
                                    title: title,
                                    start: rsvtime,
                                    end: rsvendtime,
                                    classNames: ["rsv"],
                                    textColor: "black",
                                });
                            }
                        });
                    }
                });
				$('#roomList').change(function(){
					calendar.removeAllEvents();
					let room_no = $("select[name=roomselect]").val();
					console.log(room_no);
					$.get(url, { "room_no": room_no }, function (data) {//회의실 번호 별 예약내역 확인
	                    var reservation = $(data).find("reservation");
	                    if ($(reservation).length > 0) {
	                        $(reservation).each(function (idx, item) {
	                            var rsvtime = $(item).find("res_dt").text();
	                            var rsvendtime = $(item).find("res_et").text();
	                            var title = $(item).find("title").text();
	                            if (rsvtime != "") {
	                                calendar.addEvent({
	                                    title: title,
	                                    start: rsvtime,
	                                    end: rsvendtime,
	                                    classNames: ["rsv"],
	                                    textColor: "black",
	                                });
	                            }
	                        });
	                    }
	                });
					
				});
           },
           select: function(date){
        	   console.log(date.startStr);
        	   console.log(date.endStr);
        	   var view = date.dayEl;
        	   console.log(view);
        	   if (
                       $(view).hasClass("fc-day-sun") ||
                       $(view).hasClass("weekend") ||
                       $(view).hasClass("fc-day-sat")
                   ) {
                       alert("해당 시간은 신청할 수 없습니다.");
                   } else {
                	   $('.myModal').fadeIn();
                	  var reason = prompt("사용 목적을 입력해주세요");
                	  var date = {"st": date.startStr, "et":date.endStr, "reason": reason};
                	  if(reason){
                		  $.ajax({
                  	        url:"rsv_input",
                  	        type:'POST',
                  	        data: date,
                  	        success:function(data){
                  	        	calendar.addEvent( {
                  	        		title: reason, 
                  	        		start: date.startStr,
                  	        		end: date.endStr,
                  	                textColor: "black",
                  	                classNames: ["rsv"],
                  	        	});
                  	        },error:function(request,status,error){
                  	          alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                  	       },
                  	    });
                	  } else {
                		  return false;
                	  }
                   }
           }
        });
        // 캘린더 랜더링
        calendar.render();
    });
    
    </script>
  </head>
  <style>
    	#calendar {
    		width: 900px;
    	}
    	.content {
    		margin-top: 80px;
			margin-left: 230px;
			padding: 50px;
    	}
    	a {
    		text-decoration: none !important;
    	}
    	
            th .fc-scrollgrid-sync-inner {
                background-color: #073865;
            }
            a.fc-col-header-cell-cushion {
                color: white;
            }
            .fc-timegrid-day-number {
                color: #073865;
            }
            .fc-day-past .fc-daygrid-day-number,
            .fc-day-today .fc-daygrid-day-number,
            .fc-day-sat div a,
            .fc-day-sun div a,
            .rest div a{
                color: #b8b8b8;
            }
            .fc .fc-daygrid-day.fc-day-today {
                background-color: rgba(255, 255, 255, 0);
            }
            .fc-header-toolbar {
                padding-top: 1em;
                padding-left: 1em;
                padding-right: 1em;
            }
            .fc-h-event {
           		border: none;
           		text-align: center;
            }
      .fmenu{
         padding-left: 0px;
      }
      .fmenu li:not(.fmenu li:first-child)::before{
         content: ">";
      }
      .rsv {
      	background-color: #fff396;
      	border: none;
      }
    </style>
  <body>
  		<div class="content">
  			<select name="roomselect" id="roomList">
  				<c:forEach var="room" items="${roomList}">
  					<option class="room_no" value="${room.room_no}">${room.room_nm}</option>
  				</c:forEach>
  			</select>
  			<div id="calendar"></div>
  		</div>
  		
 </body>
 </html>