'use strict';



function formatDate(timestamp) {
    const date = new Date(timestamp);
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    return `${year}-${month}-${day}`;
}

function approvalLogDownloadFile() {
	const idx = event.target.parentNode.parentNode.querySelector('.idx').innerText
	const url = cpath + '/approvalLog/' + idx
	console.log(url)
	fetch(url)
	.then(resp => resp.json())
	.then(json => {
		const fileURL = cpath + '/approvalUpload/' + `${json.approval_filepath}`
		console.log(fileURL)
		const fileName = `${json.approval_filepath}`
	    const a = document.createElement('a');
	    a.href = fileURL;
	    a.download = fileName;
	    a.click();
	})
}

function openModalApprovalLog(event) {
	const modal = document.getElementById('modal-approvallog')
	const idx = event.target.parentNode.querySelector('.idx').innerText
	const url = cpath + '/approvalLog/' + idx
	fetch(url)
	.then(resp => resp.json())
	.then(json => {
		const fmtStartDate = formatDate(json.start_date)
		const fmtEndDate = formatDate(json.end_date)
		const fmtWriteDate = formatDate(json.write_date)
		const fmtApprovalDate = formatDate(json.approval_date)
		let tag = ''
		tag += ``
		tag += `<div class="approvallogmodal-item title">`
		tag += `	<div class="type">`
		tag += `		${json.type == 'p' ? '결제 신청서' : ''}`
		tag += `		${json.type == 'v' ? '업무 신청서' : ''}`
		tag += `		${json.type == 'b' ? '휴가 신청서' : ''}`
		tag += `	</div>`
		tag += `	<div class="isapprove">`
		tag += `		${json.isapprove == 0 ? `<img src="${cpath}/resources/approval/0.png">` : ''}`
		tag += `		${json.isapprove == 1 ? `<img src="${cpath}/resources/approval/결재안.png">` : ''}`
		tag += `		${json.isapprove == 2 ? `<img src="${cpath}/resources/approval/1.png">` : ''}`
		tag += `		${json.isapprove == 3 ? `<img src="${cpath}/resources/approval/2.png">` : ''}`
		tag += `		${json.isapprove == 4 ? `<img src="${cpath}/resources/approval/3.png">` : ''}`
		tag += `	</div>`
		tag += `</div>`
		tag += `<div class="approvallogmodal-item detail">`
		tag += `	<div class="employee_name">${json.employee_name }</div>`
		tag += `	<div class="job_name">${json.job_name }</div>`
		tag += `	<div class="receiver">${json.receiver }</div>`
		tag += `	<div class="period">${fmtStartDate } ~ ${fmtEndDate }</div>`
		tag += `	<div class="write_date">${fmtWriteDate }</div>`
		tag += `	<div class="approval_date">${fmtApprovalDate == '1970-01-01' ? '-' : fmtApprovalDate }</div>`
        tag += `	<div class="isapprove">`
        tag += `		${json.isapprove == 0 ? '<div style="color: red;">결재 거절</div>' : ''}`
        tag += `		${json.isapprove == 1 ? '<div>대기</div>' : ''}`
        tag += `		${json.isapprove == 2 ? '<div>1차 승인</div>' : ''}`
        tag += `		${json.isapprove == 3 ? '<div style="color: #DBA901;">2차 거절</div>' : ''}`
        tag += `		${json.isapprove == 4 ? '<div style="color: blue;">최종 승인</div>' : ''}`
        tag += `	</div>`
    	tag += `	<div class="type">`
    	tag += `		${json.type == 'p' ? '<div>결제</div>' : ''}`
		tag += `		${json.type == 'b' ? '<div>업무</div>' : ''}`
		tag += `		${json.type == 'v' ? '<div>휴가</div>' : ''}`
		tag += `	</div>`
		tag += `	<div class="">${json.approval_title}</div>`
		tag += `	<div class="">${json.approval_content}</div>`
		tag += `	<div class="">${json.approval_filepath}</div>`
		tag += `	<div class="iframe">`
		tag += `		<iframe src="${cpath}/resources/pdf/sample.pdf" style="width:550px; height:400px;"></iframe>`
		tag += `	</div>`
		tag += `</div>`
		const content = document.getElementById('modal-content-approvallog')
		content.innerHTML = tag
	})
	
	modal.classList.remove('hidden')
}

