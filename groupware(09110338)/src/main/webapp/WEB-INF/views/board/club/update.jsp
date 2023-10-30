<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>    
<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/board/insert.css">

<div id="homeMain">
    <div class="bd_viewbody">
         <div class="bd_title">
         	<h1>자유게시판</h1>
         </div>
         
         <div class="bd_viewcategory">
              <div id="bd_category"><a href="${cpath }/board/notice/list"><button class="bd_category">공지사항</button></a></div>
              <div id="bd_category"><a href="${cpath }/board//suggestion/list"><button class="bd_category">건의사항</button></a></div>
              <div id="bd_category"><a href="${cpath }/board//event/list"><button class="bd_category">경조사</button></a></div>
              <div id="bd_category"><a href="${cpath }/board//club/list"><button class="bd_category">자유게시판</button></a></div>
         </div>
         
		<div id="bd_writeContent">
			<div id="bd_writeTitle">
			 	<div class="gongji">자유게시판</div>
			 	<div class="bd_UpdateTitle">${selectOne.board_title }</div>
			 </div>	<!-- end of #bd_writeTitle -->
	         <div id="bd_noticeText">
			 	<textarea class="bd_noticeText" name="board_content"  required>${selectOne.board_content  }</textarea>
			 </div>	<!-- end of bd_noticeText -->
		     <form method="POST" id="bd_clubUpdate" style="display: flex;" action="${cpath }/board/club/update/">    
		     	<div class="bd_fileInput" >				            			        			
		        	<input type="hidden" id="textContent" name="board_content" value="">
		            <input type="hidden" id="get_bd_idx" name="club_idx" value="${selectOne.club_idx }">
				</div>
		        <input type="submit" id="bd_viewSubmit" class="bd_viewBtn" value="수정 완료">
			 </form>
		</div>	<!-- end of #bd_writeContent -->
	</div>	<!-- end of #bd_viewbody -->
</div>	<!-- end of #homeMain -->

<script>
document.getElementById('bd_clubUpdate').addEventListener('submit', function(event) {
	const textAreaContent = document.querySelector('textarea').value;
	
// 	document.getElementById('selectedFileName').value = bd_fileName;
	document.getElementById('textContent').value = textAreaContent;
});
</script>
</body>
</html>