//월간 달력 사용자 테마
var MONTHLY_CUSTOM_THEME = {
'month.schedule.borderRadius': '5px',
'month.schedule.height': '18px',
'month.schedule.marginTop': '2px',
'month.schedule.marginLeft': '10px',
'month.schedule.marginRight': '10px',
};

//캘린더 띄우기
var cal = new tui.Calendar('#calendar', {
	defaultView:'month',
//	 month: {
//    workweek: true // 주말 없는 월간 달력
//  },
	theme: MONTHLY_CUSTOM_THEME,
	taskView: false,    
    scheduleView: true,  
	useCreationPopup: true,
	useDetailPopup: true
}); 

//캘린더 이동 버튼
$('span#menu-navi > .btn').on('click', function (e) {
    var action = $(this).data('action');
    var year, month;
    switch (action) {
        case 'move-prev': //이전
        	cal.prev();
            break;
        case 'move-next': //다음
        	cal.next();
            break;
        case 'move-today': //오늘
        	cal.today();
            break;
		case 'move-time' : //일간
		 	cal.changeView('day', true); 
			break;
		case 'move-1week' :	//1주
		 	cal.changeView('week', true);  
			break;
        case 'move-2week': //2주 달력 보기
        	cal.setOptions({month: {visibleWeeksCount: 2}}, true);
        	cal.changeView('month', true);
        	break;
        case 'move-month': //월간 달력 보기
        	cal.setOptions({month: {visibleWeeksCount: null}}, true);
        	cal.changeView('month', true);
        	break;
        default:
            return;
    }
    setRenderRangeText(cal);

    e.stopPropagation();
    e.preventDefault();
    e.stopImmediatePropagation();
});

//오늘 연월(일) 찍기
function setRenderRangeText(cal) {
    var renderRange = document.getElementById('renderRange');
    var options = cal.getOptions();
    var viewName = cal.getViewName();
    var html = [];
    if (viewName === 'day') {
        html.push(moment(cal.getDate().getTime()).format('YYYY.MM.DD'));
    } else if (viewName === 'month' &&
        (!options.month.visibleWeeksCount || options.month.visibleWeeksCount > 4)) {
        html.push(moment(cal.getDate().getTime()).format('YYYY.MM'));
    } else {
        html.push(moment(cal.getDateRangeStart().getTime()).format('YYYY.MM.DD'));
        html.push(' ~ ');
        html.push(moment(cal.getDateRangeEnd().getTime()).format(' MM.DD'));
    }
    renderRange.innerHTML = html.join('');
}

//카테고리 리스트
function getUserData() {
    var users = [];
    var names = ['A', 'B', 'C', 'D', 'E']; // 카테고리 별 이름 설정
    var colors = ['#9e5fff', '#00a9ff', '#ff5583', '#03bd9e', '#bbdc00']; //카테고리 별 색깔 설정
    var employ_type = ['regular', 'regular', 'regular', 'regular', 'regular']
    for (var i = 0; i < 5; i++) { //카테고리 수 만큼
        var user = {
            'name': names[i],
            'id': String(i + 1),
            'employ_type': employ_type[i],
            'color': colors[i]
        };
        users.push(user);
    }
    return users;
}

function renderLNB(users) {
    var template = $('#template-lnb-calendars-item').html();
    Mustache.parse(template);   // optional, speeds up future uses
    var rendered = Mustache.render(template, {'users': users});
    $('#calendarList').html(rendered);
}

//카테고리 리스트 체크 박스
function addLNBListener(users, cal) {
    $('div.lnb-calendars-item > label').off('click');
    $('div.lnb-calendars-item > label').on('click', function (e) {
        var id = $(this).find('input').val();
        var $firstSpan = $(this).find('span').first();
        var visible = $firstSpan.data('visible');
        if (visible == 'visible') {
            $firstSpan.css('background-color', 'transparent');
            cal.toggleSchedules(id, true, true);
            $firstSpan.data('visible', 'hidden');
        } else {
            $firstSpan.css('background-color', $firstSpan.css('border-color'));
            cal.toggleSchedules(id, false, true);
            $firstSpan.data('visible', 'visible');
        }
        e.stopPropagation();
        e.preventDefault();
        e.stopImmediatePropagation();
    });
}

//카테고리 별 캘린더 (일정등록 팝업창에 카테고리 리스트 표시)
var CalendarList = undefined;