function closeModalApprovalLog() {
	const modal = document.getElementById('modal-approvallog')
	const content = document.getElementById('modal-content-approvallog')
	content.innerHTML = ''
	modal.classList.add('hidden')
}

function loadHandlerApprovalLog() {
	const root = document.getElementById('approvallog')	
	const url = cpath + '/approvalLog'
	fetch(url)
	.then(resp => resp.json())
	.then(json => {
		let tag = ''
			tag += `	<div class="approvallog_list">`
			tag += `		<div class="top left"><h1>결재 승인 목록</h1></div>`
			tag += `	</div>`
			tag += `	<div class="approvallog_title">`
			tag += `		<div class="idx">순번</div>`
			tag += `		<div class="writer">작성자</div>`
			tag += `		<div>1차 결재자</div>`
			tag += `		<div>최종 결재자</div>`
			tag += `		<div class="period">기간</div>`
			tag += `		<div>수신일</div>`
			tag += `		<div>결재일</div>`
			tag += `		<div>결재</div>`
			tag += `		<div>TYPE</div>`
			tag += `		<div>파일</div>`
			tag += `	</div>`
		json.forEach(dto => {
			const fmtStartDate = formatDate(dto.start_date)
			const fmtEndDate = formatDate(dto.end_date)
			const fmtWriteDate = formatDate(dto.write_date)
			const fmtApprovalDate = formatDate(dto.approval_date)
			tag += `	<div class="approvallog_detail">`
			tag += `		<div class="idx">${dto.approval_idx }</div>`
			tag += `		<div class="writer">${dto.employee_name} ${dto.job_name }(${dto.department})</div>`
			tag += `		<div class="receiver">${dto.receiver }</div>`
			tag += `		<div class="final_receiver">${dto.final_receiver }</div>`
			tag += `		<div class="period">${fmtStartDate } ~ ${fmtEndDate }</div>`
			tag += `		<div class="write_date">${fmtWriteDate }</div>`
			tag += `		<div class="approval_date">${fmtApprovalDate == '1970-01-01' ? '-' : fmtApprovalDate }</div>`
            tag += `		<div class="isapprove">`
            tag += `			${dto.isapprove == 0 ? '<div style="color: red;">결재 거절</div>' : ''}`
            tag += `			${dto.isapprove == 1 ? '<div>대기</div>' : ''}`
            tag += `			${dto.isapprove == 2 ? '<div>1차 승인</div>' : ''}`
            tag += `			${dto.isapprove == 3 ? '<div style="color: #DBA901;">2차 거절</div>' : ''}`
            tag += `			${dto.isapprove == 4 ? '<div style="color: blue;">최종 승인</div>' : ''}`
            tag += `		</div>`
        	tag += `		<div class="type">`
        	tag += `			${dto.type == 'p' ? '<div>결제</div>' : ''}`
    		tag += `			${dto.type == 'b' ? '<div>업무</div>' : ''}`
			tag += `			${dto.type == 'v' ? '<div>휴가</div>' : ''}`
    		tag += `		</div>`
			tag += `		<div class="${dto.approval_filepath == null ? '' : 'approvallog_view'}"><span class="download">${dto.approval_filepath == null ? '' : '다운로드'}</span></div>`
			tag += `	</div>`
			console.log(fmtApprovalDate)
		})
		tag += `</div>`
		root.innerHTML = ''
		root.innerHTML += tag
		
		const viewList = document.querySelectorAll('.approvallog_detail > .approvallog_view > .download')
//		viewList.forEach(view => view.onclick = openModalApprovalLog)
		viewList.forEach(view => view.onclick = approvalLogDownloadFile)
	})
}

