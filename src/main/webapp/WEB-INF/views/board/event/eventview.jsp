<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>

<style>
   #popup_img {
         display: none; 
        /* 다른 필요한 스타일 속성들 */
        position: fixed;
        top: 262px;
        right: 60px;
        width: 30vw;
        height: 40vh;
        border-radius: 25px;
        background-color: rgba(0,0,0,0.5);
        justify-content: center;
        align-items: center;
        z-index: 1000;  
        overflow: hidden;
    }
   #bd_eventBody {
      display: flex;
      margin: 0 auto;
      margin-top: 10px;
      justify-content: center;
   }
   #bd_eventMap {
      width: auto;   /* 28vw */
      height: 40vh;
      background-color: pink;
      margin: 8px;
      border-radius: 20px;
      
   }
   #bd_eventright {
      width: 30vw;
      height: 60vh;
   }
   .bd_eventContent {
      width: 55vw;
      height: 69vh;
      margin: 0 10px;
      diplay:flex;
      flex-direction: column;
      justify-content: space-around;
      overflow-y: scroll;
      box-shadow: 2px 3px 3px -2px rgba(0, 0, 0, 0.1);
   }
   .bd_eventReply {
      width: auto;
      height: 15.9vh;
      margin: 0 7px;
      border: 1px solid #bbb;
      border-radius: 8px;
   }
   #bd_replyWrap {
      width: 29vw;
      height: 16vh;
      overflow-y: scroll;
/*       border-radius: 25px 25px 0px 0px; */
   }
   #bd_replyWrap::-webkit-scrollbar{
/*       border:0.5px solid grey; */
/*       border-radius: 10px; */
      width:0.7vw;   
   }
   
   #bd_replyWrap::-webkit-scrollbar-thumb {
/*       background-color: #b1d1e4; */
/*        border-radius: 10px; */
    }
    #bd_replyWrap::-webkit-scrollbar-track {
/*        background-color: #83b1c9; */
/*        border-radius: 10px;       */
    }
   #bd_replyIndex {
      display: flex;
      align-items: center;
   }
   #bd_replyIndex > div:nth-child(1){
        flex:1;
   }
   #bd_replyIndex > div:nth-child(2){
        flex:2;
   }
   #bd_replyIndex > div:nth-child(3){
          flex:7;
      text-align: start;
      word-wrap: break-word;
       overflow-wrap: break-word;
       word-break: break-all; 
   }
   
   form[name="bd_eventReply"] {
      display: flex;
   }
   #bd_place {
      display: flex;
      margin-left: 14px;
      font-size: 24px;
      margin-top: 0px;
      margin-bottom: 2px;
   }
   #bd_reply_profile{
      border-radius: 100%;
   }
   #bd_replySubmit {
      border-radius: 0px 4px 4px 0px;
      background-color: #2a9df4;
      cursor:pointer;
      border: 1px solid #2a9df4;
      border-left: 0;
      height: 3.4vh;
      width: 5vw;
      font-size: 15px;
      line-height: 3.3vh;
      color: #eee;
   }
   #bd_replySubmit:hover {
      color: black;
      background-color: #eee;
      border: 1px solid #eee;
   }
   input[name="reply_content"] {
      border-radius: 4px 0px 0px 4px;
      border: 1px solid #eee;
      width: 24.5vw;
      height: 3vh;
      padding-left: 20px;
   }
   .bd_replyInsert{
      display: flex;
/*       margin-top: 16px; */
		border: 2px solid #dadada;
		border-radius: 4px;
   }
   #bd_address{
      color: grey;
      cursor: pointer;
   }
   #bd_img {
      height: 20vh;
/*       border: 1px solid grey; */
      border-radius: 10px;
