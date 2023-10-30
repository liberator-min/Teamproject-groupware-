<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<link rel="stylesheet" type="text/css" href ="${cpath }/resources/css/mail/selectone/delete.css">
</head>
<body>




<div id="homeMain">
	<div id="mailMainBox">
		<div id="mailSideBox">
				<div><a href="${cpath }/mail/receiveList">받은 쪽지&emsp; ${receiveNoCount }</a></div>
				<div><a href="${cpath }/mail/insert">쪽지쓰기</a></div>
				<div><a href="${cpath }/mail/sendList">쓴 쪽지함</a></div>
				<div><a href="${cpath }/mail/deleteList">휴지통&emsp; ${deleteCount}</a></div>
				
				
			</div>	<!-- end of #mailSideBox-->
			
			 <div id="selectMailBox">
            <div class="selectMTitle">${dto.mail_title }</div>
            <div class="selectMWriter">작성자&emsp;&emsp;${dto.mail_writer }</div>
            <div class="selectMDate">${dto.mail_writedate}</div>
            <div class="selectMContent">${dto.mail_content}</div>
            <div class="selectMFilesWrap">
               <div>첨부파일</div>
               <div class="selectMFiles">
                  <c:forEach var="list" items="${mailFilePath }">
                     <c:forTokens var="filePath" items="${list.mail_filePath }" delims=",">
                        <p class="filePathA" data-filePath="${filePath }"><a href="${cpath}/mailupload/${filePath}" download target="_self"  data-filePath="${filePath }">${result }</a></p>
                     </c:forTokens>
                  </c:forEach>
               </div>
            </div>
         </div>
	</div>	
</div>
<script>
let filePathA = document.querySelectorAll('.filePathA')


for(let i = 0; i < filePathA.length; i++) {
	let filename =filePathA[i].getAttribute('data-filePath')
	let result = filename.substring(32,filename.length)
	filePathA[i].firstChild.innerText = result
	console.log('값 줘:' + filePathA[i].firstChild.innerText)
	filePathA[i].firstChild.style.color = 'blue'
	console.log(result)
}

</script>
</body>
</html>