<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" type="text/javascript"></script>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/schedule/schedule.css">
<html>
<body>

<div id="schedule_insert_box">
	<div id="schedule_insert_box_wrap">
		<div class="schedule_insert_title">제목</div>	
			<div class="schedule_insert_title_input"><input type="text" name="title" placeholder="제목을 입력해주세요"/></div>
		<div class="schedule_insert_writer">작성자</div>
		<div class="schedule_insert_writer_input"><input type="text" name="writer" value="${login.employee_name }"/></div>
			<div class="schedule_insert_type">타입</div>
				<select class="schedule_insert_type_select" name="type">
					<option class="schedule_insert_type_option" value="p">출장</option>
					<option class="schedule_insert_type_option" value="b" selected>업무</option>
					<option class="schedule_insert_type_option" value="v">휴가</option>
				</select> 	
		<div class="schedule_insert_department">부서</div>  
			<div class="schedule_insert_department_input"><input type="text" name="department" value="${login.department }"readonly/></div>
		<div class="schedule_insert_start_date">시작일</div>
		    <div class="schedule_insert_start_date_input"><input type="date" name="start_date"></div>
		<div class="schedule_insert_end_date">종료일</div>
		  	<div class="schedule_insert_end_date_input"><input type="date" name="end_date"></div>
		<div class="schedule_insert_content">내용</div>
			<div><textarea class="schedule_insert_content_input" rows="5" cols="5" name="content" placeholder="내용을 입력해주세요"></textarea></div>
	</div>
	<div class="schedule_send_wrap">
		<button id="schedule_send" onclick="scheduleinsertsend()">등록</button>
	</div>
</div>




<script>
function scheduleinsertsend(){
	const title = $('input[name=title]').val();
	const content = $('textarea[name=content]').val();
	const writer = $('input[name=writer]').val();
	const type = $('select[name=type]').val();
	console.log(type)
	
	const department = $('input[name=department]').val();
	const start_date = $('input[name=start_date]').val();
	const end_date = $('input[name=end_date]').val();
	console.log(title)
	if(title.trim() === "" || content.trim() === "" || writer.trim() === "" || type.trim() === "" || department.trim() === "" || start_date.trim() ==="" ||  end_date.trim() === "" ){
		alert('값이 비어있습니다 모든 값을 넣어주세요')
	}
	else{
		$.ajax({
		       type: 'POST',
		       url: '${cpath}/schedule/insert',
		       data:{ title : title,      
					content : content,
					writer : writer,
					department : department,
		        	start_date : start_date,
					end_date : end_date,
		        	type :type
			 
		},
		         success: function (data) {
					alert("전달성공")
		            window.close();
					opener.parent.location.reload();
		
		        }, error: function (jqXHR, textStatus, errorThrown) {
		          alert(jqXHR + ' ' + textStatus.msg);
		       }
		
		
		});
	}
}


</script>
</body>
</html>