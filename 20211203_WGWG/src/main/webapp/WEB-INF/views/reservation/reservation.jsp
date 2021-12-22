<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="css/default.css" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>

        <!-- fullcalendar CDN -->
        <link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css" rel="stylesheet"/>
        <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js"></script>
        <!-- fullcalendar 언어 CDN -->
        <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js"></script>
    <style>
    	.main {
    		margin: 0 auto;
    		max-width: 1200px;
    		display: flex;
    	}
    	#calendar {
    		width: 800px;
    		margin: 20px;
    	}
    	.content {
    		margin: 20px;
    	}
    	a {
    		text-decoration: none !important;
    	}
    	
            th .fc-scrollgrid-sync-inner {
                background-color: #468c91;
            }
            a.fc-col-header-cell-cushion {
                color: white;
            }
            .fc-daygrid-day-number {
                color: #468c91;
            }
            .rest,
            .fc-day-past .fc-daygrid-day-number,
            .fc-day-today .fc-daygrid-day-number,
            .fc-day-sat div a,
            .fc-day-sun div a,
            .rest div a {
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
            }
            .home-img{
         background-image: url("img/home.png");
          background-size: cover;
          background-position: center;
          background-repeat: no-repeat;
          width: 20px;
          height: 20px;
      }
      .fmenu{
         padding-left: 0px;
      }
      .fmenu li:not(.fmenu li:first-child)::before{
         content: ">";
      }
    </style>
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
            slotMaxTime: "19:59", // Day 캘린더에서 종료 시간
        	headerToolbar: {
        		left: 'prev,next today',
        		center: 'title',
        		right: 'dayGridMonth,listWeek'
        },
          initialView: 'dayGridMonth',
          navLinks: false, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
          editable: false, // 수정 가능?
       	  selectMirror: true,
          selectable: false, // 달력 일자 드래그 설정가능
          nowIndicator: true, // 현재 시간 마크
          dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
          locale: 'ko', // 한국어 설정
          eventDidMount: function(arg){
              var el = $(arg.el).closest("td.fc-day");
              $(el).addClass("rest");
              console.log(el);
           },
           datesSet: function(dateInfo){
               calendar.removeAllEvents();
                calendar.addEvent({
                    title: "주말",
                    daysOfWeek: ["0", "6"],
                    color : "rgb(243, 243, 243)",
                    textColor : "black",
                    classNames: ["rest-children"],
                });
                let url = "dschedule";
				let dcode = "${dcode}";
                $.get(url, { dcode: dcode }, function (data) {
                	console.log(XMLToString(data));
                    var schedule = $(data).find("schedule");
                    if (schedule.length > 0) {
                        $(schedule).each(function (idx, item) {
                            var restdate = $(item)
                                .find("restdate")
                                .text();
                            var day = $(item).find("day").text();

                            if (restdate != "") {
                                calendar.addEvent({
                                    title: "휴진",
                                    start: restdate,
                                    color : "rgb(243, 243, 243)",
                                    textColor : "black",
                                    classNames: ["rest-children"],
                                });
                            }
                            else if (day != "") {
                            	console.log(String(Number(day) - 1));
                                calendar.addEvent({
                                    title: "휴진",
                                    color: "rgb(243, 243, 243",
                                    textColor: "black",
                                    daysOfWeek: [String(Number(day) - 1)],
                                    classNames: ["rest-children"],
                                });
                            }
                        });      
                    }
                    var rsv = $(data).find("rsv");
                    if (rsv.length > 0) {
                        $(rsv).each(function (idx, item) {
                            var rsvdate = $(this)
                                .text();
                            calendar.addEvent({
                                title: "예약 있음",
                                start: rsvdate,
                                color : "white",
                                textColor : "rgb(70, 145, 140)",
                                classNames: ["rest-children"],
                            
                        });  
                    })
                    }
                    var waitSchedule = $(data).find("waitSchedule");
                    if(waitSchedule.length > 0){
                    	$(waitSchedule).each(function (idx, item) {
                            var restdate = $(item)
                                .find("restdatewait")
                                .text();
                            if (restdate != "") {
                                calendar.addEvent({
                                    title: "휴진 승인 대기",
                                    start: restdate,
                                    classNames: ["rest-children"],
                                    color: "#FFD700",
                  	                textColor: "black", 
                                });
                            }
                        });	
                    }
                    var denSchedule = $(data).find("denSchedule");
                    if(denSchedule.length > 0){
                    	$(denSchedule).each(function (idx, item) {
                            var restdate = $(item)
                                .find("restdateden")
                                .text();
                            if (restdate != "") {
                                calendar.addEvent({
                                    title: "승인 거절",
                                    start: restdate,
                                    classNames: ["rest-children"],
                                    color: "white",
                  	                textColor: "rgb(70, 145, 140)", 
                                });
                            }
                        });	
                    }
                    
                    
                });
            }
        });
        calendar.render();
   
    });
    
    </script>
  </head>
  <body>
  	<div class = "main">
  		<div class = "content">
  			<ul class="fmenu">
            	<li><div class="home-img"></div></li>
            	<li>업무관리</li>
            	<li>진료 스케줄 조회</li>
            </ul>
  		  	<h1>진료 스케줄 조회</h1>
    		<div id="calendar"></div>
  		</div>
  	</div>