function contactListHandler() {
	const contactlist = document.getElementById('contactlist')
	const url = cpath + '/contactList'
	fetch(url)
	.then(resp => resp.json())
	.then(json => {
		let tag = ''
			tag += `<div class="contactlist_wrap_top">`
			tag += `	<div class="contactlist_list">`
			tag += `		<h1>주소록</h1>`
			tag += `	</div>`
			tag += `	<div class="contactlist_category">`
			tag += `		<div>`
			tag += `			<select name="department" id="departmentSelect">`
			tag += `			<option value="">부서 전체</option>`
		json.departmentList.forEach(dto => {
			tag += `				<option value="${dto.department_name}">${dto.department_name}</option>`
		})
			tag += `			</select>`
			tag += `		</div>`
			tag += `	</div>`
			tag += `	<div class="contactlist_title">`
			tag += `		<div class="idx">사원 번호</div>`
			tag += `		<div class="img">프로필</div>`
			tag += `		<div>성명</div>`
			tag += `		<div>부서</div>`
			tag += `		<div>직위</div>`
			tag += `		<div>휴대전화</div>`
			tag += `		<div>Mail</div>`
			tag += `	</div>`
			tag += `</div>`
			tag += `<div class="contactlist_wrap_bottom">`
		json.contactList.forEach(dto => {
			tag += `	<div class="contactlist_detail" data-department="${dto.department}">`
			tag += `		<div class="idx">${dto.employee_idx }</div>`
			tag += `		<div class="img"><img src="${cpath }/profileupload/${dto.profile_fic }"></div>`
			tag += `		<div>${dto.employee_name }</div>`
			tag += `		<div>${dto.department }</div>`
			tag += `		<div>${dto.job_name }</div>`
			tag += `		<div>${dto.phone_number }</div>`
			tag += `		<div>${dto.mail }</div>`
			tag += `	</div>`
		})
		tag += `</div>`
		tag += `</div>`
		tag += `</div>`
		contactlist.innerHTML = ''
		contactlist.innerHTML += tag
		
		const departmentSelect = document.getElementById('departmentSelect')
		departmentSelect.addEventListener('change', function() {
			const selectedDepartment = departmentSelect.value
			filterByDepartment(selectedDepartment)
		})
		
		filterByDepartment('')
	})
	
	function filterByDepartment(department) {
		const contactDetails = document.querySelectorAll('.contactlist_detail')
		contactDetails.forEach(detail => {
			const detailDepartment = detail.getAttribute('data-department')
			if(department === '' || department === detailDepartment) {
				detail.style.display = ''
			} else {
				detail.style.display = 'none'
			}
		})
	}
}

function closeModalMypage() {
	const modal = document.getElementById('modal-userProfile_Img')
	const content = document.getElementById('modal-content-mypage')
	content.innerHTML = ''
	modal.classList.add('hidden')
}

function openModalUserProfile(event) {
	const modal = document.getElementById('modal-userProfile_Img')
	const employee_idx = document.querySelector('input[name="employee_idx"]').value
	const url = cpath + '/userMypage/' + employee_idx
	fetch(url)
	.then(resp => resp.json())
	.then(json => {
		const fmtStartDate = formatDate(json.start_date)
		const fmtEndDate = formatDate(json.end_date)
		const fmtWriteDate = formatDate(json.write_date)
		const fmtApprovalDate = formatDate(json.approval_date)
		let tag = ''
		tag += ``
		tag += `<form method="POST" id="updateProfileImgForm" enctype="multipart/form-data" action="${cpath}/updateProfileImg">`
		tag += `<div class="item">`
		tag += `	<div class="mypagemodal_item title">`
		tag += `		<img src="${cpath}/profileupload/${json.profile_fic}">`
		tag += `	</div>`
		tag += `	<div class="mypagemodal_item content">`
		tag += `		<input class="detail" type="number" name="employee_idx" value="${json.employee_idx}" style="display: none;">`
		tag += `		<label for="input_file">프로필 사진 추가</label>`
		tag += `		<input type="file" name="upload_profileImg" id="input_file" style="display: none;" accept="image/*">`
		tag += `	</div>`
		tag += `	<div>`
		tag += `	</div>`
		tag += `	<input class="mypagemodal_item submit" type="submit" value="확인">`
		tag += `</div>`	
		tag += `</form>`
		const content = document.getElementById('modal-content-mypage')
		content.innerHTML = tag
	})
	modal.classList.remove('hidden')
}

