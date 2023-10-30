<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/mypage.css">
	


<div id="homeMain">
	<div id="mypage_userProfile"></div>
	<div id="userProfile_Img_Modal">
		<div id="modal-userProfile_Img" class="hidden">
			<div id="overlay-mypage"></div>
			<div id="modal-content-mypage"></div>
		</div>
	</div>
</div>

<script>
	document.addEventListener('DOMContentLoaded', userProfileHandler)
	document.getElementById('overlay-mypage').onclick = closeModalMypage
</script>

</body>
</html>