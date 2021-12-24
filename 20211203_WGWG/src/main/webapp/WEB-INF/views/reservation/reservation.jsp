<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <style>
    	.main {
    		margin: 0 auto;
    		max-width: 1200px;
    		display: flex;
    	}
    	#calendar {
    		width: 1000px;
    		margin: 20px;
    	}
    	.content {
    		margin: 20px;
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
            .fc-daygrid-day-number {
                color: #073865;
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
            slotMaxTime: "19:00", // Day 캘린더에서 종료 시간
        	headerToolbar: {
        		left: 'prev,next today',
        		center: 'title',
        		right: 'dayGridMonth,listWeek'
        },
          initialView: 'dayGridMonth',
          navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
          editable: true, // 수정 가능?
       	  selectMirror: true,
          selectable: true, // 달력 일자 드래그 설정가능
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
           }     
        });
        calendar.render();
   
    });
    
    </script>
  </head>
  <body>
		<div class = "content">
   			<div id="calendar"></div>
 		</div>
