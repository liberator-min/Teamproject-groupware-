<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>    
<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/board/view.css">

<div id="homeMain">
    <div class="bd_viewbody">
         <div class="bd_title">
         	<h1>자유게시판</h1>
         </div>
         
         <div class="bd_viewcategory">
              <div id="bd_category"><a href="${cpath }/board/notice/list"><button class="bd_category">공지사항</button></a></div>
              <div id="bd_category"><a href="${cpath }/board//suggestion/list"><button class="bd_category">건의사항</button></a></div>
              <div id="bd_category"><a href="${cpath }/board//club/list"><button class="bd_category">자유게시판</button></a></div>
              <div id="bd_category"><a href="${cpath }/board//event/list"><button class="bd_category">경조사</button></a></div>
         </div>
            
            <div id="bd_clubview">
				<div class="bd_suggestionTitle">${selectOne.board_title }</div>
				<div id="bd_who">
					<div class="bd_suggestionWriter">작성자 : ${selectOne.employee_name }</div>
					<div class="bd_suggestionDate">작성 일자 : ${selectOne.write_date }</div>
				</div>

				<div id="bd_clubContent">${selectOne.board_content }</div>
		</div>	<!-- end of #bd_suggetstionview -->
		
		<c:if test="${login.employee_idx eq selectOne.writer_id or login.employee_idx == 0}">
        	<div id="clubBOtBtn">
	     		<div class="bd_ClubUpdateBtn"><a href="${cpath }/board/club/${selectOne.club_idx }/update/">게시글 수정</a></div>
	            <form method="POST" action="${cpath }/board/club/delete">
	            	<input type="text" name="club_idx" style="display: none" value="${selectOne.club_idx }">
	            	<div><input type="submit" class="bd_viewBtn" value="게시글 삭제"></div>
	            </form>
    		</div>
    	</c:if>	
    </div>	<!--end of #bd_viewbody -->
</div>	<!-- end of #homeMain -->

</body>
</html>