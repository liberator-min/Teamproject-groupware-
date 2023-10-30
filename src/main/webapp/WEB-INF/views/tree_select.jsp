<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Group Ware</title>

<style>
   #TreedepartName {
      position: absolute;
      font-size: 60px;
      top: 6%;
      left: 8%;
   }
   #tree_header {
      position: absolute;
      top: 5%;
      left: 75%;
      display: flex;
      font-size: 25px;
      list-style: none;
   }
   #tree_header > li {
   	margin: 0 10px;
   	cursor: pointer;
   }
   #tree_header > li > ol {
   	display: none;
   	margin-top: 10px;
   	font-size: 22px;
   	cursor: pointer;
   }
   #tree_header > li > ol:before {
   	content: "- "
   }
   #tree_header > li:hover > ol{
   	display: block;
   	padding-left: 5px;
   }
    #department_all {
      margin-right: 20px;
      cursor: pointer;
   }
   #DpTree {
   	display: inline-block;
   	position: absolute;
   	top: 25%;
   	left: 35%;
   }
    #treeOne, #treeTwo, #treeThree, #treeFour, #treeFive {
      display: flex;
      justify-content: center;
   }   
   .TreeValue {
   	display: inline-block;
   	padding: 0 5px;
   	margin: 20px 15px;
   }
   .rankName {
   	text-align: center;
   	font-weight: bold;
   	font-size: 16px;
   	color: #353535;
   }
   .rankImg > img {
	  width: 5vw;
	  height: 10vh;
   }
</style>
<body>
<div id="homeMain">
	<div id="TreedepartName">${department}</div>
	
	<ul id="tree_header">
		<li id="department_all">전체 조직도</li>
		<li id="department_select">
			부서별 조직도
			<c:forEach var="dp" items="${depart_list }">
				<ol class="depart">${dp.department_name }</ol>
			</c:forEach>
		</li>
	</ul>
	
	<div id="DpTree">	
		<div id="treeOne">
			<c:forEach var="dto" items="${tree_depart }">
			<c:if test="${dto.job_id == 5 }">
				<div class="TreeValue">
					<div class="rankImg"><img src="${cpath }/profileupload/${dto.profile_fic}"></div>
					<div class="rankName">${dto.employee_name } ${dto.job_name }</div>
				</div>
			</c:if>
			</c:forEach>
		</div>
		
		<div id="treeTwo">
			<c:forEach var="dto" items="${tree_depart }">
			<c:if test="${dto.job_id == 4 }">
				<div class="TreeValue">
					<div class="rankImg"><img src="${cpath }/profileupload/${dto.profile_fic}"></div>
					<div class="rankName">${dto.employee_name } ${dto.job_name }</div>
				</div>
			</c:if>
			</c:forEach>
		</div>
		
		<div id="treeThree">
			<c:forEach var="dto" items="${tree_depart }">
			<c:if test="${dto.job_id == 3 }">
				<div class="TreeValue">
					<div class="rankImg"><img src="${cpath }/profileupload/${dto.profile_fic}"></div>
					<div class="rankName">${dto.employee_name } ${dto.job_name }</div>
				</div>
			</c:if>
			</c:forEach>
		</div>
		
		<div id="treeFour">
			<c:forEach var="dto" items="${tree_depart }">
			<c:if test="${dto.job_id == 2 }">
				<div class="TreeValue">
					<div class="rankImg"><img src="${cpath }/profileupload/${dto.profile_fic}"></div>
					<div class="rankName">${dto.employee_name } ${dto.job_name }</div>
				</div>
			</c:if>
			</c:forEach>
		</div>
		
		<div id="treeFive">
			<c:forEach var="dto" items="${tree_depart }">
			<c:if test="${dto.job_id == 1 }">
				<div class="TreeValue">
					<div class="rankImg"><img src="${cpath }/profileupload/${dto.profile_fic}"></div>
					<div class="rankName">${dto.employee_name } ${dto.job_name }</div>
				</div>
			</c:if>
			</c:forEach>
		</div>
	</div>
</div>

<script>
   function allHandler(event) {
      window.location.href = '${cpath}/tree'      
   }
    
   function selectdp_Handler(event) {
      const depart = event.currentTarget.textContent
       window.location.href = '${cpath}/tree_select/' + depart
   }
   
   document.querySelectorAll('.depart').forEach(item => {
        item.onclick = selectdp_Handler
    })
 
   document.getElementById('department_all').addEventListener('click', allHandler)
    
</script>

</body>
</html>