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
    <script class="cssdesk" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.0/moment.min.js" type="text/javascript"></script>
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
          nowIndicator: false, // 현재 시간 마크
          dayMaxEvents: false, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
          locale: 'ko', // 한국어 설정
          hiddenDays: [ 0, 6 ],
          eventDidMount: function(arg){
             
           },
           datesSet: function(dateInfo){
        	   $('#roomList').change(function(){
               calendar.removeAllEvents();
               let room_no = $("select[name=roomselect]").val();
                let url = "chkReservation.do";
				$.get(url, { "room_no": room_no }, function (data) {//회의실 번호 별 예약내역 확인
                    var reservation = $(data).find("reservation");
                    if ($(reservation).length > 0) {
                        $(reservation).each(function (idx, item) {
                            var rsvtime = $(item).find("res_dt").text();
                            var rsvendtime = $(item).find("res_et").text();
                            var title = $(item).find("title").text();
                            if (rsvtime != "" && rsvendtime != "") {
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
           selectOverlap: function(event) {
        	   
       	    return false;
       	  },
           select: function(date){
        	   var room_no = $("select[name=roomselect]").val();
        	   if(room_no == 0){
        		   alert("회의실을 선택해주세요");
        		   return false;
        	   } else {
        		   console.log(date.startStr);
            	   console.log(date.endStr);
               	  var reason = prompt("사용 목적을 입력해주세요");
                    	  if(reason){
                    		  var rsvdate = {"room_no": room_no, "res_dt":  moment(date.startStr).format('YYYY-MM-DD HH:mm'), "res_et":moment(date.endStr).format('YYYY-MM-DD HH:mm'), "res_title": reason};
                           	  
                    		  $.ajax({
                      	        url:"insertReservation.do",
                      	        type:'POST',
                      	        data: rsvdate,
                      	        success:function(data){
                      	        	console.log(data);
                      	        	calendar.addEvent( {
                      	        		title: reason, 
                      	        		start: rsvdate.res_dt,
                      	        		end: rsvdate.res_et,
                      	                textColor: "black",
                      	                classNames: ["rsv"],
                      	                color: "#fff396",
                      	        	});
                      	        },error:function(request,status,error){
                      	          alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                      	       },
                      	    });
                    	  } else {
                    		  alert("사용목적은 필수로 입력해야 합니다");
                    		  return false;
                    	  } 
        	   }
        	   
           }
        });

//캘린더 렌더링
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
  				<option class="room_no" value="0">회의실 선택하기</option>
  				<c:forEach var="room" items="${roomList}">
  					<option class="room_no" value="${room.room_no}">${room.room_nm}</option>
  				</c:forEach>
  			</select>
  			<div id="calendar"></div>
  		</div>
  		
 </body>
 </html>