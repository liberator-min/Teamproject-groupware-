<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<style>
   #explain_body {
      display: flex;
      position: absolute;
      left: 7%;
      top: 10%;
   }
   .companyImg > img {
      width: 500px; 
      height: 650px;
      opacity: 90%;
   }
   .companyName {
      font-size: 60px;
      font-weight: bold;
      padding: 0 100px;
      padding-bottom: 60px;
   }
   .companyExplain {
      width: 1000px;
      font-size: 25px;
      margin: 0 60px;
      white-space: normal;
      line-height: 2.1;
   }
   .companyDetail {
      width: 800px;
      margin: 0 30px;
      margin-top: 50px;
      font-size: 20px;
      line-height: 1.5;
   }
</style>
<div id="homeMain">
   <div id="explain_body">
      <div class="companyImg"><img src="${cpath }/resources/company_building.jpg"></div>
      <div class="companyBody">
         <div class="companyName">인사말</div>
         <div class="companyExplain">존경하는 모든 직원 여러분,<br>
            먼저, 여러분의 헌신과 노력에 감사의 말씀을 드립니다.<br> 여러분 덕분에 우리 회사는 지속적으로 성장하고 발전하고 있습니다.<br><br>
            오늘, 저는 여러분께 간단한 인사말을 전하려고 합니다.<br> 우리는 모두 다양한 역할과 역량을 가지고 있지만,<br>
            하나의 목표를 향해 힘을 합치고 함께 일하고 있습니다.<br> 이 팀에서 각자의 역할을 수행함으로써 우리는 큰 성과를 이룰 것입니다.<br>
            여러분의 열정, 창의성, 그리고 헌신을 이어가고자 합니다.<br> 우리는 함께 성공하고, 서로 돕고, 함께 성장하는 과정에서 더욱 강해질 것입니다.<br>
            매일 매일 여러분의 노력이 회사의 발전을 이끌고 있습니다.<br> 여러분의 업적을 인정하며, 더 나은 미래를 함께 만들어 나가기 위해 힘을 모을 것입니다.<br>
            <br>
            다시 한번 여러분께 감사의 말씀을 드립니다.
            <br><br>
            - 원종래 -
         </div>
         
      </div>
   </div>
</div>
</body>
</html>