function userProfileHandler() {
	function profileUpdateCheck() {
		alert('변경 사항이 저장되었습니다')
	}
	const root = document.getElementById('mypage_userProfile')
	const idx = event.target.querySelector('.login_employee_idx').innerText
	console.log(idx)
	const url = cpath + '/userMypage/' + idx
	fetch(url)
	.then(resp => resp.json())
	.then(json => {
		const fmtHireDate = formatDate(json.hire_date)
		const fmtBirthDate = formatDate(json.birth_date)
		let tag = ''
			tag += `<div id="memberupdate">`
			tag += `	<div class="memberupdate_Top">`
			tag += `		<div class="mbr_update topLeft"><h1>내 프로필</h1></div>`
			tag += `		<div class="mbr_update topCenter"><h1>정보 수정</h1></div>`
			tag += `		<div class="mbr_update topRight"><h1>사원 정보</h1></div>`
			tag += `	</div>`
			tag += `	<div class="memberupdate_wrap">`
			tag += `		<div class="memberupdate_image">`
			tag += `			<div class="mbr_update_Img">`
			tag += `				<div class="mbr_update_Img_content">`
			tag += `					<img class="detail_Img" src="${cpath}/profileupload/${json.profile_fic}" width="200" height="200">`
			tag += `				</div>`
			tag += `				<div class="mbr_update_Img_content">`
			tag += `					<a id="add_A_Photo">프로필 사진 변경</a>`
			tag += `				</div>`
			tag += `			</div>`			
			tag += `		</div>`
			tag += `		<div class="mbrupdate_content">`
			tag += `			<div class="mbrupdate_form mbrupdate_title">`
			tag += `				<div class="mbrupdate_item">ID</div>`
			tag += `				<div class="mbrupdate_item">Password</div>`
			tag += `				<div class="mbrupdate_item">사내 메일</div>`
			tag += `				<div class="mbrupdate_item">복구 이메일</div>`
			tag += `				<div class="mbrupdate_item">휴대전화</div>`
			tag += `				<div class="mbrupdate_item">생년월일</div>`
			tag += `			</div>`
			tag += `			<form class="mbrupdate_form mbrupdate_detail" method="POST" action="${cpath}/updateMypage">`
			tag += `				<div class="mbrupdate_item" style="display: none;"><input class="mbrupdate_input" type="number" name="employee_idx" value="${json.employee_idx}" readonly></div>`
			tag += `				<div class="mbrupdate_item"><input class="mbrupdate_input" type="text" name="employee_userid" placeholder="ID" value="${json.employee_userid }" readonly></div>`
			tag += `				<div class="mbrupdate_item" style="padding: 18px 0; padding-bottom: 22px;"><a class="mbrupdate_a" href="${cpath}/password_update">비밀번호 재설정</a></div>`
			tag += `				<div class="mbrupdate_item"><input class="mbrupdate_input" type="text" name="mail" placeholder="사내 메일" value="${json.mail }" readonly></div>`
			tag += `				<div class="mbrupdate_item">`
			tag += `					<input class="mbrupdate_input" type="email" name="recovery_email" placeholder="이메일 입력" value="${json.recovery_email == null ? '' : json.recovery_email}">`
			tag += `				</div>`
			tag += `				<div class="mbrupdate_item"><input class="mbrupdate_input" type="text" name="phone_number" placeholder="휴대전화" value="${json.phone_number }" required></div>`
			tag += `				<div class="mbrupdate_item"><input class="mbrupdate_input" type="date" name="birth_date" placeholder="생년월일" value="${fmtBirthDate }" required></div>`
			tag += `				<div class="mbrupdate_item"><input id="mypageForm" class="mbrupdate_input mbrupdate_submit" type="submit" value="저장"></div>`
			tag += `			</form>`
			tag += `		</div>`
			tag += `		<div class="mbrupdate_content">`
			tag += `			<div class="mbrupdate_form mbrupdate_title">`
			tag += `				<div class="mbrupdate_item">사원 번호</div>`
			tag += `				<div class="mbrupdate_item">입사일</div>`
			tag += `				<div class="mbrupdate_item">사원이름</div>`
			tag += `				<div class="mbrupdate_item">부서</div>`
			tag += `				<div class="mbrupdate_item">직위</div>`
			tag += `			</div>`
			tag += `			<div class="mbrupdate_form mbrupdate_detail">`
			tag += `				<div class="mbrupdate_item"><input class="mbrupdate_input" type="number" name="employee_idx" value="${json.employee_idx}" readonly></div>`
			tag += `				<div class="mbrupdate_item"><input class="mbrupdate_input" type="date" name="hire_date" placeholder="입사일" value="${fmtHireDate }" readonly></div>`
			tag += `				<div class="mbrupdate_item"><input class="mbrupdate_input" type="text" name="employee_name" placeholder="사원이름" value="${json.employee_name }" readonly></div>`
			tag += `				<div class="mbrupdate_item">`
			tag += `					<input class="mbrupdate_input" name="department" value="${json.department }" readonly>`
			tag += `				</div>`
			tag += `				<div class="mbrupdate_item">`
			tag += `					<input class="mbrupdate_input" name="job_name" value="${json.job_name }" readonly>`
			tag += `				</div>`
			tag += `			</div>`
			tag += `		</div>`
			tag += `	</div>`
			tag += `</div>`
			root.innerHTML = ''
			root.innerHTML += tag
			const detail_Img = document.querySelector('.detail_Img')
			const addAPhoto = document.getElementById('add_A_Photo')
			detail_Img.onclick = openModalUserProfile
			addAPhoto.onclick = openModalUserProfile
			const mypageForm = document.getElementById('mypageForm')
			mypageForm.onclick = profileUpdateCheck
	})
}

