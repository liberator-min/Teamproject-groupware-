<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
	#memberupdate {
		position: absolute;
		left: 10%;
		top: 7%;
		margin: 0 1.4%;
	}
	#memberupdate > .update {
		margin-left: 1.45%;
		position: inherit;
		top: -3%;
	}
	#memberupdate > .content {
		display: flex;
		margin-top: 80px;
	}
	#memberupdate > .content > .title {
		margin-top: 24px;
		margin-left: 400px;
		margin-right: 10px;
	}
	#memberupdate > .content > .title > div {
		margin-bottom: 48px;
	}
	#memberupdate > .content > .detail {
		margin-right: auto;
	}
	#memberupdate > .content > form > div > input, select {
		width: 160%;
		height: 3em;
		margin: 6% 0;
		border-radius: 4px;
		border: 2px solid #C1BFCD;
	}
	#memberupdate > .content > form > div > .submit {
		background-color: #B1D1E4
	}
	#memberupdate > .content > form > div > .submit:hover {
		color: #E1E5E8;
		background-color: #8ABAE0;
		border: 2px solid grey;
	}
</style>
<div id="homeMain">
	<div id="memberupdate">
		<div class="update"><h1>회원 정보 수정</h1></div>
		<div class="content">
			<div class="form title">
				<div>고용날짜</div>
				<div>ID</div>
				<div>사원이름</div>
				<div>E-mail</div>
				<div>복구 이메일</div>
				<div>휴대전화</div>
				<div>생년월일</div>
				<div>부서</div>
				<div>직위</div>
			</div>
			<form class="form detail" method="POST">
				<div><input type="date" name="hire_date" placeholder="고용날짜" value="${dto.hire_date }" required></div>
				<div><input type="text" name="employee_userid" placeholder="ID" value="${dto.employee_userid }" required></div>
				<div><input type="text" name="employee_name" placeholder="사원이름" value="${dto.employee_name }" required></div>
				<div><input type="email" name="mail" placeholder="E-mail" value="${dto.mail }" required></div>
				<div><input type="email" name="recovery_email" placeholder="복구 이메일" value="${dto.recovery_email }"></div>
				<div><input type="text" name="phone_number" placeholder="휴대전화" value="${dto.phone_number }" required></div>
				<div><input type="date" name="birth_date" placeholder="생년월일" value="${dto.birth_date }" required></div>
				<div>
					<select name="department" required>
					<option value="">부서 선택</option>
					<c:forEach var="dto" items="${departmentList }">
						<option value="${dto.department_name }">${dto.department_name }</option>
					</c:forEach>
					</select>
				</div>
				<div>
					<select name="job_id" required>
						<option value="">직급 선택</option>
						<c:forEach var="dto" items="${jobList }">
							<option value="${dto.job_idx }">${dto.job_name }</option>
						</c:forEach>
					</select>
				</div>
				<div><input class="submit" id="submit" type="submit" value="수정"></div>
			</form>
		</div>
	</div>
</div>

</body>
</html>