function getCalendars(users) {
    var calendars = [];
    for (var user of users) {
        calendars.push({
            id: user['id'],
            name: user['name'],
            color: '#ffffff',
            bgColor: user['color'],
            dragBgColor: user['color'],
            borderColor: user['color'],
            checked: true
        })
    }
    CalendarList = calendars;
    return calendars;
}

//캘린더에 대한 것?
'use strict';

var CalendarList = [];

function CalendarInfo() {
	this.id = null;
    this.name = null;
    this.checked = true;
    this.color = null;
    this.bgColor = null;
    this.borderColor = null;
    this.dragBgColor = null;
}

function addCalendar(calendar) {
    CalendarList.push(calendar);
}

function findCalendar(id) {
    var found;

    CalendarList.forEach(function(calendar) {
        if (calendar.id === id) {
            found = calendar;
        }
    });

    return found || CalendarList[0];
}

function hexToRGBA(hex) {
    var radix = 16;
    var r = parseInt(hex.slice(1, 3), radix),
        g = parseInt(hex.slice(3, 5), radix),
        b = parseInt(hex.slice(5, 7), radix),
        a = parseInt(hex.slice(7, 9), radix) / 255 || 1;
    var rgba = 'rgba(' + r + ', ' + g + ', ' + b + ', ' + a + ')';

    return rgba;
}

$(document).ready(function () {
	var users = getUserData();
    renderLNB(users);
    var calendars = getCalendars(users); /* 카테고리 달력 */
    cal.setCalendars(calendars);  /* 카테고리  달력 */
    addLNBListener(users, cal);
    setRenderRangeText(cal);
  
  //저장된 일정 불러오기    
		$.ajax({
		url : "./load.do",
		type : "post",
		dataType : "json",
		success : function(msg){
			console.log(msg);
			$.each(msg,function(key,value){
				   cal.createSchedules([
			         {
				 		id: value.empno,
			           calendarId: '1',
			           title: value.scheduletitle,
			           category: value.allday,
			           start: value.start,
			           end: value.end		
    
		         }]);
			});
		},
		error : function() {
			alert("잘못된 요청입니다.");
		}
	});
}); 

