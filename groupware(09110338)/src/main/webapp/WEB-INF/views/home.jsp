<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<linK type="text/css" rel="stylesheet" href="${cpath }/resources/css/homeBoxes.css">
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
 
<div id="homeMain">
	<div id="MainBoxTop">
		<div id="profileBox">
			<a href="${cpath }/mypage"><img class="employeeImg" src="${cpath }/profileupload/${login.profile_fic }"></a>
			<div class="employeeInfo">${login.employee_name } ${login.job_name }</div>
			<div class="departInfo">${login.department }</div>
			<a  class="mseeageAtag" href="${cpath }/mail/receiveList"><div class="messageInfo"></div></a>
			<a class="logoutBtn" href="${cpath }/logout"><button>로그아웃</button></a>
		</div> <!-- end of profileBox -->
		<div id="boardBox">
			<div id="noticeBox"></div>
			<div id="suggestionBox"></div>
		</div>
		<div id="calBox"><a href="${cpath }/schedule/listall">전체일정</a><div id="calendar"></div></div>
	</div> <!-- end of mainBoxTop -->
	<div id="MainBoxBottom">
		<c:if test="${login.job_id <= 5}">
		<div id="approveBox"></div>
		</c:if>
		<c:if test="${login.job_id >= 6 }">
		<div id="waitAppBox"></div>
		</c:if>
		<div id="eventBox"></div>
	</div>
</div>

<script>
	document.addEventListener('DOMContentLoaded', homeAppList)
	document.addEventListener('DOMContentLoaded', waitAppList)
	document.addEventListener('DOMContentLoaded', boardLoad)
	document.addEventListener('DOMContentLoaded', () => {
		homeMessage();
   })
   
   async function homeMessage(event) {
      url = cpath + '/nReadMail'
      const result = await fetch(url).then(resp => resp.text())
      console.log(result)
      
      let tag = '새로운 쪽지:\u00A0\u00A0\u00A0'+result+'개'      
      
      const messageInfoElement = document.querySelector('.messageInfo');
        if (messageInfoElement) {
          messageInfoElement.textContent = tag;
        } else {
          console.error('.messageInfo 요소를 찾을 수 없습니다.');
        }
   }
	
	/* calander */
	document.addEventListener('DOMContentLoaded', function(){
	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      initialView: 'dayGridMonth',
	      locale: 'ko', // set Korean language
	      headerToolbar: {
	        start: "prev",
	        center: "title",
	        end: 'next'
	      },
	      selectable: true,
	      droppable: true,
	      editable: true,
	      events: [
	        // Use JSTL forEach to generate events dynamically
	       
	       
	      ],
	      eventDidMount: function(info) {				
	    		var gColor = '#72E9DA';
	    		var bColor = 'lightBlue';
	    		var rColor = '#FFC0D5';
	    		if (info.event.extendedProps.type == 'b') {
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
	     
	    });
	    calendar.render();
	  });
	
	
</script>

</body>
</html>