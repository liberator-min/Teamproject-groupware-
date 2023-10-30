	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/approval/apSideWrite.css">

<div id="homeMain">
<div id="approval_category">
	<ul class="approval_ul">
		<c:if test="${login.job_id <= 5}">
			<li><a  href="${cpath }/approval/write">결재 신청</a></li>
			<li><a  href="${cpath }/approval/request_list">결재 신청 목록</a></li>
		</c:if>
		<c:if test="${login.job_id >= 5}">
			<li><a href="${cpath }/approval/standby_list">결재 대기 목록</a></li>
		</c:if>
	</ul>
</div>