function pwUpdateHandler() {
	function updatePwCheck() {
		alert('비밀번호가 정상적으로 변경되었습니다')
	}
	function dupPwCheckHandler() {
		const dupPwCheckBtn = document.getElementById('dupPwCheckBtn')
		const pwInput = document.querySelector('.pwInput').value
		const pwReInput = document.querySelector('.pwReInput').value
		const dupPwMessage = document.getElementById('dupPwMessage')
		const pwUpSubmitBtn = document.querySelector('.pwUp_Item_submitBtn')
		
		if(pwInput == '') {
			dupPwMessage.innerText = '먼저 사용할 비밀번호를 입력해주세요'
				dupPwMessage.style.color = 'red'
			pwInput.focus()
			return
		}
		if(pwInput != '' && pwReInput == '') {
			dupPwMessage.innerText = '비밀번호 재확인 필요'
			dupPwMessage.style.color = 'blue'
			pwReInput.focus()
			return
		}
		if(pwInput == pwReInput) {
			dupPwMessage.innerText = ''
			dupPwMessage.style.color = 'green'
			pwUpSubmitBtn.disabled = false
		}
		else if(pwInput != pwReInput) {
			dupPwMessage.innerText = '비밀번호가 일치하지 않습니다'
			dupPwMessage.style.color = 'red'
			pwReInput.select()
		}
	}
	const root = document.getElementById('pwUpUser')
	const employee_idx = document.querySelector('.login_employee_idx').innerText
	console.log(employee_idx)
	const url = cpath + '/userPwUpdate/' + employee_idx
	fetch(url)
	.then(resp => resp.text())
	.then(text => {
		let tag = ''
			tag += `<div class="pwUp_Top">비밀번호 변경</div>`
			tag += `<div class="pwUp_Bottom">`
			tag += `	<form id="pwUp_Form" method="POST">`
			tag += `		<div class="pwUp_UserForm">`
			tag += `			<div class="pwUp_Item pwUp_Item_Top">`
			tag += `				<div class="pwUp_Title">비밀번호</div>`
			tag += `				<div class="pwUp_Content_Top">`
			tag += `					<input type="text" name="employee_idx" value="` + employee_idx + `" style="display: none;" readonly>`
			tag += `					<input class="pwInput" type="password" name="employee_userpw" placeholder="변경할 비밀번호" value="" autofocus required>`
			tag += `				</div>`
			tag += `			</div>`
			tag += `			<div class="pwUp_Item pwUp_Item_Bottom">`
			tag += `				<div class="pwUp_Title">비밀번호 재확인</div>`
			tag += `				<div class="pwUp_Content_Bottom">`
			tag += `					<div>`
			tag += `						<input class="pwReInput" type="password" placeholder="비밀번호 재확인" autofocus required>`
			tag += `						<div>`
			tag += `							<input id="dupPwCheckBtn" type="button" value="비밀번호 확인">`
			tag += `						</div>`
			tag += `					</div>`
			tag += `					<div class="form dupMessage">`
			tag += `						<span class="title" id="dupPwMessage"></span>`
			tag += `					</div>`
			tag += `				</div>`
			tag += `			</div>`
			tag += `			<div class="pwUp_Item_submit">`
			tag += `				<input class="pwUp_Item_submitBtn" type="submit" value="저장" disabled="disabled">`
			tag += `			</div>`
			tag += `		</div>`
			tag += `	</form>`
			tag += `</div>`
			root.innerHTML = tag
			dupPwCheckBtn.addEventListener('click', dupPwCheckHandler)
			const pwUp_Item_submitBtn = document.querySelector('.pwUp_Item_submitBtn')
			pwUp_Item_submitBtn.addEventListener('click', updatePwCheck)
	})
}

