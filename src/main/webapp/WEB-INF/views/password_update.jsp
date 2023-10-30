<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<style>
/* 	#pwUpUser > .pwUp_Bottom > form > .pwUp_UserForm > .pwUp_Item { */
/* 		display: flex; */
/* 	} */

	@font-face {
	     font-family: 'Pretendard-Regular';
	     src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	     font-weight: 400;
	     font-style: normal;
	}
    * {
    	font-family: 'Pretendard-Regular';
    }
	#pwUpUser {
		margin: 180px auto;
		width: 20vw;
		text-align: center;
	}
	.pwUp_Top {
		font-size: 40px;
		font-weight: bold;
		margin-bottom: 60px;
		display: inline-block;
	}
	.pwUp_Bottom {
		padding: 0 15px;
	}
	.pwUp_Title {
		text-align: left;
		padding-left: 30px;
		margin-bottom: -9px;
		font-size: 18px;
	}
	.pwUp_Item_Top {
		margin-bottom: 30px;
	}
	.pwUp_Item_Bottom {
		margin-bottom: 10px;
	}
	.pwInput {
		height: 40px;
		color: #3E64FF;
		border: 1px solid rgb(106, 103, 103, 0.1);
		font-weight: bold;
		border-radius: 10px;
		padding: 5px 8px;
		outline: 1px solid rgb(106, 103, 103, 0.1);
		font-size: 18px;
		width: 270px;
		margin-top: 20px;
	}
	.pwInput:hover {
		border: 2px solid #3E64FF;
	}
	.pwReInput {
		height: 40px;
		color: #3E64FF;
		border: 1px solid rgb(106, 103, 103, 0.1);
		font-weight: bold;
		border-radius: 10px;
		padding: 5px 8px;
		outline: 1px solid rgb(106, 103, 103, 0.1);
		font-size: 18px;
		width: 500px;
		margin-top: 20px;
		margin-left: 30px;
		padding-right: 48px;
	}
	.pwReInput:hover {
		border: 2px solid #3E64FF;
	}
	.pwUp_Item_submitBtn {
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
	.pwUp_Item_submitBtn:hover {
		background-color: white;
		border: 1px solid white;
		color: #3E64FF;
		font-weight: bold;
	}
	.pwUp_Content_Bottom > div {
		display: flex;
	}
	#dupPwCheckBtn {
		margin-top: 34px;
		margin-left: 10px;
	}
	#dupPwMessage {
		margin-left: 36px;
	}
</style>
<div id="homeMain">
	<div id="pwUpUser"></div>
</div>

<script>
	document.addEventListener('DOMContentLoaded', pwUpdateHandler)
</script>

</body>
</html>