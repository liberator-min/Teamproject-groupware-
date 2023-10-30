<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>    
<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/board/view.css">


<div id="homeMain">
	<div class="bd_viewbody">
		<div class="bd_title">
			<h1>건의사항</h1>
		</div>
		<div class="bd_viewcategory">
			<div id="bd_category">
				<a href="${cpath }/board/notice/list"><button
						class="bd_category">공지사항</button></a>
			</div>
			<div id="bd_category">
				<a href="${cpath }/board/suggestion/list"><button
						class="bd_category">건의사항</button></a>
			</div>
			<div id="bd_category">
				<a href="${cpath }/board/event/list"><button class="bd_category">경조사</button></a>
			</div>
			<div id="bd_category">
				<a href="${cpath }/board/club/list"><button class="bd_category">자유게시판</button></a>
			</div>
		</div>

		<div id="bd_suggestionview">
			<c:forEach var="select" items="${selectList }">
				<div class="bd_suggestionTitle">${selectOne.board_title }</div>
				<div id="bd_who">
					<div class="bd_suggestionWriter">작성자 : ${selectOne.employee_name }</div>
					<div class="bd_suggestionDate">작성 일자 : ${selectOne.write_date }</div>
				</div>

				<div id="bd_suggestionContent">
					<div id="sg_img">
						<c:forTokens var="filePath" items="${select.board_filepath }"
							delims=",">
							<c:if test="${not fn:contains(filePath,'octet-stream')}">
								<img src="${cpath }/upload/${filePath}" width="350" height="480">
							</c:if>
						</c:forTokens>
					</div>
					<div class="bd_suggestionContent">${selectOne.board_content }</div>
				</div>
			</c:forEach>
			<div style="display:flex; justify-content: space-between; width:70vw; margin-top: 20px">
            	<div></div>
            	<c:if test="${login.employee_idx eq 0 or login.job_id >= 6 }">
            	<div style="display: flex;">
	            	<form method="POST" action="${cpath }/board/suggestion/delete/">
	            		<div></div>
	            		<input type="text" name="board_idx" style="display: none" value="${selectOne.board_idx }">
	            		<div><input type="submit" class="bd_viewBtn" value="게시글 삭제"></div>
	            	</form>
    			</div>
    			</c:if>
            </div>
		</div>
	</div>	<!-- end of #viewbody -->
</div>	<!-- end of #homeMain -->

<script>
const sg_img = document.getElementById('sg_img');

sg_img.addEventListener('wheel',(event) => {
	   sg_img.scrollLeft += event.deltaY;
	   event.preventDefault();
	   
}, {passive: false});
</script>
</body>
</html>