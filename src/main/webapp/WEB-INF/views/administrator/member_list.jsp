<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
	#memberlist {
		margin-left: 1%;
		margin: 0 1.4%;
		text-align: center;
	}
	#memberlist > div {
		display: flex;
	}
	#memberlist > div > div {
		flex: 1;
	}
	#memberlist > .list {
		font-weight: bold;
	}
	#memberlist > .list > .top {
		margin: auto;
	}
	#memberlist > .title {
		border-bottom: 1px solid black;
		padding: 2% 0;
		font-weight: bold;
		font-size: 17px;
	}
	#memberlist > .content {
		border-bottom: 1px solid black;
		padding: 2% 0;
	}
	a {
		text-decoration: none;
		color: black;
	}
	.list > .top_left {
		font-size: 45px;
		margin-bottom: 25px;
		text-align: left;
		margin-left: 1.45%;
	}
	.list > .top_right {
		text-align: right;
		display: inline;
		padding-top: 40px;		
	}
</style>
<div id="homeMain">
	<div id="memberlist"></div>
</div>

<script>
	
	function memberListHandler() {
		const memberlist = document.getElementById('memberlist')
		let tag = ''
		tag += '<div class="list">'
		tag += '	<div class="top_left">회원 관리</div>'
		tag += `	<div class="top_right"><a href="${cpath }/administrator/member_insert"><button>사원 추가</button></a></div>`
		tag += '</div>'
		tag += '<div class="title">'
		tag += '	<div>사원 번호</div>'	
		tag += '	<div>성명</div>'	
		tag += '	<div>부서</div>'	
		tag += '	<div>직위</div>'	
		tag += '	<div>고용 날짜</div>'	
		tag += '	<div></div>'	
		tag += '	<div></div>'	
		tag += '</div>'
		tag += `<c:forEach var="dto" items="${memberList }">`
		tag += '<div class="content">'
		tag += `	<div>${dto.employee_idx }</div>`
		tag += `	<div>${dto.employee_name }</div>`
		tag += `	<div>${dto.department }</div>`
		tag += `	<div>${dto.job_name }</div>`
		tag += `	<div>${dto.hire_date }</div>`
		tag += `	<div>`
		tag += `		<a href="${cpath }/administrator/member_update/${dto.employee_idx}">`
		tag += `			<button>회원정보 수정</button>`
		tag += `		</a>`
		tag += `	</div>`
		tag += `	<div>`
		tag += `		<a href="${cpath }/administrator/member_delete/${dto.employee_idx}">`
		tag += `			<button id="deleteBtn">삭제</button>`
		tag += `		</a>`
		tag += `	</div>`
		tag += '</div>'
		tag += `</c:forEach>`
		memberlist.innerHTML += tag
	}
	
	document.addEventListener('DOMContentLoaded', memberListHandler)
</script>

</body>
</html>