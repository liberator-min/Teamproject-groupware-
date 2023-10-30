<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
 <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
 <link type="text/css" rel="stylesheet" href="${cpath }/resources/css/schedule/schedule.css">


<c:if test="${login.job_id >=6}">
      <button class="btn btn-primary" onclick="OpenWindow('${cpath}/schedule/update/${schedule.schedule_idx }','수정',800,800);">수정</button>
      <button id="delete" onclick="scheduledelete()">삭제</button>
   </c:if>

<div class="selectAllOne-box">
	<table class="selectAllOne-table">
	
	     <tr>
	       <th style="text-align:center;" class="">제목</th>
	        <td style="display:none" class="modal_content">
	           
	         </td>
	         <td class="modal_content">
	             ${schedule.title }
	         </td>
	     </tr>
	     <tr>
	       <th style="text-align:center;" class="">내용</th>
	         <td class="modal_content">
	          ${schedule.content }
	         </td>
	     </tr>
	     <tr>
	         <th style="text-align:center;" class="">작성자</th>
	         <td class="modal_content">
	          ${schedule.writer}
	         </td>
	     </tr>
	     <tr>
	       <th style="text-align:center;" class="">기간</th>
	         <td class="modal_content">
	          ${schedule.start_date } ~ ${schedule.end_date }
	         </td>
	     </tr>
	</table>
</div>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" type="text/javascript"></script>

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
function scheduledelete(){
   
   
   $.ajax({
          type: 'POST',
          url: '${cpath}/schedule/delete',
          data:{
                idx : ${schedule.schedule_idx}   
   },
            success: function (data) {
            alert("삭제성공")
               window.close();
            opener.parent.parent.location.reload();
   
           }, error: function (jqXHR, textStatus, errorThrown) {
             alert(jqXHR + ' ' + textStatus.msg);
          }
   
   
   });
       
}
</script>


</body>
</html>