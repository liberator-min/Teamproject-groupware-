<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"></c:set>
<linK type="text/css" rel="stylesheet" href="${cpath }/resources/css/login.css">

<body>
<div class="wrap">
    <form method="POST" action="${cpath }/">
    <div id="loginForm">
        <div id="logo">	
        	<div class="compImg"><img src="${cpath }/resources/home/대문로고.png"></div>
        	<div class="compName">Jerony Company</div>
        </div>
        <div class="login">
            <div class="input"><input type="text" name="employee_userid" placeholder="아이디" required autocomplete="off"></div>
        </div>
        <div class="password">
            <div class="input"><input type="password" name="employee_userpw" placeholder="비밀번호" required></div>
        </div>
        <div class="loginBottom">
        	<div class="findPw"><a href="${cpath }/resetPassword">아이디 | 비밀번호 찾기</a></div>
        	<div class="submit"><input type="submit" value="로그인"></div>
        </div>
    </div>
    </form>
</div>
</body>
</html>