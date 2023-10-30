<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/board/insert.css">
<style>

.bd_viewcategory {
	display: flex;
	width: 80%;
	justify-content: space-around;
	margin: 0 auto;
	margin-top: 40px;
	margin-bottom: 30px;
}

#bd_category>a {
	color: #3F3F3F;
	font-size: 22px;
}

#bd_category>a:hover {
	color: #3E64FF;
	font-weight: bold;
}

/* (notice) insert */
#bd_writeContent {
	width: 71vw;
	height: 70vh;    /*60vh 에서 70vh로 변경 */
	border-radius: 20px;
	overflow-x: hidden;
	margin: 0 auto;
	margin-top: 80px;
	background-color: white;
	overflow-y: scroll;
}

#bd_writeContent::-webkit-scrollbar {
	display: none;
}

#bd_writeTitle {
	display: flex;
	margin-bottom: 20px;
	background-color: #F4F4F4;
}

.gongji {
	padding: 14px 30px;
	font-weight: bold;
	color: #202020;
}

.bd_writeTitle>input[name="board_title"] {
	width: 62vw;
	height: 3vh;
	padding: 10px;
	outline: none;
	border: none;
	font-size: 18px;
	background-color: #F4F4F4;
	text-align: center;
}

#bd_noticeText {
	padding: 0 20px;
}

.bd_noticeText {
	width: 98%;
	height: 40vh;
	padding: 10px;
	resize: none;
	outline: none;
	border: none;
	font-size: 20px;
	overflow-y: scroll;
	border-bottom: 3px solid #F3F3F3;
}

.bd_noticeText::-webkit-scrollbar {
	display: none;
}

.bd_fileSubmit {
	display: flex;
	padding: 0 30px;
	justify-content: space-between;
	padding-top: 10px;
}

input[name="writeSubmit"] {
	border: 1px solid #3E64EE;
	border-radius: 30px;
	background-color: #3E64EE;
	color: white;
	font-weight: bold;
	font-size: 15px;
	padding: 10px 20px;
}

input[name="writeSubmit"]:hover {
	color: #3E64FF;
	background-color: white;
	border: none;
	cursor: pointer;
	font-weight: bold;
}

/* (suggestion) insert */
.bd_suggestionBody {
	display: flex;
}

select[name="isnotice"] {
	width: 12vw;
	height: 3vh;
	border-radius: 5px;
	margin: 4px;
}

.bd_textArea {
	padding: 0 10px;
}

.bd_addHuman {
	border: 1px solid blue;
}

.bd_selectHuman {
	display: flex;
}

.bd_suggestionBodyRight {
	width: 25vw;
	height: 45vh;
	margin: 0 15px;
}

#suggestionText {
	width: 97%;
	height: 30vh;
	border-radius: 10px;
	padding: 10px;
	font-size: 15px;
	outline: none;
	border: none;
	resize: none;
	box-shadow: 2px 3px 3px -2px rgba(0, 0, 0, 0.1);
	border: 0.5px solid #F3F3F3;
}

#bd_addHuman {
	box-shadow: 2px 3px 3px -2px rgba(0, 0, 0, 0.1);
	border: 0.5px solid #F3F3F3;
	height: 8vh;
	border-radius: 25px;
	margin: 10px 0;
	display: flex;
	overflow: hidden;
	white-space: nowrap;
	width: 41vw;
}

#bd_ListTitle {
	width: 24vw;
	height: 35vh;
	border-radius: 25px;
	margin: 10px;
	padding: 10px;
	overflow-x: hidden;
	overflow-y: scroll;
	position: relative;
	z-index: 1;
	background-color: #F3F3F3;
}

#bd_ListTitle::-webkit-scrollbar {
	display: none;
}

#bd_ListTitleIndex {
	width: 24vw;
	height: 35vh;
	background-color: white;
	padding: 10px;
	top: 0;
	left: 0;
	position: absolute;
}

#bd_selectHuman {
	border: none;
	background-color: white;
	color: #3E64FF;
	font-weight: bold;
	font-size: 16px;
	cursor: pointer;
	text-align: left;
	padding: 0 25px;
}

#bd_humanSelectList {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin: 10px;
	padding: 5px;
	border: 0.5px solid grey;
	border-radius: 10px;
	cursor: pointer;
}

#bd_humanSelectList:hover {
	background-color: #b1d1e4;
	color: white;
}

.bd_humanitems {
	display: flex;
}

input[name="bd_selectHuman"] {
	width: 12vw;
	height: 3vh;
	border-radius: 5px;
	margin: 4px;
}

#bd_suggestionSubmit {
	cursor: pointer;
	width: 100px;
	padding: 10px 5px;
	text-align: center;
	margin-top: 20px;
	margin-left: 70%;
	font-weight: bold;
}

input[name="upload"] {
	margin-top: 20px;
}

.bd_suggestionSubmit {
	width: 100px;
	margin-left: 85%;
	margin-top: 40px;
}
.bd_UpdateTitle {
	text-align: center;
	font-size: 20px;
	width: 62vw;
	padding: 10px 0;
}
#bd_viewSubmit {
	border: 1px solid blue;
	font-size: 15px;
	background-color: #3E64FF;
	border: 1px solid #3E64FF;
	border-radius: 30px;
	color: white;
	padding: 15px 20px;
	cursor: pointer;
	margin-left: 90%;
	margin-top: 20px;
}
#bd_viewSubmit:hover {
	border: 1px solid white;
	color: #3E64FF;
	background-color: white;
	font-weight: bold;
}

</style>
<div id="homeMain">
	<div id="bd_wrtieHead"><h1>게시글 작성</h1></div>
	<hr>
	
	<div id="bd_writeContent">
		 <form method="POST" name="bd_writeBody" action="${cpath }/board/club/insert">
		 <input type="hidden" name="employee_idx" value="${login.employee_idx }">
		 <input type="text" name="board_category" value="자유게시판" hidden="true">
		 	<div id="bd_writeTitle">
		 		<div class="gongji">자유게시판</div>
		 		<div class="bd_writeTitle"><input type="text" name="board_title" placeholder="제목을 입력하세요" required="required" autocomplete="off"></div>
		 	</div>
		 	<div id="bd_noticeText">
		 		<textarea class="bd_noticeText" name="board_content" placeholder="내용을 입력하세요" required></textarea>
		 	</div>
		 	<div class="bd_fileSubmit">
		 		<div></div>
		 		<p><input type="submit" name="writeSubmit" value="작성완료"></p>
		 	</div>	<!-- end of .bd_fileSubmit -->
		 </form>
	</div>	<!-- end of #bd_writeContent -->
</div>	<!-- end of #home -->

</body>
</html>