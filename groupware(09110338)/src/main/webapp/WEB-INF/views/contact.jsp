<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<style>
	/* Scroll Style */
	#contactlist > .contactlist_wrap_bottom::-webkit-scrollbar {
      border: rgba(246, 246, 246, 0.5);
      width:1vw;   
   }
	#contactlist > .contactlist_wrap_bottom::-webkit-scrollbar-track {
       background-color: rgba(246, 246, 246, 0.5);
    }
   	#contactlist > .contactlist_wrap_bottom::-webkit-scrollbar-thumb {
		background-color: #DAD9D9;
		border-radius: 10px;
    }
    #contactlist > .contactlist_wrap_bottom {
		overflow-y: scroll;
		height: 70vh; 
    }
	
	/* 주소록 */
	#contactlist {
		margin-left: 1%;
		margin: 0 1.4%;
		box-shadow: 0 10px 4px -10px rgba(0,0,0,0.1);
		max-width: 100%;
	}
	#contactlist > div > div {
		display: flex;
	}
	#contactlist > div > div > div {
		flex: 2;
	}
	#contactlist > .contactlist_wrap_top > .contactlist_list {
		font-weight: bold;
	}
	#contactlist > .contactlist_wrap_top > .contactlist_list > .top {
		margin: auto;
	}
	#contactlist > .contactlist_wrap_top > .contactlist_list > .left {
		text-align: left;
		margin-left: 1.45%;
	}
	#contactlist > .contactlist_wrap_top > .contactlist_list > .right {
		text-align: right;
		margin-right: 5%;
	}
	#contactlist > .contactlist_wrap_top > .contactlist_title {
		font-weight: bold;
		font-size: 17px;
		background-color: white;
		text-align: left;
	}
	#contactlist > .contactlist_wrap_top > .contactlist_title > div {
		padding: 1.1% 0;
		padding-left: 10px;
	}
	#contactlist > .contactlist_wrap_top > .contactlist_title > .idx {
		flex: 0.7;
		text-align: center;
		padding-left: 0;s
	}
	#contactlist > .contactlist_wrap_bottom {
		border:  none;
	}
	#contactlist > .contactlist_wrap_bottom > .contactlist_detail {
		text-align: left;
	}
	#contactlist > .contactlist_wrap_bottom > .contactlist_detail > .idx {
		flex: 0.7;
		text-align: center;
		padding-left: 0;
	}
	#contactlist > .contactlist_wrap_top > .contactlist_title > .period {
		flex: 2;
	}
	#contactlist > .contactlist_wrap_bottom > .contactlist_detail > .period {
		flex: 2;
	}
	#contactlist > .contactlist_wrap_top > .contactlist_title > .writer {
		flex: 1.4;
	}
	#contactlist > .contactlist_wrap_bottom > .contactlist_detail > .writer {
		flex: 1.4;
	}
	#contactlist > .contactlist_wrap_bottom > .contactlist_detail {
		border-bottom: 1px solid #E1E5E8;
		padding: 0.2% 0;
	}
	#contactlist > .contactlist_wrap_bottom > .contactlist_detail > div {
		border-left: 1px solid #E1E5E8;
	}
	#contactlist > .contactlist_wrap_bottom > .contactlist_detail:hover {
		background-color: #EEE;
	}
	#contactlist > .contactlist_wrap_bottom > .contactlist_detail > div {
		padding: 1.2% 0;
		padding-left: 10px;
	}
	#contactlist > .contactlist_wrap_top > .contactlist_title > .img {
		flex: 0.6;
		text-align: center;
		padding-left: 0;
	}
	#contactlist > .contactlist_wrap_bottom > .contactlist_detail > .img {
		flex: 0.6;
		text-align: center;
		padding-left: 0;
	}
	#contactlist > .contactlist_wrap_bottom > .contactlist_detail > .img > img {
		width: 50px;
		height: 50px;
		object-fit: cover;
		margin: -20px 0;
		border-radius: 100%;
		border: 1px solid #E1E5E8;
	}
	/**/
</style>

<div id="homeMain">
	<div id="contactlist"></div>
</div>
<script>
	document.addEventListener('DOMContentLoaded', contactListHandler)
</script>

</body>
</html>