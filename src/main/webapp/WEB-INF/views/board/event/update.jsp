<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<style>
	#up_eventBody{
		display:flex;
		margin: 0 auto;
		width: 85vw;
		height: 70vh;
		justify-content: space-around;
		align-items: center;
	}
	#up_item{
		width: 35vw;
		height: 64vh;
		border: 1px solid grey;
		border-radius: 8px;
		display: flex;
		flex-direction: column;
		justify-content: space-around;
	}
   #bd_eventImg {
      height: 20vh;
/*       border: 1px solid grey; */
      border-radius: 10px;
/*       margin: 0 10px; */
      margin: auto;
      margin-top: 18px;
      overflow: hidden;
      white-space: nowrap;
      width: 30vw;
      justify-content: space-around;
   }
</style>

<style>
	#bd_eventright > div > textarea {
		border-radius: 8px;
		border: 1px solid #bbb;
		border-radius: 10px;
		padding: 20px;
		width: 32vw;
		height: 50vh;
		font-size: 18px;
	}
	.up_addressInput {
		font-size: 20px;
		margin-top: -16px;
		margin-bottom: -20px;
	}
	#bd_address_value {
		border: 1px solid grey;
		font-size: 18px;
	}
	#bd_placeName {
		border: 1px solid grey;
		font-size: 18px;
	}
	.bd_addressIpryeok {
		padding-top: 10px;
	}
	#up_addressBtn {
		border: #2a9df4;
		border-radius: 4px;
		background-color: #2a9df4;
		color: #eee;
		font-size: 18px;
		wid
	}
	#up_addressBtn:hover {
	   background-color: #d9d9d9;
	   cursor: pointer;
	   color: black;
	}
	#bd_fileBtn {
		margin-left: 50px;
		width: 4vw;
		border-radius: 8px;
		border: 1px solid #ddd;
		background-color: #ddd;
	}
	#bd_fileBtn:hover {
		color: black;
		border: 1px solid #ccc;
		background-color: #ccc;
	}
	.bd_viewBtn {
		background-color: #eee;
		color: black;
	}
	.bd_viewBtn:hover {
		background-color: #2a9df4;
		color: white;
		border: 1px solid #2a9df4;
		cursor: pointer;
	}
	#bd_viewSubmit {
		font-size: 18px;
		line-height: 0;
		background-color: #2a9df4;
		border: 1px solid #2a9df4;
		color: #eee;
		height: 4vh;
	}
	#bd_viewSubmit:hover {
		background-color: #eee;
		color: black;
		border: 1px solid #ccc;
	}
	.up_itemAddress {
		border-bottom: 1px solid grey;
	}
</style>

<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=da43e20451b44c34ba987f3d1101b0a6&libraries=services"></script>

<div id="homeMain">
    <div class="bd_viewbody">
         <div class="bd_title"><h1>경조사</h1></div>
         <div id="bd_viewmain">
           <div class="bd_viewcategory">
              <div id="bd_category"><a href="${cpath }/board/notice/list"><button class="bd_category">공지사항</button></a></div>
              <div id="bd_category"><a href="${cpath }/board/suggestion/list"><button class="bd_category">건의사항</button></a></div>
              <div id="bd_category"><a href="${cpath }/board/club/list"><button class="bd_category">동호회</button></a></div>
              <div id="bd_category"><a href="${cpath }/board/event/list"><button class="bd_category">경조사</button></a></div>
            </div>
            <div id="up_eventBody">
            	<div id="up_item">
	               <c:forEach var="select" items="${selectList }">
	                  <div id="bd_eventright">
						<h1 style="text-align: left; margin-left: 20px;">내용 수정</h1>
	                  	<div><textarea rows="15" cols="65">${selectOne.board_content }</textarea></div>
	                  </div>
	                  <div id="up_board_idx" style="display: none">${selectOne.board_idx }</div>
	               </c:forEach>
               </div>
   			   <div id="up_item">
   			   	  <div class="up_itemAddress">
	                  <div class="up_addressInput">
	                     <h4>주소 입력 또는 검색</h4>
	                     <input type="button" id="up_addressBtn" onclick="goPopup()" value="주소 검색">                  
	                  </div>
	                  <hr>
		               <div class="bd_addressIpryeok" style="margin:10px; display: flex;" ><h3 style="margin: 20px">주소 입력</h3><input type="text" id="bd_address_value"   value="${selectAddress.address_value }" required></div>
		               <div class="bd_addressIpryeok" style="margin:10px; display: flex;" ><h3 style="margin: 20px">장소 입력</h3><input type="text" id="bd_placeName"  value="${selectAddress.placeName }" required></div>
		           </div>
   	               <c:forEach var="select" items="${selectList }">
	                     <div class="bd_eventContent" id="bd_eventImg">
	                        <c:forTokens var="filePath" items="${select.board_filepath }" delims=",">
	                        <c:if test="${not fn:contains(filePath,'octet-stream')}">
	                              <img src="${cpath }/upload/${filePath}" height="200">
	                          </c:if>
	                        </c:forTokens>
	                     </div>
            			<div id="bd_fileBtn" class="bd_viewBtn">파일 수정</div>
            		</c:forEach>
	              <div style="display: flex; justify-content: space-between;">
	              	<div></div>
	              	<div>
		            	<form method="POST" id="bd_eventUpdate" style="display: flex;" enctype="multipart/form-data" action="${cpath }/upload/update/event">    
		            		<div class="bd_fileInput" >
		            			<input type="file" id="bd_fileInput" name="upload" style="display: none;" multiple>
		<!-- 		            			<input type="hidden" id="selectedFileName" name="upload" value=""> -->
								<input type="hidden" id="get_address_value" name="address_value" value="">
								<input type="hidden" id="get_placeName" name="placeName" value="">
		            			<input type="hidden" id="textContent" name="board_content" value="">
		            			<input type="hidden" id="get_bd_idx" name="board_idx" value="">
		            		</div>
		            		<div><input type="submit" id="bd_viewSubmit" class="bd_viewBtn" value="수정 완료"></div>
			          	</form>
			          </div>
   		 		   </div>
	            </div>
           </div>
        
      </div>
    </div>
