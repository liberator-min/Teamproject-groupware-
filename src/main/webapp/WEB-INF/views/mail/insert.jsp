<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" type="text/css" href ="${cpath }/resources/css/mail/insert.css">

</head>
<body>

<div id="homeMain">	
	<div id="mailMainBox">
		<div id="mailSideBox">
				<div><a href="${cpath }/mail/receiveList">받은 쪽지&emsp; ${receiveNoCount }</a></div>
				<div><a href="${cpath }/mail/insert">쪽지쓰기</a></div>
				<div><a href="${cpath }/mail/sendList">쓴 쪽지함</a></div>
				<div><a href="${cpath }/mail/deleteList">휴지통&emsp; ${deleteCount}</a></div>
				
				<form id="mail_column" method="POST" action="${cpath }/mail/receiveList">
					<div class="mailSearchBox">
						<input type="text" id="mail_insert_inputSearch" name="mail_search" placeholder="검색어를 입력하세요" >
						<input type="submit" name="mail_submit" value="검색">
					</div>
						<select id="mail_insert_select" name="mail_column">
							<option value="mail_title">제목으로 검색</option>
							<option value="mail_writer">보낸이로 검색</option>
							<option value="mail_receiver">받는이로 검색</option>
						</select>
				</form>
			</div>	<!-- end of #mailSideBox-->
	
	
		<div id="writeMailBox">
			 <form method="POST" enctype="multipart/form-data" action="${cpath }/mail/upload">
			 	 <input type="text" name="mail_writer" value="${login.mail }" hidden="true">
				 <div class="mailReceSel">
				 	<label for="itemSelect">받는 사람&emsp;</label>
					        <select class="itemSelect" name="mail_receiver" required>
					            <c:forEach items="${list}" var="item">
					                <option value="${item.mail }">${item.mail} : ${item.employee_name }</option>
					            </c:forEach>
					   </select>
				 </div>
				 <div class="sendMailTitle">제목&emsp;&emsp;&emsp;<input type="text" name="mail_title" required></div>
				 <textarea id="mailTextArea" name="mail_content" required></textarea>
				 <div class="mailFileBox">🗃️&emsp;<input type="file" name="mailupload" multiple></div>
				 <div class="mailSendBtn"><button type="submit">보내기</button></div>
			 </form>
		</div>
	</div>
</div>