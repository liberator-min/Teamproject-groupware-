<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
	#adminPage {
		text-align: center;
	}
	#adminPage > .logo {
		font-size: 100px;
		font-weight: bold;
		margin: 3% 0;
	}
	#adminPage > .title {
		font-size: 20px;
		font-weight: bold;
		margin-bottom: 7%;
	}
	#adminPage > .main {
		display: flex;
		justify-content: space-evenly;
	}
	#adminPage > .main > .content {
		border: 1px solid white;
		background-color: white;
		border-radius: 100%;
		width: 235px;
		height: 235px;
		line-height: 235px;
		font-size: 30px;
		box-shadow: 4px 4px 10px 0 rgba(0,0,0,0.1);
	}
	.content > a {
		text-decoration: none;
		color: #212121;
	}
</style>
<div id="homeMain">
	<div id="adminPage">
		<div class="logo">Jerony</div>
		<div class="title">관리자 페이지</div>
		<div class="main">
			<div class="content">
				<a href="${cpath }/administrator/approval_log">
					<div>승인 결재</div>
				</a>
			</div>
			<div class="content">
				<a href="${cpath }/administrator/member_list">
					<div>사원 관리</div>
				</a>
			</div>
			<div class="content">
				<a href="${cpath }/board/view">
					<div>게시판</div>
				</a>
			</div>
		</div>
	</div>
</div>

</body>
</html>