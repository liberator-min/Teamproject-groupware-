<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
	#memberinsert {
		position: absolute;
		top: 18%;
		left: 3%;
	}
	#memberinsert > .insert {
		position: absolute;
		top: -20%;
		left: 11%;
		font-size: 25px;
	}
	#memberinsert > .content {
	}
	#memberinsert > .content > form > .form {
		margin: 20px 0;
	}
	#memberinsert > .content > form > .form > .title {
		margin: auto;
		flex: 1;
		margin-left: 520px;
	}
	#memberinsert > .content > form > .form > .detail {
/*  		border: 1px solid gold; */
		margin: auto;
		flex: 1;
		padding-right: 520px;
	}
	#memberinsert > .content > form > .id > .detail {
		padding-right: 453px;
	}
	#memberinsert > .content > form > .form > .detail > input, select {
		width: 260px;
		height: 40px;
		margin: 0.7%;
		margin-bottom: 1.2%;
		border-radius: 4px;
		border: 2px solid #C1BFCD;
	}
	#memberinsert > .content > form > .form > .detail > select {
		width: 265px;
		height: 45px;
	}
	#memberinsert > .content > form > .form > .detail > .submit {
		width: 265px;
		height: 40px;
		margin: 0.7%;
		color: white;
		font-size: 15px;
		margin-bottom: 1.2%;
		border-radius: 50px;
		border: 1px solid #3E64FF;
		background-color: #3E64FF;
	}
	#memberinsert > .content > form > .form > .detail > .submit:hover {
		color: #E1E5E8;
		opacity: 90%;
		cursor: pointer;
	}
	#memberinsert > .content > form > .form {
		display: flex;
	}
	#memberinsert > .content > form > .id {
	}
	#memberinsert > .content > form > .id > .detail {
		display: flex;
	}
	#memberinsert > .content > form > .id > .detail > .idinput {
		width: 265px;
	}
	#memberinsert > .content > form > .id > .detail > div {
		margin: auto;
	}
	#memberinsert > .content > form > .dupmessage {
		margin: -0.2%;
		margin-top: -1.5%;
		margin-left: 85px;
	}
</style>
<div id="homeMain">
	<div id="memberinsert">
		<div class="insert"><h1>회원 추가</h1></div>
		<div class="content">
			<form method="POST">
				<div class="form id">
					<div class="title">ID</div>
					<div class="detail">
						<input class="idinput" type="text" name="employee_userid" placeholder="ID" autofocus required>
						<div>
							<input id="dupCheckBtn" type="button" value="중복확인">
						</div>
					</div>
				</div>
				<div class="form dupmessage">
					<span class="title" id="dupMessage"></span>
				</div>
				<div class="form">
					<div class="title">Password</div>
					<div class="detail">
						<input type="password" name="employee_userpw" placeholder="Password" required>
					</div>
				</div>
				<div class="form">
					<div class="title">성명</div>
					<div class="detail">
						<input type="text" name="employee_name" placeholder="성명" required>
					</div>
				</div>
				
				<div class="form">
					<div class="title">휴대전화</div>
					<div class="detail">
						<input type="text" name="phone_number" placeholder="휴대전화" required>
					</div>
				</div>
				<div class="form">
					<div class="title">생년월일</div>
					<div class="detail">
						<input type="date" name="birth_date" placeholder="생년월일" required>
					</div>
				</div>
				<div class="form">
					<div class="title">부서</div>
					<div class="detail">
						<select name="department">
						<option value="">부서 선택</option>
						<c:forEach var="dto" items="${departmentList }">
							<option value="${dto.department_name }">${dto.department_name }</option>
						</c:forEach>
						</select>
					</div>
				</div>
				<div class="form">
					<div class="title">직위</div>
					<div class="detail">
						<select name="job_id">
							<option value="" onselect="${dto.job_name }">직위 선택</option>
							<c:forEach var="dto" items="${jobList }">
								<option value="${dto.job_idx }">${dto.job_name }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form">
					<div class="title"></div>
					<div class="detail">
						<input class="submit" id="submit" type="submit">
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script>

	const dupCheckBtn = document.getElementById('dupCheckBtn')
	
	async function dupCheckHandler() {
		const dupMessage = document.getElementById('dupMessage')
		const employee_userid = document.querySelector('input[name="employee_userid"]')
		
		if(employee_userid.value == '') {
			dupMessage.innerText = '먼저 사용할 ID를 입력해주세요'
			employee_userid.focus()
			return
		}
		const url = '${cpath}/dupCheck/' + employee_userid.value
		const count = await fetch(url).then(resp => resp.text())
		
		if(isNaN(count)) {
			alert('처리 도중 문제가 발생했습니다')
			employee_userid.focus()
		}
		else if(count == 0) {
			dupMessage.innerText = '사용 가능한 ID입니다'
			dupMessage.style.color = 'blue'
		}
		else {
			dupMessage.innerText = '이미 사용중인 ID입니다'
			dupMessage.style.color = 'red'
			employee_userid.select()
		}
	}
	dupCheckBtn.addEventListener('click', dupCheckHandler)

</script>

</body>
</html>