</div>
<script>

const up_board_idx = document.getElementById('up_board_idx')
let get_bd_idx = document.getElementById('get_bd_idx')
let get_address_value = document.getElementById('get_address_value')
let get_placeName = document.getElementById('get_placeName')
document.getElementById('bd_fileBtn').addEventListener('click', function() {
    const bd_fileInput = document.getElementById('bd_fileInput')
    bd_fileInput.click();
});

let bd_fileName = '';

document.getElementById('bd_fileInput').addEventListener('change', bd_displayImage);
function loadIDX() {
	get_bd_idx.value = parseInt(up_board_idx.innerText)
}
function bd_displayImage(event) {
	 console.log("bd_displayImage called");
    const files = event.target.files;
    const bd_eventContent = document.querySelectorAll('.bd_eventContent');
    console.log("Number of .bd_eventContent elements:", bd_eventContent.length);
    bd_eventContent.forEach(function(element) {
    	let images = element.querySelectorAll('img');
    	
    	if(images.length >= 1) {
    		images.forEach(function(image) {
    			image.remove();
    		}); 
    	}
    
	    const upImageTypes = ['image/jpeg', 'image/png', 'image/gif'];
	    for(let i = 0; i < files.length; i++) {
	    	let bd_file = files[i];
	    
		    if(bd_file && upImageTypes.includes(bd_file.type)) {
		    	bd_fileName = bd_file.name;
		    	const bd_fileURL = URL.createObjectURL(bd_file);
		    	console.log("Creating and appending image:", bd_fileName);
		    	const imgElem = document.createElement('img');
		    	
		    	imgElem.className = 'bd_image';
		    	imgElem.src = bd_fileURL;
		    	imgElem.alt = 'Uploaded Image';
		    	
		    	imgElem.width = 200;
	            imgElem.height = 200;
		    	element.appendChild(imgElem);
			}else {
				console.log("Unsupported image type or no file:", bd_file.name, bd_file.type); 
			}
	    }
        
    });
}


function goPopup(){
	
	   var pop = window.open(cpath + "/board/event/jusoPopup","pop","width=570,height=420,left=600,top=200, scrollbars=yes, resizable=yes"); 
	   
}

function jusoCallBack(roadFullAddr,addrDetail){

    // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
    let bd_address_value = document.querySelector("#bd_address_value");
    let bd_placeName = document.querySelector("#bd_placeName");
    
    bd_address_value.value = roadFullAddr;
    bd_placeName.value = addrDetail;
    get_address_value.value = document.getElementById('bd_address_value').value
    get_placeName.value = document.getElementById('bd_placeName').value
}

document.getElementById('bd_eventUpdate').addEventListener('submit', function(event) {
	const textAreaContent = document.querySelector('textarea').value;
	
	document.getElementById('textContent').value = textAreaContent;
});

document.getElementById('bd_eventImg').addEventListener('wheel',(event) => {
	document.getElementById('bd_eventImg').scrollLeft += event.deltaY;
    event.preventDefault();
  
 }, {passive: false});

window.onload = loadIDX
</script>
</body>
</html>