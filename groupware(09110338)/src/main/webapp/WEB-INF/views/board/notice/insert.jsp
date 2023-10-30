<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/board/insert.css">

<c:if test="${login.job_id < 5}">
	<script>
		alert('접근 권한이 없습니다')
		history.go(-1)
	</script>
</c:if>

<div id="homeMain">
	<div id="bd_wrtieHead"><h1>게시글 작성</h1></div>
	<hr>
	
	<div id="bd_writeContent">
		 <form method="POST" name="bd_writeBody" enctype="multipart/form-data" action="${cpath }/upload">
		 <input type="hidden" name="employee_idx" value="${login.employee_idx }">
		 <input type="text" name="board_category" value="공지사항" hidden="true">
		 	<div id="bd_writeTitle">
		 		<div class="gongji">공지사항</div>
		 		<div class="bd_writeTitle"><input type="text" name="board_title" placeholder="제목을 입력하세요" required="required" autocomplete="off"></div>
		 	</div>
		 	<div id="bd_noticeText">
		 		<textarea class="bd_noticeText" name="board_content" placeholder="내용을 입력하세요" required></textarea>
		 	</div>
		 	<div class="bd_fileSubmit">
		 		<p>🗃️&emsp;<input id="bd_upload" type="file" name="upload" multiple required></p>
		 		<p><input type="submit" name="writeSubmit" value="작성완료"></p>
		 	</div>	<!-- end of .bd_fileSubmit -->
		 </form>
	</div>	<!-- end of #bd_writeContent -->
</div>	<!-- end of #home -->

<script>
const bd_upload = document.getElementById('bd_upload')

bd_upload.addEventListener('change', checkPDF);

function checkPDF() {
	
	for(let i = 0; i < bd_upload.files.length; i++) {
		if(bd_upload.files[i].type !== 'application/pdf') {
			alert('PDF 형식의 파일만 첨부 가능합니다')
			bd_upload.value = '';
			break;
		}
	}
}



</script>
</body>
</html>