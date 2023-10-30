<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>    
<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/board/view.css">
   
   
<div id="homeMain">
    <div class="bd_viewbody">
         <div class="bd_title"><h1>공지사항</h1></div>
         <div id="bd_viewmain">
           <div class="bd_viewcategory">
              <div id="bd_category"><a href="${cpath }/board/notice/list"><button class="bd_category">공지사항</button></a></div>
              <div id="bd_category"><a href="${cpath }/board//suggestion/list"><button class="bd_category">건의사항</button></a></div>
              <div id="bd_category"><a href="${cpath }/board//event/list"><button class="bd_category">경조사</button></a></div>
              <div id="bd_category"><a href="${cpath }/board//club/list"><button class="bd_category">자유게시판</button></a></div>
            </div>
            
            <div id="bd_noticeview">
               <c:forEach var="select" items="${selectList }">
                  <div id="bd_noticeLeft">
                     <c:forTokens var="pdfPath" items="${select.board_filepath }" delims=",">
                        <c:if test="${fn:contains(pdfPath,'.pdf')}">                     
                           <iframe class="bd_ifram" src="${cpath}/upload/${pdfPath}"></iframe>
                        </c:if>
                     </c:forTokens>   
                  </div>
                  <div id="bd_noticeright">${selectOne.board_content }
                     <c:forTokens var="filePath" items="${select.board_filepath }" delims=",">
                        <c:if test="${filePath ne 'teamproject'} && ${not fn:contains(filePath,'.pdf')}">
                           <img src="${cpath }/upload/${filePath}" height="200">
                        </c:if>
                     </c:forTokens>
                  </div>	<!-- end of #bd_noticeright -->
               </c:forEach>
            </div>
            <div style="display:flex; justify-content: space-between; width:75vw">
            	<div></div>
            	<c:if test="${login.employee_idx eq 0 or login.job_id >= 5 && login.employee_idx eq selectOne.writer_id}">
            	<div style="display: flex;">
	            	<div class="bd_UpdateBtn"><a href="${cpath }/board/selectOne/${selectOne.board_idx }/update/">게시글 수정</a></div>
	            	<form method="POST" action="${cpath }/board/notice/delete">
	            		<input type="text" name="board_idx" style="display: none" value="${selectOne.board_idx }">
	            		<div><input type="submit" class="bd_viewBtn" value="게시글 삭제"></div>
	            	</form>
    			</div>
    			</c:if>
            </div>
      </div>
    </div>
</div>

</body>
</html>