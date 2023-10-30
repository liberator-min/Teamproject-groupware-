<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/board/insert.css">


<div id="homeMain">
	<div id="bd_wrtieHead"><h1>게시글 작성</h1></div>
	<hr>
	
	<div id="bd_writeContent">
		 <form method="POST" id="bd_writeBody" name="bd_writeBody" enctype="multipart/form-data" action="${cpath }/upload">
		 <input type="text" name="board_category" value="건의사항" hidden="true">
		 	<div id="bd_writeTitle">
		 		<div class="gongji">건의사항</div>
		 		<div class="bd_writeTitle"><input type="text" name="board_title" placeholder="제목을 입력하세요" required="required" autocomplete="off"></div>
		 	</div>	<!-- end of #bd_writeTitle -->
		 	
	         <div class="bd_suggestionBody">   
	               <div class="bd_textArea">
	                  <div id="bd_addHuman"></div>
	                    <p><textarea id="suggestionText" name="board_content" placeholder="내용을 입력하세요" required></textarea></p>
	                    <p>🗃️&emsp;<input type="file" name="upload" multiple ></p>
	                 </div>	<!-- end of .bd_textArea -->
	                 
	                 <div class="bd_suggestionBodyRight">
	                    <div class="bd_selectHuman">
	                       <select id="bd_isnotice" name="isnotice">
	                          <option value="0">공개</option>
	                          <option value="1">비공개</option>
	                       </select>
	                      <div><input id="bd_selectHuman" type="button" name="bd_selectHuman" value="대상 선택"></div>
	                   </div>	<!-- end of .bd_selectHuman -->
	                   
	                <div id="bd_ListTitle"><h3>대상 list</h3>
	                   <details class="bd_humanList"><summary>경영부</summary>
	                      <div class="bd_humanitems">
	                         <c:forEach var="managementDTO" items="${selectHumanList }">
	                            <c:set var="department" value="${managementDTO.department }"/>
	                            <c:set var="job_id" value="${managementDTO.job_id }"/>
	                               <c:choose>
	                                  <c:when test="${department eq '경영부' and job_id >= 5}">
	                                     <div id="bd_humanSelectList">
	                                        <img src="${cpath }/resources/image/${managementDTO.profile_fic }" width="30" height="30">
	                                        <div id="bd_selectTarget" onclick="copySelect(event)" data-userid="${managementDTO.employee_userid }">${managementDTO.employee_name }</div>
	                                     </div>
	                                  </c:when>
	                               </c:choose>
	                         </c:forEach>
	                      </div>
	                   </details>
	                   <details class="bd_humanList"><summary>인사부</summary>
	                      <div class="bd_humanitems">
	                         <c:forEach var="managementDTO" items="${selectHumanList }">
	                            <c:set var="department" value="${managementDTO.department }"/>
	                            <c:set var="job_id" value="${managementDTO.job_id }"/>
	                               <c:choose>
	                                  <c:when test="${department eq '인사부' and job_id >= 4}">
	                                     <div id="bd_humanSelectList" >
	                                        <img src="${cpath }/resources/image/${managementDTO.profile_fic }" width="30" height="30">
	                                        <div id="bd_selectTarget" onclick="copySelect(event)" data-userid="${managementDTO.employee_userid }">${managementDTO.employee_name }</div>
	                                     </div>
	                                  </c:when>
	                               </c:choose>
	                         </c:forEach>
	                      </div>
	                   </details>
	                   <details class="bd_humanList"><summary>영업부</summary>
	                      <div class="bd_humanitems">
	                         <c:forEach var="managementDTO" items="${selectHumanList }">
	                            <c:set var="department" value="${managementDTO.department }"/>
	                            <c:set var="job_id" value="${managementDTO.job_id }"/>
	                            <c:choose>
	                               <c:when test="${department eq '영업부' and job_id >= 4}">
	                                  <div id="bd_humanSelectList" >
	                                     <img src="${cpath }/resources/image/${managementDTO.profile_fic }" width="30" height="30">
	                                     <div id="bd_selectTarget" onclick="copySelect(event)" data-userid="${managementDTO.employee_userid }">${managementDTO.employee_name }</div>
	                                  </div>
	                               </c:when>
	                            </c:choose>
	                         </c:forEach>
	                      </div>
	                   </details>
	                   <details class="bd_humanList"><summary>마케팅부</summary>
	                      <div class="bd_humanitems">
	                         <c:forEach var="managementDTO" items="${selectHumanList }">
	                            <c:set var="department" value="${managementDTO.department }"/>
	                            <c:set var="job_id" value="${managementDTO.job_id }"/>
	                            <c:choose>
	                               <c:when test="${department eq '마케팅부' and job_id >= 4}">
	                                  <div id="bd_humanSelectList" >
	                                     <img src="${cpath }/resources/image/${managementDTO.profile_fic }" width="30" height="30">
	                                     <div id="bd_selectTarget" onclick="copySelect(event)" data-userid="${managementDTO.employee_userid }">${managementDTO.employee_name }</div>
	                                  </div>
	                               </c:when>
	                            </c:choose>
	                         </c:forEach>
	                      </div>
	                   </details>
	                   <details class="bd_humanList"><summary>개발부</summary>
	                      <div class="bd_humanitems">
	                         <c:forEach var="managementDTO" items="${selectHumanList }">
	                            <c:set var="department" value="${managementDTO.department }"/>
	                            <c:set var="job_id" value="${managementDTO.job_id }"/>
	                            <c:choose>
	                               <c:when test="${department eq '개발부' and job_id >= 4}">
	                                  <div id="bd_humanSelectList" >
	                                     <img src="${cpath }/resources/image/${managementDTO.profile_fic }" width="30" height="30">
	                                     <div id="bd_selectTarget" onclick="copySelect(event)" data-userid="${managementDTO.employee_userid }">${managementDTO.employee_name }</div>
	                                  </div>
	                               </c:when>
	                            </c:choose>
	                         </c:forEach>
	                      </div>
	                   </details>
	                   <details class="bd_humanList"><summary>재무부</summary>
	                      <div class="bd_humanitems">
	                         <c:forEach var="managementDTO" items="${selectHumanList }">
	                            <c:set var="department" value="${managementDTO.department }"/>
	                            <c:set var="job_id" value="${managementDTO.job_id }"/>
	                            <c:choose>
	                               <c:when test="${department eq '재무부' and job_id >= 4}">
	                                  <div id="bd_humanSelectList" >
	                                     <img src="${cpath }/resources/image/${managementDTO.profile_fic }" width="30" height="30">
	                                     <div id="bd_selectTarget" onclick="copySelect(event)" data-userid="${managementDTO.employee_userid }">${managementDTO.employee_name }</div>
	                                  </div>
	                               </c:when>
	                            </c:choose>
	                         </c:forEach>
	                      </div>
	                   </details>
	                  <div id="bd_suggestionSubmit" onclick="insertReceiver()">선택 완료</div>
	                   <div id="bd_ListTitleIndex"></div>
	                </div> 
	                <input type="hidden" name="employee_idx" value="${login.employee_idx }">
	              	 <div class="bd_suggestionSubmit"><input type="submit" name="writeSubmit" value="작성 완료"></div>
	              </div>
	             </div>
	        </form>
	    </div> 
	</div>

