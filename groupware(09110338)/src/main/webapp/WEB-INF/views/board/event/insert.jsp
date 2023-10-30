<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>

<style>
#bd_eventText {
      width: 45vw;
      height: 40vh;
      border: 0.5px dashed grey;
      border-radius: 0px 0px 25px 25px;
      margin: 0 10px;
}
.bd_boardFlex{
   display: flex;
}
#bd_address {
    width: 22vw;
    height: 42vh;
   	border-radius: 4px;
    margin-left: auto;
    margin-top: 16px;
    font-size: 20px;
}
#bd_addressBtn {
	border: #2a9df4;
	border-radius: 4px;
	background-color: #2a9df4;
	color: #eee;
}
#bd_addressBtn:hover {
   background-color: #ddd;
   cursor: pointer;
   color: black;
}


</style>

<style>
	.bd_writeBody {
		border-radius: 4px;
		height: 70vh;
	}
	.bd_writeTitle {
		width: 38vw;
	}
	.bd_writeTitle > form[name="bd_writeBody"] {
		height: 400vh;
		border: none;
	}
	.bd_writeTitle > input[name="board_title"] {
		border-radius: 4px;
		text-align: left;
		background-color: #eee;
		font-size: 24px;
		padding-left: 20px;
		width: 36vw;
		border: 1px solid #eee;
	}
	#bd_writeContent {
		height: 80vh;
	}
	#bd_writeContent > .bd_writeBody {
		margin: 0;
		border: none;
	}
	#bd_eventText {
		border: 1px solid #eee;
		border-radius: 4px;
		font-size: 18px;
		padding: 18px;
		margin: 0;
	}
	#bd_address > div {
	}
	.bd_writeSelect > select[name="board_category"] {
		border-radius: 4px;
		background-color: #f9f9f9;
		font-size: 18px;
		border: 1px solid #ccc;
	}
	.bd_fileSubmit {
		width: 46vw;
	}
	.bd_fileSubmit > p {
		font-size: 18px;
	}
	.bd_fileSubmit > p > input[name="writeSubmit"] {
		background-color: #eee;
		border: 1px solid #eee;
		font-size: 18px;
	}
	.bd_fileSubmit > p > input[name="writeSubmit"]:hover {
		background-color: #ddd;
		border: 1px solid #ddd;
	}
	#bd_address > div {
		margin-bottom: 36px;
	}
	#bd_address_value {
		border-radius: 4px;
		border: 1px solid #ccc;
		margin-top: 5px;
	}
	#bd_placeName {
		border-radius: 4px;
		border: 1px solid #ccc;
		margin-top: 5px;
	}
	.bd_addressDiv {
		border-bottom: 1px solid black;
		width: 19vw;
	}
	.bd_addressInput {
	}
</style>
<div id="homeMain">
	<div id="bd_wrtieHead"><h1>게시글 작성</h1><h3>작성자 : ${login.employee_name }</h3></div>
	<hr>
	
	<div id="bd_writeContent">
	   <div class="bd_writeBody">
	      <form method="POST" name="bd_writeBody" enctype="multipart/form-data" action="${cpath }/upload">
	         <div id="bd_writeTitle">
	            <div class="bd_writeTitle">
	               <input type="text" name="board_title" placeholder="제목을 입력하세요" required>
	            </div>
	            <div class="bd_writeSelect">
	               <select name="board_category">
	                  <option value="경조사">경조사</option>
	               </select>
	            </div>
	         </div>
	         <div class="bd_boardFlex">   
	            <p><textarea id="bd_eventText" name="board_content" placeholder="내용을 입력하세요" required></textarea></p>
	            <div id="bd_address">
	               <div class="bd_addressDiv">
	                  <div class="bd_addressInput">
	                     <h4>주소 입력 또는 검색</h4>
	                     <input type="button" id="bd_addressBtn" onclick="goPopup()" value="주소 검색">                  
	                  </div>
	               </div>
	               <div>주소 입력<input type="text" id="bd_address_value" name="address_value" required></div>
	               <div>장소 입력<input type="text" id="bd_placeName" name="placeName" required></div>
	            </div>
	         </div>
	         <input type="hidden" name="employee_idx" value="${login.employee_idx }">
	         <div class="bd_fileSubmit">
	            <p><input type="file" name="upload" multiple></p>
	            <p><input type="submit" name="writeSubmit" value="작성완료"></p>
	         </div>
	      </form>
	   </div>
	</div>
</div>

<script>
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";
// localStorage.setItem('session', JSON.stringify(${login}));
const bd_addressBtn = document.getElementById('bd_addressBtn')

document.domain = 'localhost:8080/'
function goPopup(){
   // 주소검색을 수행할 팝업 페이지를 호출합니다.
   // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
   
   var pop = window.open(cpath + "/board/event/jusoPopup","pop","width=570,height=420,left=600,top=200, scrollbars=yes, resizable=yes"); 
   
   // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/board/event/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}


function jusoCallBack(roadFullAddr,addrDetail){
// 	  let login = JSON.parse(localStorage.getItem('session'));
      // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
      let bd_address_value = document.querySelector("#bd_address_value");
      let bd_placeName = document.querySelector("#bd_placeName");
      
      bd_address_value.value = roadFullAddr;
      bd_placeName.value = addrDetail;
}
</script>   

</body>
</html>