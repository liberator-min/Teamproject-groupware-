<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="approval_side.jsp" %>
<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/approval/apEtc.css">

	

<div id="ApprovSO_root_select">
	<div class="ApprovSO_top">
		<div class="ApprovSO_requestName">
			<c:choose>
				<c:when test="${dto.type=='p'}">결제 신청서</c:when>
				<c:when test="${dto.type=='b'}">업무 신청서</c:when>
				<c:when test="${dto.type=='v'}">휴가/연(반)차 신청서</c:when>
			</c:choose>
		</div>
		<div class="resultImg">
			<c:choose>
				<c:when test="${dto.isapprove==0 }"><img src="${cpath }/resources/approval/0.png"></c:when>
				<c:when test="${dto.isapprove==1 }"><img src="${cpath }/resources/approval/결재안.png"></c:when>
				<c:when test="${dto.isapprove==2 }"><img src="${cpath }/resources/approval/1.png"></c:when>
				<c:when test="${dto.isapprove==3 }"><img src="${cpath }/resources/approval/2.png"></c:when>
				<c:when test="${dto.isapprove==4 }"><img src="${cpath }/resources/approval/3.png"></c:when>
			</c:choose>
		</div>
	</div>
	
	<table id="approveSoTable">
		<tr>
			<td>소 속</td>
			<td class="approveSoValue">${dto.w_department }</td>
		</tr>
		<tr>
			<td class="name">성 명</td>
			<td class="approveSoValue">${dto.employee_name }</td>
		</tr>
		<tr>
			<td>직 위</td>
			<td class="approveSoValue">${dto.job_name }</td>
		</tr>
		<tr>
			<td>기 간</td>
			<td class="approveSoValue">${dto.start_date } ~ ${dto.end_date }</td>
		</tr>
		<c:if test="${not empty dto.approval_filepath }">
		<tr>
			<td>첨부파일</td>
			<td class="approveSoValue">
				${dto.approval_filepath }
				<a href="${cpath }/approvalUpload/${dto.approval_filepath}" download target="_self">
					<button id="approveSoDownBtn">다운로드</button>
				</a> 
			</td>
		</tr>
		</c:if>
		<tr class="approveSoSa">
			<td>사 유</td>
			<td class="approveSosaValue"><div>${dto.approval_content }</div></td>
		</tr>
	</table>
</div>
</body>
</html>