//스케줄에 대한 것
(function(window, Calendar) {

    // event handlers
    cal.on({
        'clickMore': function(e) {
            console.log('clickMore', e);
        },
        'clickDayname': function(date) {
            console.log('clickDayname', date);
        },
        'afterRenderSchedule': function(e) {
            var schedule = e.schedule;
            var element = cal.getElement(schedule.id, schedule.calendarId);
//          console.log('afterRenderSchedule', element);
        },
        'clickTimezonesCollapseBtn': function(timezonesCollapsed) {
            console.log('timezonesCollapsed', timezonesCollapsed);

            if (timezonesCollapsed) {
                cal.setTheme({
                    'week.daygridLeft.width': '77px',
                    'week.timegridLeft.width': '77px'
                });
            } else {
                cal.setTheme({
                    'week.daygridLeft.width': '60px',
                    'week.timegridLeft.width': '60px'
                });
            }
            return true;
        }
    });
    
    //일정 삭제
    cal.on('beforeDeleteSchedule',scheduleData => {
         
    	 var schedule = scheduleData.schedule;
    	 console.log(scheduleData.schedule);
         
         calendarId= schedule.calendarId;
         id= schedule.id;
         title= schedule.title;
         isAllDay= scheduleData.isAllDay;
         start = JSON.stringify(scheduleData.start);
         end = JSON.stringify(scheduleData.end);
         category = schedule.category;
         color = schedule.color;
         bgColor = schedule.bgColor;
         borderColor = schedule.borderColor;
         
         var con = confirm('일정을 삭제하시겠습니까?', schedule);
         if(con == true){
	         $.ajax({
	     		url : "./delete.do",
	     		type : "post",
	     		dataType : "json",
	     		data :
	     		{
	     			"id" : id
	     		},
	 	   		success : function(msg){
	 	   	        refreshScheduleVisibility();
	 	   	        console.log('beforeDeleteSchedule', [schedule]);
	 	   	        
	 	   	    	cal.deleteSchedule(schedule.id, schedule.calendarId);
	 	   		},
 	    		error : function() {
 	    			alert("잘못된 요청입니다.");
 	    		}
 	    	});
	   	 }else{
   	    	return false;
   	    }
    });
    
    //일정 수정
    cal.on('beforeUpdateSchedule', function(event) {
        var schedule = event.schedule;
        var changes = event.changes;

        cal.updateSchedule(schedule.id, schedule.calendarId, changes);
        if(changes.isAllDay == null) {
        	changes.isAllDay = schedule.isAllDay;
        }
        if(changes.calendarId == null) {
        	changes.calendarId = schedule.calendarId;
        }
        if(changes.title == null) {
        	changes.title = schedule.title;
        }
        
        $.ajax({
    		url : "./update.do",
    		type : "post",
    		dataType : "json",
    		data :
    		{
    			"calendarId" : changes.calendarId,
    			"id" : schedule.id,
    			"title" : changes.title,
    			"category" : changes.isAllDay?'allday':'time',
    			"start" : JSON.stringify(schedule.start),
    			"end" : JSON.stringify(schedule.end)
    		},
	   		success : function(msg){
	   			console.log('beforeUpdateSchedule', [schedule]);
	   			console.log('beforeUpdateSchedule', [changes]);
	   		},
	    		error : function() {
	    			alert("잘못된 요청입니다.");
	    		}
	    	});
    });
    
    //일정 등록
    cal.on('beforeCreateSchedule', scheduleData => {
//    	var calendar = scheduleData.calendar || findCalendar(scheduleData.calendarId);
        const schedule = {
//        calendarId: calendar.id,
		  calendarId: scheduleData.calendarId,
          id: String(Math.random() * 100000000000000000),
          title: scheduleData.title,
          isAllDay: scheduleData.isAllDay,
          start: scheduleData.start,
          end: scheduleData.end,
          category: scheduleData.isAllDay ? 'allday' : 'time'
        };
        
        calendarId= schedule.calendarId;
        id= schedule.id;
        title= scheduleData.title;
        isAllDay= scheduleData.isAllDay;
        start = JSON.stringify(scheduleData.start);
        end = JSON.stringify(scheduleData.end);
        category = schedule.category;
        color = schedule.color;
        bgColor = schedule.bgColor;
        borderColor = schedule.borderColor;
        
        $.ajax({
    		url : "./save.do",
    		type : "post",
    		dataType : "json",
    		data :
    		{
    			"calendarId" : calendarId,
    			"id" : id,
    			"title" : title,
    			"isAllDay" : isAllDay,
    			"start" : start,
    			"end" : end,
    			"category" : category
    		},
   		success : function(msg){
   	         cal.createSchedules([schedule]);
   	         console.log('beforeCreateSchedule', [schedule]);
   		},
    		error : function() {
    			alert("잘못된 요청입니다.");
    		}
    	});
  });
    
    //?
    function saveNewSchedule(scheduleData) {
        console.log('scheduleData ', scheduleData)
        var calendar = scheduleData.calendar || findCalendar(scheduleData.calendarId);
        var schedule = {
    		id: String(Math.random() * 100000000000000000),
            calendarId: '1',
            title: scheduleData.title,
            isAllDay: scheduleData.isAllDay,
            start: scheduleData.start,
            end: scheduleData.end,
            category: scheduleData.isAllDay ? 'allday' : 'time',
            // dueDateClass: '',
            color: calendar.color,
            bgColor: calendar.bgColor,
            dragBgColor: calendar.bgColor,
            borderColor: calendar.borderColor,
            location: scheduleData.location,
            // raw: {
            //     class: scheduleData.raw['class']
            // },
            // state: scheduleData.state
        };
        if (calendar) {
            schedule.calendarId = calendar.calendarId;
            schedule.id = calendar.id;
            schedule.color = calendar.color;
            schedule.bgColor = calendar.bgColor;
            schedule.borderColor = calendar.borderColor;
        }

        cal.createSchedules([schedule]);

        refreshScheduleVisibility();
    }
    
    //timetemplate
    function getTimeTemplate(schedule, isAllDay) {
        var html = [];
        var start = moment(schedule.start.toUTCString());
        if (!isAllDay) {
            html.push('<strong>' + start.format('HH:mm') + '</strong> ');
        }
        if (schedule.isPrivate) {
            html.push('<span class="calendar-font-icon ic-lock-b"></span>');
            html.push(' Private');
        } else {
            if (schedule.isReadOnly) {
                html.push('<span class="calendar-font-icon ic-readonly-b"></span>');
            } else if (schedule.recurrenceRule) {
                html.push('<span class="calendar-font-icon ic-repeat-b"></span>');
            } else if (schedule.attendees.length) {
                html.push('<span class="calendar-font-icon ic-user-b"></span>');
            } else if (schedule.location) {
                html.push('<span class="calendar-font-icon ic-location-b"></span>');
            }
            html.push(' ' + schedule.title);
        }

        return html.join('');
    }
    
    //?
    /*
    function onNewSchedule() {
        var title = $('#new-schedule-title').val();
        var location = $('#new-schedule-location').val();
        var isAllDay = document.getElementById('new-schedule-allday').checked;
        var start = datePicker.getStartDate();
        var end = datePicker.getEndDate();
        var calendar = selectedCalendar ? selectedCalendar : CalendarList[0];

        if (!title) {
            return;
        }

        console.log('calendar.id ', calendar.id)
        cal.createSchedules([{
            id: String(Math.random() * 100000000000000000),
            calendarId: calendar.calendarId,
            title: title,
            isAllDay: isAllDay,
            start: start,
            end: end,
            category: isAllDay ? 'allday' : 'time',
            dueDateClass: '',
            color: calendar.color,
            bgColor: calendar.bgColor,
            dragBgColor: calendar.bgColor,
            borderColor: calendar.borderColor,
            raw: {
                location: location
            },
//            state: 'Busy'
        }]);
        console.log(calendar.color);

        $('#modal-new-schedule').modal('hide');
    }
    */
    
    //?
    function onChangeNewScheduleCalendar(e) {
        var target = $(e.target).closest('a[role="menuitem"]')[0];
        var calendarId = getDataAction(target);
        changeNewScheduleCalendar(calendarId);
    }

    function changeNewScheduleCalendar(calendarId) {
        var calendarNameElement = document.getElementById('calendarName');
        var calendar = findCalendar(calendarId);
        var html = [];

        html.push('<span class="calendar-bar" style="background-color: ' + calendar.bgColor + '; border-color:' + calendar.borderColor + ';"></span>');
        html.push('<span class="calendar-name">' + calendar.name + '</span>');

        calendarNameElement.innerHTML = html.join('');

        selectedCalendar = calendar;
    }

    //아마도 new schedule 버튼(#btn-new-schedule) 만들면 오늘 날짜에 일정 들록 팝업창 뜨는 것 - 구현 안 함
    /*
    function createNewSchedule(event) {
        var start = event.start ? new Date(event.start.getTime()) : new Date();
        var end = event.end ? new Date(event.end.getTime()) : moment().add(1, 'hours').toDate();

        if (useCreationPopup == true) {
            cal.openCreationPopup({
                start: start,
                end: end
            });
        }
    }
    */
    
    function refreshScheduleVisibility() {
        var calendarElements = Array.prototype.slice.call(document.querySelectorAll('#calendarList input'));
        
        CalendarList.forEach(function(calendar) {
            cal.toggleSchedules(calendar.id, !calendar.checked, false);
        });

        cal.render(true);

        calendarElements.forEach(function(input) {
            var span = input.nextElementSibling;
            span.style.backgroundColor = input.checked ? span.style.borderColor : 'transparent';
        });
    }
    
    //오늘 연월 찍기 - 다른 형태
    /*
    function setRenderRangeText() {
        var renderRange = document.getElementById('renderRange');
        var options = cal.getOptions();
        var viewName = cal.getViewName();
        var html = [];
        if (viewName === 'day') {
            html.push(moment(cal.getDate().getTime()).format('MMM YYYY DD'));
        } else if (viewName === 'month' &&
            (!options.month.visibleWeeksCount || options.month.visibleWeeksCount > 4)) {
            html.push(moment(cal.getDate().getTime()).format('MMM YYYY'));
        } else {
            html.push(moment(cal.getDateRangeStart().getTime()).format('MMM YYYY DD'));
            html.push(' ~ ');
            html.push(moment(cal.getDateRangeEnd().getTime()).format(' MMM DD'));
        }
        renderRange.innerHTML = html.join('');
    }
    */

   

    function setEventListener() {
//         $('.dropdown-menu a[role="menuitem"]').on('click', onClickMenu);
        // $('#lnb-calendars').on('change', onChangeCalendars);

//        $('#btn-save-schedule').on('click', onNewSchedule);
//        $('#btn-new-schedule').on('click', createNewSchedule);

        $('#dropdownMenu-calendars-list').on('click', onChangeNewScheduleCalendar);
        window.addEventListener('resize', resizeThrottled);
    }
    
    function getDataAction(target) {
        return target.dataset ? target.dataset.action : target.getAttribute('data-action');
    }
    resizeThrottled = tui.util.throttle(function() {
        cal.render();
    }, 50);
    window.cal = cal;

//    setDropdownCalendarType();
//    setRenderRangeText();
//    setSchedules();
    setEventListener();
})(window, tui.Calendar);