/*       margin: 0 10px; */
      margin: auto;
      margin-top: 50px;
      overflow: hidden;
      white-space: nowrap;
      width: 40vw;
      justify-content: space-around;
   }
   
   .ev_title {
      margin-top: 20px;
      text-align: left;
      padding: 10px 45px;
      padding-bottom: 0;
   }
   .ev_subtitle {
      font-size: 32px;
      padding-bottom: 2px;
   }
   #ev_content {
      height: 22.5vh;
      display: flex;
      flex-direction: column;
      justify-content: space-around;
      overflow: hidden;
      padding: 2px 45px;
      text-align: left;
      font-size: 18px;
      white-space: pre;
    }
    .bd_viewBtns {
       display: flex;
       padding-left: 720px;
       margin-top: 40px;
    }
   .bd_eventleft {
   	  width: 56vw;
      height: 68.8vh;
   }
   .bd_eventContent::-webkit-scrollbar{
      width:0.4vw;
   }
   .bd_eventContent::-webkit-scrollbar-thumb {
      border-radius: 0;
   }
   .bd_eventContent::-webkit-scrollbar-track {
      border-radius: 0;      
   }
   .bd_eventReply_title {
      text-align: left;
      font-size: 20px;
      margin: 10px;
      margin-left: 20px;
      padding-top: 10px;
   }
   .bd_viewBtn {
      border: 1px solid #eee;
      border-radius: 4px;
      background-color: #eee;
   }
   .bd_viewBtn:hover {
      border: 1px solid #ccc;
      background-color: #ccc;
   }
   .ev_subtitle{
	background-color: #F0F0F0;
	border-radius: 10px;
 	padding: 5px; 
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
            <div id="bd_category"><a href="${cpath }/board/event/list"><button class="bd_category">경조사</button></a></div>
            <div id="bd_category"><a href="${cpath }/board/club/list"><button class="bd_category">자유게시판</button></a></div>
         </div>
         <div id="bd_eventBody">
            <c:forEach var="select" items="${selectList }">
            <div class="bd_eventleft">
               <div class="bd_eventContent">
                  <div class="ev_title">
                     <div class="ev_subtitle">${selectOne.board_title }</div>
                  </div>
                  <div id="ev_content">
                     <div>${selectOne.board_content }</div>
                     <div class="ev_content_map">
                        <div class="ev_content_place">장소 : ${selectAddress.placeName }</div>
                        <div class="ev_content_address">주소 : ${selectAddress.address_value }</div>
                     </div>
                  </div>
                  <div id="bd_img">
                     <c:forTokens var="filePath" items="${select.board_filepath }" delims=",">
                     <c:if test="${not fn:contains(filePath,'octet-stream')}">
                     <img src="${cpath }/upload/${filePath}" height="200">
                     </c:if>
                     </c:forTokens>
                  </div>
                  <div id="popup_img"></div>
                  <div class="bd_eventBtns">
                  <c:if test="${login.employee_idx eq selectOne.writer_id or login.employee_idx == 0}">
                  <div class="bd_viewBtns">
                     <div class="bd_viewBtn"><a href="${cpath }/board/selectOne/${selectOne.board_idx }/update/">게시글 수정</a></div>
                     <div class="bd_viewBtn bd_deleteBtn"><a href="${cpath }/board/event/delete/${selectOne.board_idx }">게시글 삭제</a></div>
                  </div>
                  </c:if>
               </div>
               </div>
               
            </div>
            <div id="bd_eventright">
               <div id="bd_place">장소 : <address id="bd_address" value="${selectAddress.address_value }">${selectAddress.placeName }</address></div>
               <div id="bd_eventMap"></div>
               <div class="bd_eventReply_title">댓글</div>
               <div class="bd_eventReply">
                  <div id="bd_replyWrap">
                     <div id="bd_replyIndex"></div>
                  </div>
                  <div class="bd_replyInsert">        
                     <input type="text" id="reply_Content" name="reply_content" onkeyup="insertReply(event)">
                     <input type="submit" id="bd_replySubmit" onclick="insertReply(event)" value="댓글 작성">
                  </div>
               </div>
            </div>
            </c:forEach>
         </div>
      </div>
   </div>
</div>

<script>
   //const x = 33.450701, y = 126.570667
   const replySubmit = document.getElementById('bd_replySubmit');
   const reply_content = document.getElementById('reply_Content');
   const bd_img = document.getElementById('bd_img');
   let popup_img = document.getElementById('popup_img');
   var intervalID = setInterval(loadHandler, 3000);
   const board_id = '${selectOne.board_idx}'
   const profile_fic = '${login.profile_fic}'
   const bd_replyWrap = document.getElementById('bd_replyWrap')
   const observer = new MutationObserver(scrollBottom);
   
   
   const y = 129.132959320724, x = 35.1669483088462
   const address = document.getElementById('bd_address')
   
   const mapContainer = document.getElementById('bd_eventMap'), // 지도를 표시할 div 
        mapOption = {
            center: new kakao.maps.LatLng(x, y), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };  
   
   // 지도를 생성합니다    
   const map = new kakao.maps.Map(mapContainer, mapOption); 
     
   function handler(event) {
      let target = event.target;
      
      if(target.classList.contains('select')) {
         target.classList.remove('select')
      }
      else {
         target.classList.add('select')
      }
      
      const geocoder = new kakao.maps.services.Geocoder();
      const place_name = event.target.innerText;
      const address_value = event.target.getAttribute('value')
      console.log(place_name)
      console.log(address_value)
      
      geocoder.addressSearch(address_value, function(result, status) {
         
         if(status === kakao.maps.services.Status.OK) {
            
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
            console.log(result[0].address_name)
            var marker = new kakao.maps.Marker({
               map: map,
               position: coords
            });
            var infowindow = new kakao.maps.InfoWindow({
               content: '<div style="min-width:150px;text-align:center;padding:6px 3px;">' + event.target.innerText + '</div>'
            });
            infowindow.open(map, marker);
            console.log(event.target.innerText, coords)
            map.setCenter(coords);
         }
      });
   }
   bd_img.addEventListener('wheel',(event) => {
      bd_img.scrollLeft += event.deltaY;
      event.preventDefault();
    
   }, {passive: false});
   
   function scrollBottom() {
      bd_replyWrap.scrollTop = bd_replyWrap.scrollHeight;
   }
   
   observer.observe(bd_replyWrap, {childList: true});
   
   function loadHandler() {
      const replylist = document.getElementById('bd_replyWrap')
      
      fetch(cpath + '/event/eventview/' + board_id)
      .then(resp => resp.json())
      .then(json => {
         let tag = ''
         json.forEach(dto => {
            tag += '<div id="bd_replyIndex">'
            tag += '   <div class="bd_reply_profile"><img id="bd_reply_profile" src="${cpath}/profileupload/' + dto.profile_fic + '" width="50" height="50"></div>'
            tag += '   <div class="bd_replyWriter">'+ dto.employee_name +'</div>'
            tag += '   <div class="bd_replyContent">'+ dto.reply_content +'</div>'
            tag += '</div>'
            console.log(dto.profile_fic)
         })
         replylist.innerHTML = tag
      })
      
   }
   
   function insertReply(event) {
      if(event.type === 'click' || event.key === 'Enter' || event.keyCode === 13) {
      const replyData = [];
//       const writer_id =
         
      replyData.push({
         board_id : '${selectOne.board_idx}',
         writer_id : '${login.employee_idx}',
         reply_content : reply_content.value,
         profile_fic : '${login.profile_fic}'
      })
      fetch(cpath + '/event/reply/' + board_id, {
         method: 'POST',
         headers: {
            'Content-Type' : 'application/json'
         },
         body: JSON.stringify(replyData)
      })
      reply_content.value = '';
      loadHandler(event)
      }
   }
   
   bd_img.addEventListener('click', function(event) {
       popup_img.style.display = 'block';
      if(event.target.tagName.toLowerCase() === 'img') {
         const srcValue = event.target.getAttribute('src');
         const newImage = document.createElement('img');
         
           const popupWidth = popup_img.clientWidth;
           const popupHeight = popup_img.clientHeight;

           // 새 이미지의 크기를 설정합니다.
           newImage.style.width = popupWidth + 'px';
           newImage.style.height = popupHeight + 'px';
         newImage.setAttribute('src',srcValue);
         
         popup_img.appendChild(newImage);
      };
   })
   
   document.addEventListener('click', function(event) {
      if (!popup_img.contains(event.target) && event.target !== bd_img && !bd_img.contains(event.target)) {
        popup_img.style.display = 'none';
           // popup_img 내의 모든 이미지 제거
           while (popup_img.firstChild) {
               popup_img.removeChild(popup_img.firstChild);
           }
       }
   });

   window.onload = loadHandler   
   address.onclick = handler
</script>
</body>
</html>