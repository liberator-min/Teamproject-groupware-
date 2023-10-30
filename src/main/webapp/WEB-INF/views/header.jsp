<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Group Ware</title>
<link type="text/css" rel="stylesheet"
	href="${cpath }/resources/css/HH.css">



<script>
   const cpath = '${cpath}'
</script>
<script src="${cpath}/resources/js/script.js"></script>
<script src="${cpath}/resources/js/chatting.js"></script>
<!-- PDF JS -->
<script src="${cpath }/resources/js/jspdf.js"></script>
<script src="${cpath }/resources/js/html2canvas.js"></script>
<!-- PDF JS End -->
<body>
	<c:if test="${login.employee_userid != null}">
		<div class="login_employee_idx" style="display: none;">${login.employee_idx }</div>
		<div class="login_employee_name" style="display: none;">${login.employee_name }</div>
		<div id="top">
			<div id="topLogout">
				<div>
					<a href="${cpath }/logout">로그아웃</a>
				</div>
			</div>
			<div class="HrTree">
				<a href="${cpath }/tree"><img
					src="${cpath }/resources/home/조직도.png"></a> <a
					href="${cpath }/tree"><div>조직도</div></a>
			</div>
			<!-- end of HrTree -->
			<div class="weather">
				<div class="weatherImg">
					<img class="weather_icon">
				</div>
				<div class="details">
					<div class="temper"></div>
				</div>
			</div>
			<!-- end of weather -->
		</div>

		<div id="main_side">
			<div id="LOGO">
				<a href="${cpath }/company_Introduction">
					<div>
						<img class="logoImg" src="${cpath }/resources/home/로고.png">
					</div>
				</a>
			</div>

			<div class="sideMenu">
				<a href="${cpath }/">
					<div>
						<img class="hm_sideImg" src="${cpath }/resources/home/홈.png">
					</div>
					<div>HOME</div>
				</a>
			</div>

			<div class="sideMenu">
				<a href="${cpath }/board/view">
					<div>
						<img class="hm_sideImg" src="${cpath }/resources/home/게시판.png">
					</div>
					<div>게시판</div>
				</a>
			</div>

			<div class="sideMenu">
				<a href="${cpath }/schedule/listall">
					<div>
						<img class="hm_sideImg" src="${cpath }/resources/home/일정.png">
					</div>
					<div>일정</div>
				</a>
			</div>

			<div class="sideMenu">
				<c:if test="${login.job_id < 6 }">
					<a href="${cpath }/approval/request_list">
						<div>
							<img class="hm_sideImg" src="${cpath }/resources/home/결재.png">
						</div>
						<div>결재</div>
					</a>
				</c:if>
				<c:if test="${login.job_id >= 6 }">
					<a href="${cpath }/approval/standby_list">
						<div>
							<img class="hm_sideImg" src="${cpath }/resources/home/결재.png">
						</div>
						<div>결재</div>
					</a>
				</c:if>
			</div>
			<div class="sideMenu">
				<a href="${cpath }/mail/receiveList">
					<div>
						<img class="hm_sideImg" src="${cpath }/resources/home/쪽지.png">
					</div>
					<div>쪽지</div>
				</a>
			</div>
			<div class="sideMenu">
				<a href="${cpath }/contact">
					<div>
						<img class="hm_sideImg" src="${cpath }/resources/home/주소록.png">
					</div>
					<div>주소록</div>
				</a>
			</div>
			<c:if test="${not empty login and login.employee_userid == 'root' }">
				<div class="sideMenu">
					<a href="${cpath }/administrator/admin_main">
						<div>
							<img class="hm_sideImg" src="${cpath }/resources/home/관리자.png">
						</div>
						<div>관리자</div>
					</a>
				</div>
			</c:if>
		</div>
		<!-- end of main_side -->
		<div id="root">
			<img id="chattingBtn" src="${cpath }/resources/home/채팅.png">
		</div>
	</c:if>


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
	<script>
	const api_key = '98c3f8faec5720a5bd4f5b1c7471743b';
	const lat = '35.1669369';
	const lon = '129.1328772';

	const getWeather = (lat, lon) => {
  	const url = 'https://api.openweathermap.org/data/2.5/weather?lat=' + lat + '&lon=' + lon + '&appid=' + api_key + '&units=metric&lang=kr';

  fetch(url)
    .then(resp => resp.json())
    .then(json => {
      console.log(json);
      const icon = json.weather[0].icon;
      const iconURL = 'http://openweathermap.org/img/wn/' + icon + '@2x.png';
      const temp = '기온:  ' + json.main.temp + ' ℃';
      const loc = json.name;
      const sub = json.weather[0].description;

      document.querySelector('.weather_icon').setAttribute('src', iconURL);
      document.querySelector('.temper').innerText = temp;
    })
    .catch((error) => {
      console.log(error);
    });
};

document.addEventListener('DOMContentLoaded', function (event) {
  getWeather(lat, lon);
});
</script>

	<script>
	window.addEventListener('wheel', function(e) {
	  if (e.ctrlKey) {
	      e.preventDefault();
	  }
	}, { passive: false });
	
	window.addEventListener('keydown', function(e) {
	  if (e.ctrlKey && (e.which === 61 || e.which === 107 || e.which === 173 || e.which === 109 || e.which === 187  || e.which === 189)) {
	      e.preventDefault();
	  }
	})
	
	window.onload = chatLoadHandler()
</script>

	