async function homeAppList() {
	  const url = cpath + '/homeApproval';
	  const result = await fetch(url).then(resp => resp.json());
	  console.log('result: ',  result);
	  
	  const approveBox = document.getElementById('approveBox');
	  
	  let app = '';
	  app += `<table id="homeAppList">`;
	  app += `  <thead>`;  
	  app += `    <tr>`;
	  app += `      <th>제목</th>`;
	  app += `      <th>승인자</th>`;
	  app += `      <th>신청일자</th>`;
	  app += `      <th>승인일자</th>`;
	  app += `      <th>종류</th>`;
	  app += `      <th>상태</th>`;
	  app += `    </tr>`;
	  app += `  </thead>`;
	  app += `  <tbody>`;
	  
	  result.forEach(ob => {
	    let type = '';
	    let isapp = '';
	    if (ob.type == 'p') {
	      type = '결제';
	    }
	    else if (ob.type == 'b') {
	      type = '업무';
	    }
	    else if (ob.type == 'v') {
	      type = '연차';
	    }
	    
	    if (ob.isapprove == 1) {
	      isapp = '대기';
	    }
	    else if (ob.isapprove == 2) {
	      isapp = '1차 승인';
	    }
	    else if (ob.isapprove == 3 || ob.isapprove == 0) {
	      isapp = '거절';
	    }
	    else if (ob.isapprove == 4) {
	      isapp = '최종 승인';
	    }
	   if (ob.approval_date == null) {
		   ob.approval_date = '-'
	   }
	   app += `    <tr>`;
	   app += `      <td>${ob.approval_title}</td>`;
	   app += `      <td>${ob.employee_name} ${ob.job_name}(${ob.department})</td>`;
	   app += `      <td>${ob.write_date}</td>`;
	   app += `      <td>${ob.approval_date}</td>`;
	   app += `      <td>${type}</td>`;
	   app += `      <td>${isapp}</td>`;
	   app += `    </tr>`;
	 });
	  
	 app += `  </tbody>`;
	 app += `</table>`;
	  
	 approveBox.innerHTML = app;
}

async function waitAppList() {
	const url = cpath + '/waitAppList';
	const result = await fetch(url).then(resp => resp.json());
	console.log(result)
	
	const waitAppBox = document.getElementById('waitAppBox')
	
	let app = '';
	  app += `<table id="homeAppList">`;
	  app += `  <thead>`;  
	  app += `    <tr>`;
	  app += `      <th>제목</th>`;
	  app += `      <th>승인자</th>`;
	  app += `      <th>신청일자</th>`;
	  app += `      <th>승인일자</th>`;
	  app += `      <th>종류</th>`;
	  app += `      <th>상태</th>`;
	  app += `    </tr>`;
	  app += `  </thead>`;
	  app += `  <tbody>`;
	  
	  result.forEach(ob => {
	    let type = '';
	    let isapp = '';
	    if (ob.type == 'p') {
	      type = '결제';
	    }
	    else if (ob.type == 'b') {
	      type = '업무';
	    }
	    else if (ob.type == 'v') {
	      type = '연차';
	    }
	    
	    if (ob.isapprove == 1) {
	      isapp = '대기';
	    }
	    else if (ob.isapprove == 2) {
	      isapp = '1차 승인';
	    }
	    else if (ob.isapprove == 3 || ob.isapprove == 0) {
	      isapp = '거절';
	    }
	    else if (ob.isapprove == 4) {
	      isapp = '최종 승인';
	    }
	   if (ob.approval_date == null) {
		   ob.approval_date = '-'
	   }
	   app += `    <tr>`;
	   app += `      <td>${ob.approval_title}</td>`;
	   app += `      <td>${ob.employee_name} ${ob.job_name}(${ob.department})</td>`;
	   app += `      <td>${ob.write_date}</td>`;
	   app += `      <td>${ob.approval_date}</td>`;
	   app += `      <td>${type}</td>`;
	   app += `      <td>${isapp}</td>`;
	   app += `    </tr>`;
	 });
	  
	 app += `  </tbody>`;
	 app += `</table>`;
	  
	 waitAppBox.innerHTML = app;
}