<script>
   const selectHuman = document.getElementById('bd_selectHuman');
   const openSelect = document.getElementById('bd_ListTitleIndex');
   const addHuman = document.getElementById('bd_addHuman')
   const childNodes = addHuman.childNodes;
   const bd_submit = document.getElementById('bd_suggestionSubmit');
   const bd_isnotice = document.getElementById('bd_isnotice')
   const bd_writeBody = document.getElementById('bd_writeBody')
   let bd_selectTarget = document.getElementById('bd_selectTarget')
   let bd_userID = bd_selectTarget.getAttribute('data-userid')
   
   bd_isnotice.addEventListener('change', checkIsnotice);
   
   addHuman.addEventListener('wheel',(event) => {
	   addHuman.scrollLeft += event.deltaY;
	   event.preventDefault();
	   
   }, {passive: false});
   
   function checkIsnotice() {
	   if(bd_isnotice.selectedIndex == '1') {
		   openSelect.style.display = 'none'
	   }
	   else if(bd_isnotice.selectedIndex == '0') {
		   openSelect.style.display = 'block'
	   }
   }
//    console.log(addHuman.firstChild)
   function selectList() {
      if(bd_isnotice.selectedIndex != '0' && openSelect.style.display === 'block') {
         openSelect.style.display = 'none'
      }
      else {
         openSelect.style.display = 'block'
      }
   }

   function copySelect(event) {
//       console.log(event.target.innerText)
//       console.log(addHuman.firstChild.innerText)
      
      if(event.target.classList.contains('copySelect')) {
         for(let i = 0; i < childNodes.length; i++) {
            if(event.target.innerText === childNodes[i].innerText) {
               event.target.classList.remove('copySelect')
               addHuman.removeChild(childNodes[i])
            }
         }
      }
      else{
         if(addHuman.firstChild === null) {
            event.target.classList.add('copySelect')
            addHuman.appendChild(event.target.parentNode.cloneNode(true))
         }
         else if(addHuman.firstChild !== null) {
            for(let i = 0; i < childNodes.length; i++) {
               console.log(childNodes[i].innerText)
               console.log(addHuman.firstChild, 'fdaf')
               if(event.target.innerText !== (childNodes[i].innerText)) {
                  event.target.classList.add('copySelect')
               }
               else if(event.target.innerText === (childNodes[i].innerText)){
            	   event.target.classList.remove('copySelect')
            	    
               }
            }
         addHuman.appendChild(event.target.parentNode.cloneNode(true))
         }
         
      }
   }
   
   
   function checkAndToggleClass() {
	   if(bd_addHuman.firstChild !== null) {
		   bd_submit.classList.add('bd_select');
	   }
	   else {
		   bd_submit.classList.remove('bd_select');
	   }
   }
   function insertReceiver() {
	   
	  if(bd_addHuman.firstChild === null) {
		  alert('선택된 대상이 없습니다.')
	  }
	  else{
	      let receiverArr = [];
	      for(let i = 0; i < childNodes.length; i++) {
	//          console.log(childNodes[i].innerText);
	// 			console.log(childNodes[i].childNodes[3].getAttribute('data-userid'))
	         receiverArr.push({
	        	employee_userid : childNodes[i].childNodes[3].getAttribute('data-userid'),
	            senderReceiver: childNodes[i].innerText.split(",")[0],
	            receiver_idx: parseInt(childNodes[i].innerText.split(",")[1])
	         });
	      }
	      console.log(receiverArr);
	      
	      fetch(cpath + '/suggestion/insert/receiver', {
	         method: 'POST',
	         headers: {
	            'Content-Type': 'application/json'
	         },
	         body: JSON.stringify(receiverArr)
	      })
	      alert('선택 완료')
	      checkAndToggleClass();
	  }
   }
   
//    bd_writeBody.addEventListener('submit', function(event) {
	   
// 	   if(bd_isnotice.selectedIndex == '1' && addHuman.firstChild === null) {
// 		   event.preventDefault();
// 		   alert('선택된 대상이 없습니다.');
// 	   }
//    });
	bd_writeBody.addEventListener('submit', function(event) {
		if(bd_isnotice.selectedIndex == '1') {
			if(!bd_submit.classList.contains('bd_select')) {
				event.preventDefault();
				alert('비공개 상태 입니다. 대상 선택 완료 후 다시 시도 바랍니다.');
			}
		}
	})
   selectHuman.onclick = selectList
    bd_submit.onclick = insertReceiver
</script>
</body>
</html>