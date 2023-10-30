<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="approval_side.jsp" %>
<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/approval/request_list.css">

	

	<div id="approvalRs_list">
		<table id="approvalRs_table">
		<thead>
			<tr>
				<th class="ApproveRsTh">제목</th>
				<th class="ApproveRsTh">승인자</th>
				<th class="ApproveRsTh">신청일자</th>
				<th class="ApproveRsTh">승인일자</th>
				<th class="ApproveRsTh">종류</th>
				<th class="ApproveRsTh">상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="dto" items="${list }">
				<tr class="select-row">
					<!-- script에 필요한 정보 -->
					<td hidden="true" class="isapprove">${dto.isapprove }</td>
					<td hidden="true" class="type">${dto.type }</td>
					<td hidden="true" class="department">${dto.w_department }</td>
					<td hidden="true" class="receiver">${dto.employee_name }</td>
					<td hidden="true" class="writer_name">${login_user.employee_name }</td>
					<td hidden="true" class="writer_job">${login_user.job_name }</td>
					<td hidden="true" class="writer_department">${login_user.department }</td>
					<td hidden="true" class="job_name">${dto.job_name }</td>
					<td hidden="true" class="start_date">${dto.start_date }</td>
					<td hidden="true" class="end_date">${dto.end_date }</td>
					<td hidden="true" class="approval_content">${dto.approval_content }</td>
					
					<!-- table 정보 -->
					<td class="ApproveRsTd">${dto.approval_title}</td>
					<td class="ApproveRsTd">${dto.employee_name} ${dto.job_name}(${dto.w_department})</td>
					<td class="ApproveRsTd">${dto.write_date}</td>
					<td class="ApproveRsTd">${dto.approval_date}</td>
					<c:choose>
						<c:when test="${dto.type=='p'}"><td class="ApproveRsTd">결제</td></c:when>
						<c:when test="${dto.type=='b'}"><td class="ApproveRsTd">업무</td></c:when>
						<c:when test="${dto.type=='v'}"><td class="ApproveRsTd">연차</td></c:when>
					</c:choose>
					<c:choose>
					<c:when test="${dto.isapprove==1}"><td class="ApproveRsTd">대기</td></c:when>
					<c:when test="${dto.isapprove==2}"><td class="ApproveRsTd">1차 승인</td></c:when>
					<c:when test="${dto.isapprove==0}"><td class="ApproveRsTd">거절</td></c:when>
					<c:when test="${dto.isapprove==3}"><td class="ApproveRsTd">거절</td></c:when>
					<c:when test="${dto.isapprove==4}"><td class="ApproveRsTd">최종 승인</td></c:when>
				</c:choose>
				</tr>
			</c:forEach>
		</tbody>
		</table>
	</div>
</div>

<div id="ApprovalReModal" class="hidden">
	<div id="ApprovalRsOverlay"></div>
	<div id="ApprovalRsResult"></div>
</div>

<script>
	const AppReSelectRows = document.querySelectorAll('.select-row')
	
	AppReSelectRows.forEach(row => {
		row.addEventListener('click', AppReQselectHandler)
	})
	
	function AppReQselectHandler(event) {
		document.getElementById('ApprovalReModal').classList.remove('hidden')
		
		const isapprove = event.currentTarget.querySelector('.isapprove').innerText
		const type = event.currentTarget.querySelector('.type').innerText
		const writer_department = event.currentTarget.querySelector('.writer_department').innerText
		const writer_name = event.currentTarget.querySelector('.writer_name').innerText
		const writer_job = event.currentTarget.querySelector('.writer_job').innerText
		const start_date = event.currentTarget.querySelector('.start_date').innerText
		const end_date = event.currentTarget.querySelector('.end_date').innerText
		const approval_content = event.currentTarget.querySelector('.approval_content').innerHTML
		
		
	
		
		let documentTag = ``
		documentTag += '<div id="document_root">'
		documentTag += '<div class="ApprovalRs_top">'
		documentTag += '	<div class="ApprovalRs_Name">'
		if(type == 'p') {
			documentTag += '	결제 신청서'
		}
		if(type == 'v') {
			documentTag += '	휴가/연(반)차 신청서'
		}
		if(type == 'b') {
			documentTag += '	업무 신청서'
		}
		documentTag +=	'	</div>'
		documentTag += 	'<div class="resultImg">'
		if(isapprove == 1) {
			documentTag +="<img src=${cpath}/resources/approval/결재안.png>"
		}
		else if(isapprove == 0) {
			documentTag +="<img src=${cpath}/resources/approval/0.png>"	
		}
		else if(isapprove == 2) {
			documentTag +="<img src=${cpath}/resources/approval/1.png>"	
		}		
		else if(isapprove == 3) {
			documentTag += "<img src=${cpath}/resources/approval/2.png>"
		}
		else if(isapprove == 4) {
			documentTag += "<img src=${cpath}/resources/approval/3.png>"
		}
		documentTag +=	'	</div>'
		documentTag +=	'</div>'
		documentTag +=	'	<table id="ApprovalRsModalTable">'
		documentTag +=	'		<tr>'
		documentTag +=	'			<td>소 속</td>'	
		documentTag +=	'			<td class="ApprovalRs_value">'+writer_department+'</td>'	
		documentTag +=	'		</tr>' 
		documentTag +=	'		<tr>'
		documentTag +=	'			<td>성 명</td>'	
		documentTag +=	'			<td class="ApprovalRs_value">'+writer_name+'</td>'	
		documentTag +=	'		</tr>' 
		documentTag +=	'		<tr>'
		documentTag +=	'			<td>직 위</td>'	
		documentTag +=	'			<td class="ApprovalRs_value">'+writer_job+'</td>'	
		documentTag +=	'		</tr>' 
		documentTag +=	'		<tr>'
		documentTag +=	'			<td>기간</td>'	
		documentTag +=	'			<td class="ApprovalRs_value">'+start_date+" ~ "+end_date+'</td>'	
		documentTag +=	'		</tr>' 
		documentTag +=	'		<tr class="ApprovalRs_sa">'
		documentTag +=	'			<td>사 유</td>'	
		documentTag +=	'			<td class="ApprovalRs_value"><div class="sauuDiv">'+approval_content+'</div></td>'	
		documentTag +=	'		</tr>' 
		documentTag +=	'	</table>'
		documentTag +=	'</div>'
		documentTag +=	'</div>'
		
		document.getElementById('ApprovalRsResult').innerHTML = documentTag
	}
	function ApprovalRsCloseModal() {
		const modal = document.getElementById('ApprovalReModal')
		modal.classList.add('hidden')
	}
	document.getElementById('ApprovalRsOverlay').onclick = ApprovalRsCloseModal
</script>

</body>
</html>