async function boardLoad() {
	await fetch(cpath + '/notice').then(resp => resp.json()).then(json => {
		let bd_notice = '';
		
		bd_notice += `	<div id="noticeBTop">`;
		bd_notice += `		<div class="NbTOne">공지사항</div>`;
		bd_notice += `		<div class="NbTTwo"><a href="${cpath}/board/notice/list">더보기</a></div>`;
		bd_notice += `	</div>`;
		bd_notice += `	<table id="noticeBTable">`;
		bd_notice += `		<thead>`;
		bd_notice += `			<tr>`;
		bd_notice += `				<th>No</th>`;
		bd_notice += `				<th>제목</th>`;
		bd_notice += `				<th>작성자</th>`;
		bd_notice += `				<th>작성일</th>`;
		bd_notice += `			</tr>`;
		bd_notice += `		</thead>`;
		bd_notice += `		<tbody>`;
		json.forEach(dto => {
			bd_notice += `		<tr>`
			bd_notice += `			<td>${dto.board_idx}</td>`;	
			bd_notice += `			<td>${dto.board_title}</td>`;
			bd_notice += `			<td>${dto.employee_name}</td>`;	
			bd_notice += `			<td>${dto.write_date}</td>`;	
			bd_notice += `		</tr>`; 		
		})
		bd_notice += `		</tbody>`;
		bd_notice += `	</table>`;
		
		document.getElementById('noticeBox').innerHTML = bd_notice;
	})
	
	await fetch(cpath + '/suggestion').then(resp => resp.json()).then(json => {
		let bd_suggestion = '';
		
		bd_suggestion += `	<div id="suggestionBTop">`;
		bd_suggestion += `		<div class="NbTOne">건의사항</div>`;
		bd_suggestion += `		<div class="NbTTwo"><a href="${cpath}/board/suggestion/list">더보기</a></div>`;
		bd_suggestion += `	</div>`;
		bd_suggestion += `	<table id="suggestionBTable">`;
		bd_suggestion += `		<thead>`;
		bd_suggestion += `			<tr>`;
		bd_suggestion += `				<th>No</th>`;
		bd_suggestion += `				<th>제목</th>`;
		bd_suggestion += `				<th>작성자</th>`;
		bd_suggestion += `				<th>작성일</th>`;
		bd_suggestion += `			</tr>`;
		bd_suggestion += `		</thead>`;
		bd_suggestion += `		<tbody>`;
		
		json.forEach(dto => {
			bd_suggestion += `		<tr>`
			bd_suggestion += `			<td>${dto.board_idx}</td>`;	
			bd_suggestion += `			<td>${dto.board_title}</td>`;
			bd_suggestion += `			<td>${dto.employee_name}</td>`;	
			bd_suggestion += `			<td>${dto.write_date}</td>`;	
			bd_suggestion += `		</tr>`; 		
		})
		bd_suggestion += `		</tbody>`;
		bd_suggestion += `	</table>`;
		
		document.getElementById('suggestionBox').innerHTML = bd_suggestion;
	})
	
	await fetch(cpath + '/event').then(resp => resp.json()).then(json => {
		let bd_event = '';
		
		bd_event += `<div id="eventBTop">`;
		bd_event += `	<div class="NbTOne">경조사</div>`;
		bd_event += `	<div class="NbTTwo"><a href="${cpath}/board/suggestion/list">더보기</a></div>`;
		bd_event += `</div>`;
		bd_event += `<table id="eventBTable">`;
		bd_event += `	<thead>`;
		bd_event += `		<tr>`;
		bd_event += `			<th>No</th>`;
		bd_event += `			<th>제목</th>`;
		bd_event += `			<th>작성자</th>`;
		bd_event += `			<th>작성일</th>`;
		bd_event += `		</tr>`;
		bd_event += `	</thead>`;
		bd_event += `	<tbody>`;
		
		json.forEach(dto => {
				bd_event += `		<tr>`
				bd_event += `			<td>${dto.board_idx}</td>`;	
				bd_event += `			<td>${dto.board_title}</td>`;
				bd_event += `			<td>${dto.employee_name}</td>`;	
				bd_event += `			<td>${dto.write_date}</td>`;	
				bd_event += `		</tr>`; 		
			})
			bd_event += `		</tbody>`;
			bd_event += `	</table>`;
			bd_event += `</div>`;
			
			document.getElementById('eventBox').innerHTML = bd_event;
	})
}





