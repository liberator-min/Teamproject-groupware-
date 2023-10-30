<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="approval_side.jsp" %>
<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/approval/apRequest.css">

<div id="approvalRe_form">
	<div class="top">업무 신청서</div>
	<form method="post" id="ApproveReAddForm" enctype="multipart/form-data">
		<input type="text" name="type" value="b" hidden="true">
		<input type="text" name="department" value="${user.department }" hidden="true">
		<input type="text" name="writer" value="${user.employee_userid }" hidden="true">
	<table id="approval_request_table">
		<tr>
			<td class="approvalRe_name">소속 부서장</td>
			<td>
				<select name="receiver" required="required" class="approvalReceiverSelect">
					<option value="">---선택---</option>
					<c:forEach var="bosses" items="${bossesList}">
					<option value="${bosses.employee_userid}">${bosses.employee_name } ${bosses.job_name}(${bosses.department})</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td class="approvalRe_name">제목</td>
			<td><input class="approvalRe_value" type="text" name="approval_title" required="required" autocomplete="off"></td>
		</tr>
		<tr>
			<td class="approvalRe_name">기간</td>
			<td>
				<input class="approvalRe_value" type="date" name="start_date" min="YYYY-mm-01">
					~
				<input class="approvalRe_value" type="date" name="end_date" min="YYYY-mm-01">
			</td>
		</tr>
		<tr>
			<td class="approvalRe_name">파일</td>
			<td><input type="file" name="upload"></td>
		</tr>
		<tr class="approvalRe_sa">
			<td class="approvalRe_name">사유</td>
			<td>
				<textarea class="approvalSa_value" name="approval_content" required="required"></textarea>
			</td>
		</tr>
	</table>
	
	<div id="approvalRe_bottom">
		<div>신청자: ${user.employee_name } ${user.job_name }(${user.department })</div>
		<input type="submit" value="신청">
	</div>
	</form>
</div>

<!-- PDF Content 1 -->
<input name="pdf_writer" value="${user.employee_name }" style="display: none;">
<input name="pdf_writer_job_name" value="${user.job_name }" style="display: none;">
<input name="pdf_writer_department" value="${user.department }" style="display: none;">
<!-- PDF Content 1 End -->

<!-- PDF Content 2 -->
<div id="pdf-hidden"></div>
<div id="pdf-wrap"></div>
<!-- PDF Content 2 End -->

<script>
async function ApproveReAddHandler(event) {
	event.preventDefault()
	const url = cpath + '/approval/business_request'
	const form = document.getElementById('ApproveReAddForm')
	const formData = new FormData(form)
	
	const opt = {
		method: 'POST',
		body: formData,
	}
	
	const result = await fetch(url,opt).then(resp => resp.text())
	
	console.log(result)
	if(result == 1) {
// 		window.location.href = '${cpath}/approval/request_list'
		htmlToPdfBusinessRequest()
	}
	else if(result == 0) {
		alert('데이터 전송에 실패하였습니다.')
		window.history.go(-1)
	}
}

document.getElementById('ApproveReAddForm').onsubmit = ApproveReAddHandler
</script>
<!-- PDF Maker -->
<script>
	function htmlToPdfBusinessRequest() {
		const pdfHidden = document.getElementById('pdf-hidden')
		const createPdf = document.getElementById('addBtn')
		const pdfWrap = document.getElementById('pdf-wrap')
		pdfHidden.style.padding = '700px'
		const approval_title = document.querySelector('input[name="approval_title"]').value
		const start_date = document.querySelector('input[name="start_date"]').value
		const end_date = document.querySelector('input[name="end_date"]').value
		const upload = document.querySelector('input[name="upload"]').value
		const approval_content = document.querySelector('textarea[name="approval_content"]').value
		const writer = document.querySelector('input[name="pdf_writer"]').value
		const writer_job_name = document.querySelector('input[name="pdf_writer_job_name"]').value
		const writer_department = document.querySelector('input[name="pdf_writer_department"]').value
        const receiver = document.querySelector('select[name="receiver"]');
        const selectedReceiver = receiver.options[receiver.selectedIndex].innerText;
        
        let tag = ''
		tag += `<div class="pdf-top">휴가 신청서</div>`
		tag += `<div class="pdf-content">`
		tag += `	<div class="pdf-item">`
		tag += `		<div class="pdf-name">소속 부서장</div>`
		tag += `		<div class="pdf-detail">` + selectedReceiver + `</div>`
		tag += `	</div>`
		tag += `	<div class="pdf-item">`
		tag += `		<div class="pdf-name">제　목</div>`
		tag += `		<div class="pdf-detail">` + approval_title + `</div>`
		tag += `	</div>`
		tag += `	<div class="pdf-item">`
		tag += `		<div class="pdf-name">기　간</div>`
		tag += `		<div class="pdf-detail">`
		tag += 			start_date
		tag += `			~ `
		tag += 			end_date
		tag += `		</div>`
		tag += `	</div>`
		tag += `	<div class="pdf-sa pdf-item">`
		tag += `		<div class="pdf-name">사　유</div>`
		tag += `		<div class="pdf-detail">`
		tag += 			approval_content
		tag += `		</div>`
		tag += `	</div>`
		tag += `</div>`
		tag += `<div id="pdf-bottom">`
		tag += `	<div class="pdf-detail">` + writer + ` ` + writer_job_name + ` ` + `(` + writer_department + `)` + `</div>`
		tag += `</div>`
		pdfWrap.innerHTML = ''
		pdfWrap.innerHTML += tag
		// pdf_wrap을 canvas객체로 변환
		html2canvas(pdfWrap).then(function(canvas) {
			const doc = new jsPDF('p', 'mm', 'a4')
			const imgData = canvas.toDataURL('image/png')
			doc.addImage(imgData, 'PNG', 0, 0)
			doc.save('업무신청서' + '_' + writer_department + '_' + writer + '_' + writer_job_name)
			window.location.href = '${cpath}/approval/request_list'
		})
	}
	
// 	createPdf.addEventListener('click', htmlToPdf)
</script>
<!-- PDF Maker End -->



</body>
</html>