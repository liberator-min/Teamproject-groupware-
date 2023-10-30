<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/board/view.css">

<style>
#up_noticeright {
	width: 30vw;
    height: 60vh;
    margin: 20px;
    border-radius: 25px;
    /* padding: 15px; */
    font-size: 18px;
    overflow-y: scroll;
    white-space: pre;
    background-color: white;
    box-shadow: 1px 3px 3px 3px rgba(0,0,0,0.1);
}
#nt_textarea > textarea{
    border-radius: 25px;
    width: inherit;
    height: 45vh;
    padding: 20px;
}
#up_noticeright::-webkit-scrollbar {
	display: none;
}
</style>
<c:if test="${login.employee_idx ne 0}">
	<c:if test="${login.job_id < 5 or login.employee_idx ne selectOne.writer_id }">
		<script>
			alert('접근 권한이 없습니다')
			history.go(-1)
		</script>
	</c:if>
</c:if>
<div id="homeMain">
    <div class="bd_viewbody">
         <div class="bd_title"><h1>공지사항</h1></div>
         <div id="bd_viewmain">
           <div class="bd_viewcategory">
              <div id="bd_category"><a href="${cpath }/board/notice/list"><button class="bd_category">공지사항</button></a></div>
              <div id="bd_category"><a href="${cpath }/board//suggestion/list"><button class="bd_category">건의사항</button></a></div>
              <div id="bd_category"><a href="${cpath }/board//club/list"><button class="bd_category">동호회</button></a></div>
              <div id="bd_category"><a href="${cpath }/board//event/list"><button class="bd_category">경조사</button></a></div>
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
                  	<div id="up_noticeright">
	                     <div id="nt_textarea"><textarea rows="32" cols="65" style="border-radius:25px; padding: 20px;">${selectOne.board_content }</textarea></div>
	                  </div>
	                  <div id="up_board_idx" style="display: none">${selectOne.board_idx }</div>
	               </c:forEach>
	            </div>
	            <div style="display:flex; justify-content: space-between; width:75vw">
	            	<div></div>
	            	<div >
		            	<form method="POST" id="bd_noticeUpdate" style="display: flex;" enctype="multipart/form-data" action="${cpath }/upload/update">    
		            		<div class="bd_fileInput" >
		            			<div id="bd_fileBtn" class="bd_FileBT">파일 수정</div>
		            			<input type="file" id="bd_fileInput" name="upload" style="display: none;">
<!-- 		            			<input type="hidden" id="selectedFileName" name="upload" value=""> -->
		            			<input type="hidden" id="textContent" name="board_content" value="">
		            			<input type="hidden" id="get_bd_idx" name="board_idx" value="">
		            			<input type="hidden" id="get_writer" name="writer_id" value="${login.employee_idx }">
		            		</div>
		            		<div><input type="submit" id="bd_viewSubmit" class="bd_viewBtn" value="수정 완료"></div>
			          	</form>
	    			</div>
	            </div>
      </div>
    </div>
</div>
<script>
const up_board_idx = document.getElementById('up_board_idx')
const get_bd_idx = document.getElementById('get_bd_idx')
document.getElementById('bd_fileBtn').addEventListener('click', function() {
    const bd_fileInput = document.getElementById('bd_fileInput')
    bd_fileInput.click();
}); 

let bd_fileName = '';

document.getElementById('bd_fileInput').addEventListener('change', bd_displayPDF);
function loadIDX() {
	get_bd_idx.value = parseInt(up_board_idx.innerText)
}

function bd_displayPDF(event) {
    const bd_file = event.target.files[0];
    const bd_noticeLeft = document.getElementById('bd_noticeLeft');

    // #bd_noticeLeft의 내용을 비웁니다.

    if(bd_file && bd_file.type === 'application/pdf') {
	    bd_noticeLeft.innerHTML = '';
    	bd_fileName = bd_file.name;
    	const bd_fileURL = URL.createObjectURL(bd_file);
//         const bd_fileURL = URL.createObjectURL(bd_file);
        
        // 새로운 <iframe>을 생성하여 PDF를 표시합니다.
        const iframeElem = document.createElement('iframe');
        
        iframeElem.className = 'bd_ifram';
        iframeElem.src = bd_fileURL;

        bd_noticeLeft.appendChild(iframeElem);
        get_bd_idx.value = parseInt(up_board_idx.innerText)
        console.log('get_bd_idx : ' + get_bd_idx)
    }
    else {
    	alert('PDF 형식의 파일만 첨부 가능합니다')
    }
}
document.getElementById('bd_noticeUpdate').addEventListener('submit', function(event) {
	const textAreaContent = document.querySelector('textarea').value;
	
// 	document.getElementById('selectedFileName').value = bd_fileName;
	document.getElementById('textContent').value = textAreaContent;
});
window.onload = loadIDX	
</script>

</body>
</html>