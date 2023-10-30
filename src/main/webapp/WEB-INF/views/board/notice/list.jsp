<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/board/list.css">

<style>

a {
	text-decoration: none;
}
#bd_title {
	padding-left: 20px;	
	margin: 20px;
}
#bd_viewbody {
	height: inherit;
}
.bd_viewcategory {
	display: flex;
	width: 80%;
	justify-content: space-around;
	margin: 0 auto;
	margin-top: 10px; /* 40px에서 10px로 바꿈 */
	margin-bottom: 10px;
}
#bd_category > a {
	color: #3F3F3F;
	font-size: 22px;
}
#bd_category > a:hover {
	color: #3E64FF;
	font-weight: bold;
}
#bd_search > form {
	display: flex;
}

#bd_search {
	width: 71vw;
	height: 7vh;
	display: flex;
	justify-content: center;
	align-items: center;
	position: relative;
	z-index: 2;
	margin: 0 auto;
	margin-top: -10px;
}

#bd_select {
	width: 7vw;
	height: 4vh;
	border-radius: 25px 0px 0px 25px;
	text-align: center;
	outline: none;
}

input[name="bd_search"] {
	width: 55vw;
	height: 3.65vh;
	border: 0.5px solid grey;
	text-align: center;
	outline: none;
}

input[name="bd_submit"] {
	width: 7vw;
	height: 4vh;
	border-radius: 0px 25px 25px 0px;
	border: 0.5px solid grey;
	text-align: center;
}
#bd_content {
	width: 80%;
	margin: 0 auto;
	height: 61vh;
 	margin-top: 10px;			
	border-radius: 20px;
}
#contentTabTop {
	display: flex;
	width: inherit;
	margin: 0 auto;
	padding: 10px;
	justify-content: center;
}
#bd_viewTable {
	width: 100%;
	font-size: 15px;
	text-align: center;	
	border-style: hidden;
	table-layout: fixed;
    border-spacing: 0;
    background-color: white;
}
.bd_idx {
	width: 2vw;
}
.bd_boardtitle {
	width: 8vw;
}
.bd_writer {
	width: 3vw;
}
.bd_date {
	width: 5vw;
}
#bd_viewTable > thead > tr > th {
	padding: 12px;
	background-color: #F0F0F0;
	color: black;
}
#bd_viewTable > tbody > tr > td {
	padding: 13px 10px;
	border-bottom: 1px solid #F0F0F0;
}
#bd_viewTable > tbody > tr > td:hover {
	background-color: 
}
#bd_viewTable > tbody > tr > td > a {
	color: #252525;
}
#bd_foot {
	display: flex;
	align-items: center;
	margin: 0 auto;
	z-index: 3;
	position: inherit;
	width: 71vw;
	margin-top: -3px;
}
#bd_paging {
	flex: 6;
	margin: 10px;
	text-align: center;
}
#bd_paging > a {
	color: #3F3F3F;
}

#bd_write {
	text-align: right;
	margin-top: 40px; /* 20px에서 40px로 바꿈 */
	padding: 5px 10px;
}
#bd_write > a {
	border: none;
	border-radius: 30px;
	padding: 8px 12px;
	background-color: #7C7C7C;
	color: white;
}
#bd_write > a:hover {
	background-color: rgba(124,124,124,0.1);
	color: black;
	font-weight: bold;
}


</style>
<div id="homeMain">
	 <div id="bd_viewbody">
         <div id="bd_title"><h1>공지사항</h1></div>
			<div class="bd_viewcategory">
				<div id="bd_category"><a href="${cpath }/board/notice/list">공지사항</a></div>
				<div id="bd_category"><a href="${cpath }/board/suggestion/list">건의사항</a></div>
				<div id="bd_category"><a href="${cpath }/board/event/list">경조사</a></div>
				<div id="bd_category"><a href="${cpath }/board/club/list">자유게시판</a></div>
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
	        	<c:forEach var="noticeDTO" items="${noticeList}">
	        		<tr>
	       		     	<td class="bd_idx">${noticeDTO.board_idx}</td>
	                    <td class="bd_boardtitle"><a href="${cpath}/board/selectOne/${noticeDTO.board_idx}">${noticeDTO.board_title}</a></td>
	                    <td class="bd_writer">${noticeDTO.employee_name}</td>
	                    <td class="bd_date">${noticeDTO.write_date}</td>
	        		</tr>
        		</c:forEach>
        		</tbody>
	        </table>
	    <div id="bd_write"><a href="${cpath }/board/notice/insert">게시글 작성</a></div>
	    </div>	<!-- end of #bd_content -->
	    
	    
        	<div id="bd_foot">
<!--         		<div class="bd_footLeft"></div> -->
	        	<div id="bd_paging">
	            	<c:if test="${paging.prev }">
						<a href="${cpath }/board/notice/list?page=${paging.begin - paging.perPage}&bd_search=${paging.bd_search}&bd_column=${paging.bd_column}">[이전]</a>
					</c:if>
					
					<c:set var="bd_search" value="${paging.bd_search }"/>
					<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
							<a href="${cpath }/board/notice/list?page=${i}&bd_search=${paging.bd_search}&bd_column=${paging.bd_column}">[${i }]</a>						
					</c:forEach>
					
					<c:if test="${paging.next }">
						<a href="${cpath }/board/notice/list?page=${paging.end + 1}&bd_search=${paging.bd_search}&bd_column=${paging.bd_column}">[다음]</a>
					</c:if>
	            </div>	<!-- end of #bd_foot -->
	            
            </div>	<!-- end of #bd_viewbody -->
            <div id="bd_search">
         	<form id="bd_searchURL" method="POST" action="${cpath }/board/notice/list">
	     		<p><select id="bd_select" name="bd_column">
		 			<option value="board_title">제목으로 검색</option>
		           	<option value="employee_name">작성자로 검색</option>
	            </select></p>
		        <p><input id="bd_inputSearch" type="text" name="bd_search" onkeyup="bdSearch(event)" placeholder="검색어를 입력하세요"></p>
		        <p><input id="bd_submit" type="submit" name="bd_submit" value="검색"></p>
	        </form>
        	</div>	<!-- end of #bd_search -->
       </div>	<!-- end of #viewbody -->
</div>	<!-- end of #homemain -->

</body>
</html>