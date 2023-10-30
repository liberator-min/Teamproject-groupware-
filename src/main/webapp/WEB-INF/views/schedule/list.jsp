<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/schedule/schedule.css">

<div id="homeMain">
<div class="schedule_list_wrap">
<a href="${cpath }/schedule/listall"><button class="my_group_schedule_btn">Group Schedule</button></a>
<c:if test="${login.job_id >= 5}">
<button class="schedule_insert_btn" onclick="OpenWindow('${cpath}/schedule/insert','작성',400,800);">작성하기</button>
 </c:if>
 </div>
<div id="calendar"></div>
</div>


<script>
function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {

	winleft = (screen.width - WinWidth) / 2;
	wintop = (screen.height - WinHeight) / 2;
	var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth  
							+",height="+ WinHeight +",top="+ wintop +",left=" 
							+ winleft +",resizable=yes"  );
	win.focus() ; 
}

</script>

<script>
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth',
      locale: 'ko', // set Korean language
      headerToolbar: {
        start: "",
        center: "prev title next",
        end: 'dayGridMonth,dayGridWeek,dayGridDay'
      },
      selectable: true,
      droppable: true,
      editable: true,
      events: [
        // Use JSTL forEach to generate events dynamically
        <c:forEach items="${scheduleList}" var="schedule">
          {	
        	title : '${schedule.title}',
    		content : '${schedule.content}',
    		writer : '${schedule.writer}',
    		type : '${schedule.type}',
            start: '<fmt:formatDate value="${schedule.start_date}" pattern="yyyy-MM-dd" />',
            end: '<fmt:formatDate value="${schedule.end_date}" pattern="yyyy-MM-dd" />',
            extendedProps: {
                idx : '${schedule.schedule_idx}'
              }


            },
        </c:forEach>
      ],
      eventDidMount: function(info) {				
    		var gColor = 'lightGreen';
    		var bColor = 'lightBlue';
    		var rColor = '#e96a0d';
    		if (info.event.extendedProps.type == 'p') {
    			info.el.style.backgroundColor = gColor;
    		} else if(info.event.extendedProps.type == 'c') {
    			info.el.style.backgroundColor = bColor;
    		} else if(info.event.extendedProps.type == 'v') {
    			info.el.style.backgroundColor = rColor;	
    		}
    	},
      eventRender: function(info) {
        info.el.querySelector('.fc-event-title').textContent = info.event.title;
      },
      eventClick: function(arg) {
        var event = arg.event;
        var title = event.title;
        var content = event.extendedProps.content;
        var idx = event.extendedProps.idx;

        var url;
        if (idx) {
        	  url = '${cpath}/schedule/selectone/'+idx;
        	  console.log(url)
        	} 
		if(!idx){
			url ='${cpath}/schedule/list'
		}

        var winWidth = 500;
        var winHeight = 300;
        OpenWindow(url, 'Window Title', winWidth, winHeight);

        function OpenWindow(urlStr, winTitle, winWidth, winHeight) {
          var winLeft = (screen.width - winWidth) / 2;
          var winTop = (screen.height - winHeight) / 2;
          var win = window.open(urlStr, winTitle, "scrollbars=yes,width=" + winWidth + ",height=" + winHeight + ",top=" + winTop + ",left=" + winLeft + ",resizable=yes");
          win.focus();
        }
      }
    });
    calendar.render();
  });
</script>



</body>
</html>