<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	@font-face {
	     font-family: 'Pretendard-Regular';
	     src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	     font-weight: 400;
	     font-style: normal;
	}
    * {
    	font-family: 'Pretendard-Regular';
    }
	#pwReBox {
		margin: 180px auto;
		width: 20vw;
		text-align: center;
	}
	.pwReN {
		font-size: 40px;
		font-weight: bold;
		margin-bottom: 60px;
		display: inline-block;
	}
	.pwReForm {
		padding: 0 15px;
	}
	.pwReForm > form > div {
		text-align: left;
		padding-left: 30px;
		margin-bottom: -9px;
		font-size: 18px;
	}
	.pwReForm > form > p {
		margin-bottom: 50px;
	}
	.pwReForm > form > p > input[type='text'] {
		height: 40px;
		color: #3E64FF;
		border: 1px solid rgb(106, 103, 103, 0.1);
		font-weight: bold;
		border-radius: 10px;
		padding: 5px 8px;
		outline: 1px solid rgb(106, 103, 103, 0.1);
		font-size: 18px;
		width: 270px;
	}
	.pwReForm > form > p > input[type='text']:hover {
		border: 2px solid #3E64FF;
	}
	.pwReForm > form > p > input[type='email'] {
		height: 40px;
		color: #3E64FF;
		border: 1px solid rgb(106, 103, 103, 0.1);
		font-weight: bold;
		border-radius: 10px;
		padding: 5px 8px;
		outline: 1px solid rgb(106, 103, 103, 0.1);
		font-size: 18px;
		width: 270px;
	}
	.pwReForm > form > p > input[type='email']:hover {
		border: 2px solid #3E64FF;
	}
	.pwReForm > form > p > input[type='submit'] {
		margin-bottom: -30px;
		font-size: 16px;
		padding: 10px 20px;
		border-radius: 20px;
		border: 1px solid #3E64FF;
		background-color: #3E64FF;
		color: white;
		font-weight: bold;
		cursor: pointer;
	} 
	.pwReForm > form > p > input[type='submit']:hover {
		background-color: white;
		border: 1px solid white;
		color: #3E64FF;
		font-weight: bold;
	}
</style>
<div id="pwReBox">
	<div class="pwReN">비밀번호 재설정</div>
		
	<div class="pwReForm">
		<form method="POST">
			<div>아이디 입력</div>
			<p><input type="text" name="employee_userid" placeholder="ID" required autofocus autocomplete="off"></p>
			<div>이메일 입력</div>
			<p><input type="email" name="recovery_email" placeholder="E-mail" required autocomplete="off"></p>
			<p><input type="submit" value="전송"></p>
		</form>
	</div>
</div>

</body>
</html>