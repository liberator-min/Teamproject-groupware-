<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="approval_side.jsp" %>
<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/approval/standby_list.css">
 


<c:if test="${login.job_id == 5}">
<div id="ApproveStWait_list">
   <table id="approveSt_table">
      <thead>
         <tr>
             <th>제목</th>
            <th>작성자</th>
            <th>작성일자</th>
            <th>승인일자</th>
            <th>종류</th>
            <th>상태</th>
         </tr>
      </thead>
      <tbody>
         <c:forEach var="wait" items="${wait_list}">
         <tr class="wait-row">
            <td hidden="true" class="wait-idx">${wait.approval_idx}</td>
            <td>${wait.approval_title }</td> 
            <td>${wait.employee_name } ${wait.job_name }(${wait.department })</td> 
            <td>${wait.write_date}</td> 
            <td>${wait.approval_date}</td> 
            <c:choose>
               <c:when test="${wait.type=='p'}"><td>결제</td></c:when>
               <c:when test="${wait.type=='b'}"><td>업무</td></c:when>
               <c:when test="${wait.type=='v'}"><td>연차</td></c:when>
            </c:choose>
            <c:choose>
               <c:when test="${wait.isapprove==1}"><td>대기</td></c:when>
               <c:when test="${wait.isapprove==2 }"><td>심사중</td></c:when>
               <c:when test="${wait.isapprove==0}"><td>거절</td></c:when>
               <c:when test="${wait.isapprove==3}"><td>승인</td></c:when>
            </c:choose>
         </tr>
         </c:forEach>
      </tbody>
   </table>
</div>
</c:if>


<c:if test="${login.job_id >= 6}">
<div id="ApproveStWait_list">
   <table id="approveSt_table">
   <thead>
      <tr>
         <th>제목</th>
         <th>작성자</th>
         <th>작성일자</th>
         <th>승인일자</th>
         <th>종류</th>
         <th>상태</th>
      </tr>
   </thead>
   <tbody>
      <c:forEach var="boss" items="${boss_list }">
         <tr class="wait-row">
         <td hidden="true" class="wait-idx">${boss.approval_idx }</td>
         <td>${boss.approval_title }</td> 
         <td>${boss.employee_name } ${boss.job_name }(${boss.department })</td> 
         <td>${boss.write_date }</td> 
         <td>${boss.approval_date }</td> 
         <c:choose>
            <c:when test="${boss.type=='p'}"><td>결제</td></c:when>
            <c:when test="${boss.type=='b'}"><td>업무</td></c:when>
            <c:when test="${boss.type=='v'}"><td>연차</td></c:when>
         </c:choose>
         <c:choose>
            <c:when test="${boss.isapprove==1}"><td>대기</td></c:when>
            <c:when test="${boss.isapprove==2}"><td>1차 승인</td></c:when>
            <c:when test="${boss.isapprove==0}"><td>거절</td></c:when>
            <c:when test="${boss.isapprove==3}"><td>거절</td></c:when>
            <c:when test="${boss.isapprove==4}"><td>최종 승인</td></c:when>
         </c:choose>
      </tr>
      </c:forEach>
   </tbody>
   </table>
</div>
</c:if>


<div id="ApproveStAll_list">
   <table id="approvalAll_table">
   <thead>
      <tr>
         <th>제목</th>
         <th>작성자</th>
         <th>작성일자</th>
         <th>승인일자</th>
         <th>종류</th>
         <th>상태</th>
      </tr>
   </thead>
   <tbody>
      <c:forEach var="all" items="${all_list }">
         <tr class="all-row">
         <td hidden="true" class="all-idx">${all.approval_idx }</td>
         <td>${all.approval_title }</td> 
         <td>${all.employee_name } ${all.job_name }(${all.department })</td> 
         <td>${all.write_date }</td> 
         <td>${all.approval_date }</td> 
         <c:choose>
            <c:when test="${all.type=='p'}"><td>결제</td></c:when>
            <c:when test="${all.type=='b'}"><td>업무</td></c:when>
            <c:when test="${all.type=='v'}"><td>연차</td></c:when>
         </c:choose>
         <c:choose>
            <c:when test="${all.isapprove==1}"><td>대기</td></c:when>
            <c:when test="${all.isapprove==2}"><td>1차 승인</td></c:when>
            <c:when test="${all.isapprove==0}"><td>거절</td></c:when>
            <c:when test="${all.isapprove==3}"><td>거절</td></c:when>
            <c:when test="${all.isapprove==4}"><td>최종 승인</td></c:when>
         </c:choose>
      </tr>
      </c:forEach>
   </tbody>
   </table>
</div>

<script>
   const waitRows = document.querySelectorAll('.wait-row')
   const allRows = document.querySelectorAll('.all-row')
    
   waitRows.forEach(row => {
      row.addEventListener('click', updateHandler)
   })
   
   function updateHandler(event) {
         const idx = event.currentTarget.querySelector('.wait-idx').innerText
         window.location.href = '${cpath}/approval/update/' + idx
   }
   
   allRows.forEach(row => {
      row.addEventListener('click', selectHandler)
   })
   function selectHandler (event) {
      const idx = event.currentTarget.querySelector('.all-idx').innerText
      window.location.href = '${cpath}/approval/selectOne/' + idx
   }
</script>

</body>
</html>