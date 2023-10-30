<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
	#approvallog {
		margin-left: 1%;
		margin: 0 1.4%;
		text-align: center;
		box-shadow: 0 10px 4px -4px rgba(0,0,0,0.1);
	}
	#approvallog > div {
		display: flex;
	}
	#approvallog > div > div {
		flex: 1;
	}
	#approvallog > .approvallog_list {
		font-weight: bold;
	}
	#approvallog > .approvallog_list > .top {
		margin: auto;
	}
	#approvallog > .approvallog_list > .left {
		text-align: left;
		margin-left: 1.45%;
	}
	#approvallog > .approvallog_list > .right {
		text-align: right;
		margin-right: 5%;
	}
	#approvallog > .approvallog_title {
		padding: 1% 0;
		font-weight: bold;
		font-size: 17px;
		background-color: #d3d3d3;
	}
	#approvallog > .approvallog_title > .idx {
		flex: 0.7;
	}
	#approvallog > .approvallog_detail > .idx {
		flex: 0.7;
	}
	#approvallog > .approvallog_title > .period {
		flex: 2;
	}
	#approvallog > .approvallog_detail > .period {
		flex: 2;
	}
	#approvallog > .approvallog_title > .writer {
		flex: 1.4;
	}
	#approvallog > .approvallog_detail > .writer {
		flex: 1.4;
	}
	#approvallog > .approvallog_detail {
		border-bottom: 1px solid #ddd;
	}
	#approvallog > .approvallog_detail:hover {
		background-color: #f4f4f4;
	}
	#approvallog > .approvallog_detail > div {
		padding: 1% 0;
	}
	#approvallog > .approvallog_detail > .approvallog_view {

	}
	#approvallog > .approvallog_detail > .approvallog_view > span {
		border: 1px solid #ddd;
		background-color: #ddd;
		cursor: pointer;
		border-radius: 4px;
		padding: 4px 8px;
	}
	#approvallog > .approvallog_detail > .approvallog_view > span:hover {
		background-color: #ccc;
	}
</style>

<!-- Modal Style (Approval) -->
<style>
	#approvallogmodal > #modal-approvallog > #overlay-approvallog {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background-color: rgba(0, 0, 0, 0.6);
	}
	#approvallogmodal > #modal-approvallog > #modal-content-approvallog {
		height: 880px;
		width: 750px;
		box-sizing: border-box;
		background-color: white;
		position: fixed;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		z-index: 5;
	}
	#modal-content-approvallog > .approvallogmodal-item > .isapprove > img {
		width: 280px;
	}
	#approvallogmodal > .hidden {
		display: none;
	}
</style>
<div id="homeMain">
	<div id="approvallog"></div>
</div>
	
	<div id="approvallogmodal">
		<div id="modal-approvallog" class="hidden">
			<div id="overlay-approvallog"></div>
			<div id="modal-content-approvallog"></div>
		</div>
	</div>


<script>
	document.getElementById('overlay-approvallog').onclick = closeModalApprovalLog
	document.addEventListener('DOMContentLoaded', loadHandlerApprovalLog)
</script>

</body>
</html>