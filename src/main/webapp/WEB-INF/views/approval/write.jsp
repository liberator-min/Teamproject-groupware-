<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="approval_side.jsp" %>
<style>



</style>
<div id="approval_select">
	<div id="AppWrselectOne">
		<a href="${cpath }/approval/pay_request">
			<img src="${cpath }/resources/approval/문서.png"></a>
			<div>결제 신청</div>
		
	</div>
	<div id="AppWrselectTwo">
		<a href="${cpath }/approval/business_request">
			<img src="${cpath }/resources/approval/문서.png"></a>
			<div>업무 신청</div>
	</div>
	<div id="AppWrselectThree">
		<a href="${cpath }/approval/vacation_request">
			<img src="${cpath }/resources/approval/문서.png"></a>
			<div>휴가/연(반)차 신청서</div>
	</div>
</div>

</body>
</html>