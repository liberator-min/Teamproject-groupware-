<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>

<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/board/list.css">

<style>
.bd_viewcategory {
	display: flex;
	width: 80%;
	justify-content: space-around;
	margin: 0 auto;
	margin-top: 10px;
	margin-bottom: 10px;
}
#bd_content {
	width: 80%;
	margin: 0 auto;
	margin-top: 30px;
	margin-bottom: 10px;
	border-radius: 10px;
}
#bd_write {
	text-align: right;
	margin-top: 40px;
	padding: 5px 10px;
}
</style>
<div id="homeMain">
	 <div class="bd_viewbody">
         <div id="bd_title"><h1>경조사</h1></div>
           <div class="bd_viewcategory">
              <div id="bd_category"><a href="${cpath }/board/notice/list"><button class="bd_category">공지사항</button></a></div>
              <div id="bd_category"><a href="${cpath }/board/suggestion/list"><button class="bd_category">건의사항</button></a></div>
              <div id="bd_category"><a href="${cpath }/board/event/list"><button class="bd_category">경조사</button></a></div>
              <div id="bd_category"><a href="${cpath }/board/club/list"><button class="bd_category">자유게시판</button></a></div>
            </div>
            
            <div id="bd_content">
            <table id="bd_viewTable">
					<thead>
						<tr>
							<th class="bd_idx">No</th>
							<th class="bd_boardtitle">Title</th>
							<th class="bd_writer">작성자</th>
							<th class="bd_date">작성 일자</th>
						</tr>
					</thead>
					<tbody>
	        	<c:forEach var="eventDTO" items="${eventList}">
	        		<tr>
	       		     	<td class="bd_idx">${eventDTO.board_idx}</td>
	                    <td class="bd_boardtitle"><a href="${cpath}/board/selectOne/${eventDTO.board_idx}">${eventDTO.board_title}</a></td>
	                    <td class="bd_writer">${eventDTO.employee_name}</td>
	                    <td class="bd_date">${eventDTO.write_date}</td>
	        		</tr>
        		</c:forEach>
        		</tbody>
	        </table>
	        <div id="bd_write"><a href="${cpath }/board/event/insert">게시글 작성</a></div>    
	         </div>
        	<div id="bd_foot">
<!--         		<div class="bd_footLeft"></div> -->
	        	<div id="bd_paging">
	            	<c:if test="${paging.prev }">
						<a href="${cpath }/board/event/list?page=${paging.begin - paging.perPage}&bd_search=${paging.bd_search}&bd_column=${paging.bd_column }">[이전]</a>
					</c:if>
					
					<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
						<a href="${cpath }/board/event/list?page=${i}&bd_search=${paging.bd_search}&bd_column=${paging.bd_column }">[${i }]</a>
					</c:forEach>
					
					<c:if test="${paging.next }">
						<a href="${cpath }/board/event/list?page=${paging.end + 1}&bd_search=${paging.bd_search}&bd_column=${paging.bd_column }">[다음]</a>
					</c:if>
	            </div>
	            
            </div>
          
            <div id="bd_search">
            	<form id="bd_searchURL" method="POST" action="${cpath }/board/event/list">
		            <p><select id="bd_select" name="bd_column">
		            		<option value="board_title">제목으로 검색</option>
		            		<option value="employee_name">작성자로 검색</option>
		            </select></p>
	            	<p><input type="text" name="bd_search" placeholder="검색어를 입력하세요" ></p>
	            	<p><input type="submit" name="bd_submit" value="검색">
	            </form>
            </div>
        </div>
    </div>
</body>
</html>