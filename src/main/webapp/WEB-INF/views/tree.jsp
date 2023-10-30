<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Group Ware</title>
<style>
	#treebox {
		width: inherit;
		overflow-x: hidden;
		overflow-y: scroll;
		
	}
	#treebox::-webkit-scrollbar {
    	display: none;
	}
	.treeImg {
		width: 100px;
		height: 100px;
	}
	.CEO {
		margin-top: 10px;
		margin-left: 730px;
		width: 150px;
		height: 150px;
		text-align: center;
	}
	.treeInfo {
		font-size: 16px;
	}
	.hBar {
		font-size: 80px;
		margin: 0 auto;
		width: 80px;
		height: 90px;
		padding-bottom: 30px;
		margin-top: -30px;
		margin-left: 770px;
	}
	.wBar {
		width: 1065px;
		font-size: 100px;
		margin-top: -100px;
		margin-left: 278px;
		overflow: hidden;
	}
	.barses {
		display: flex;
		font-size: 100px;
		width: 1200px;
		justify-content: space-between;
		margin: -85px 210px;
	}
	.Bars {
		margin: 0 20px;
		height: 80px;
		overflow: hidden;
	}
	#tree_departments {
		display: flex;
		justify-content: space-between;
		width: 1250px;
		margin-left: 180px;
		margin-top: 70px;
	}
	.departmentImg {
		width: 150px;
		height: 100px;
		margin: 0 10px;
	}
	.depart {
		border: 1px solid #EAF5FF;
		background-color: #EAF5FF;
		border-radius: 20px;
		width: 100px;
		margin-left: 20px;
		padding: 10px 20px;
		text-align: center;
		font-size: 18px;
		font-weight: bold;
		cursor: pointer;
	}
	#departPeople {
		width: 1165px;
		margin-left: 230px;
		display: flex;
		justify-content: space-between;
	}
	.subInfoBox {
		font-size: 17px;
		padding: 20px 0;
	}
	.subInfo {
		padding: 10px 0;
	}
</style>
<body>

<div id="homeMain">
	<div id="treebox">
		<c:forEach var="dto" items="${treeList }">
		<c:if test="${dto.job_id == 6}">
		<div class="CEO">
			<img class="treeImg" src="${cpath }/profileupload/${dto.profile_fic}">
			<div class="treeInfo">
				<div class="treeName">${dto.employee_name }</div>
				<div class="treeJobId">${dto.job_name }</div>
			</div>
		</div>
		</c:if>
		</c:forEach>
		
		<div class="hBar">│</div>
		<div class="wBar">────────────</div>
		<div class="barses">
			<div class="Bars">│</div>
			<div class="Bars">│</div>
			<div class="Bars">│</div>
			<div class="Bars">│</div>
			<div class="Bars">│</div>
		</div>
		<div id="tree_departments">
			<div class="Sdep">
				<img class="departmentImg" src="${cpath }/resources/tree/개발부.png">
				<div class="depart">개발부</div>
			</div>
			<div class="Sdep">
				<img class="departmentImg" src="${cpath }/resources/tree/영업부.png">
				<div class="depart">영업부</div>
			</div>
			<div class="Sdep">
				<img class="departmentImg" src="${cpath }/resources/tree/인사부.png">
				<div class="depart">인사부</div>
			</div>
			<div class="Sdep">
				<img class="departmentImg" src="${cpath }/resources/tree/재무부.png">
				<div class="depart">재무부</div>
			</div>
			<div class="Sdep">
				<img class="departmentImg" src="${cpath }/resources/tree/마케팅부.png">
				<div class="depart">마케팅부</div>
			</div>
		</div>
		
		<div id="departPeople">
			<div class="subInfoBox">
			<c:forEach var="dto" items="${treeList }">		
				<c:if test="${dto.department eq '개발부' }">
				<div class="subInfo">${dto.employee_name } ${dto.job_name }</div>
				</c:if>
			</c:forEach>
			</div>
			<div class="subInfoBox">
			<c:forEach var="dto" items="${treeList }">	
				<c:if test="${dto.department eq '영업부' }">
				<div class="subInfo">${dto.employee_name } ${dto.job_name }</div>
				</c:if>
			</c:forEach>
			</div>
			<div class="subInfoBox">
			<c:forEach var="dto" items="${treeList }">	
				<c:if test="${dto.department eq '인사부' }">
				<div class="subInfo">${dto.employee_name } ${dto.job_name }</div>
				</c:if>
			</c:forEach>
			</div>
			<div class="subInfoBox">
			<c:forEach var="dto" items="${treeList }">	
				<c:if test="${dto.department eq '재무부' }">
				<div class="subInfo">${dto.employee_name } ${dto.job_name }</div>
				</c:if>
			</c:forEach>
			</div>
			<div class="subInfoBox">
			<c:forEach var="dto" items="${treeList }">	
				<c:if test="${dto.department eq '마케팅부' }">
				<div class="subInfo">${dto.employee_name } ${dto.job_name }</div>
				</c:if>
			</c:forEach>
			</div>
		</div>
	</div>
</div>
		
<script>
	function selectdp_Handler(event) {
		const depart = event.currentTarget.textContent
	    window.location.href = '${cpath}/tree_select/' + depart
	}
	
	document.querySelectorAll('.depart').forEach(item => {
	        item.onclick = selectdp_Handler
	 })
</script>

</body>
</html>