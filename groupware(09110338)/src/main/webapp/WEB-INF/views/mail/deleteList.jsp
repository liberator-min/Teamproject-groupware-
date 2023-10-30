<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" type="text/css" href ="${cpath }/resources/css/mail/deleteList.css">
</head>
<body>

<div id="homeMain">
	<div id="mailMainBox">
		<div id="mailSideBox">
			<div><a href="${cpath }/mail/receiveList">받은 쪽지&emsp; ${receiveNoCount }</a></div>
			<div><a href="${cpath }/mail/insert">쪽지쓰기</a></div>
			<div><a href="${cpath }/mail/sendList">쓴 쪽지함</a></div>
			<div><a href="${cpath }/mail/deleteList">휴지통&emsp; ${deleteCount}</a></div>
			
			<form id="mail_column" method="POST" action="${cpath }/mail/deleteList">
				<div class="mailSearchBox">
					<input type="text" id="mail_delete_inputSearch" name="mail_search" placeholder="검색어를 입력하세요" >
					<input type="submit" name="mail_submit" value="검색">
				</div>
					<select id="mail_delete_select" name="mail_column">
						<option value="mail_title">제목으로 검색</option>
						<option value="mail_writer">보낸이로 검색</option>
						<option value="mail_receiver">받는이로 검색</option>
					</select>
			</form>
		</div>	<!-- end of #mailSideBox-->
                
		
<!-- Check all button -->
		<div id="sendMailBox">
			<div class="mailDeleteButton"><input type="button" value="삭제" class="delete" onclick="deleteValue()"></div>
				<table>
					<thead>
		        		<tr>
		        			<th><input type="checkbox" id="allCheck" name="allCheck" ></th>
		        			<th class="mailTitle">Title</th>
		        			<th>받는사람</th>
		        			<th>작성자</th>
		        			<th>작성일자</th>
		        		</tr>
		        	</thead>
		        	<tbody>
		        		<c:forEach var="dto" items="${list}">
			    			<tr>
			        			<td><input class="chk" name="rowcheck" type="checkbox" value="${dto.mail_idx }"></td>
			        			<td><a href="${cpath}/mail/selectone/delete/${dto.mail_idx}">${dto.mail_title}</a></td>
			        			<td>${dto.mail_receiver }</td>
			        			<td>${dto.mail_writer }</td>
			        			<td>${dto.mail_writedate}</td>
			        		</tr>
			        	</c:forEach>
		          	</tbody>
				</table>
           
           
       <div id="mail_foot">
          <div id="mail_paging">
          		<c:if test="${mailpaging.prev }">
                  <a href="${cpath }/mail/deleteList?page=${mailpaging.begin - mailpaging.perPage}&mail_search=${mailpaging.mail_search}&mail_column=${mailpaging.mail_column}">[이전]</a>
                </c:if>
               
               <c:set var="mail_search" value="${mailpaging.mail_search }"/>
               <c:forEach var="i" begin="${mailpaging.begin }" end="${mailpaging.end }">
                  <c:if test="${mail_search eq ''}">
                     <a href="${cpath }/mail/deleteList?page=${i}">[${i }]</a>                  
                  </c:if>
                  <c:if test="${mail_search ne ''}">
                     <a href="${cpath }/mail/deleteList?page=${i}&mail_search=${mailpaging.mail_search}&mail_column=${mailpaging.mail_column}">[${i }]</a>
                  </c:if>   
               </c:forEach>
               
               <c:if test="${mailpaging.next }">
                  <a href="${cpath }/mail/deleteList?page=${mailpaging.end + 1}&mail_search=${mailpaging.mail_search}&mail_column=${mailpaging.mail_column}">[다음]</a>
               </c:if>
            </div>
         </div>
		</div> <!-- end of #sendMailBox -->
	</div>	<!-- end of #mailMainBox -->
</div>           

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" type="text/javascript"></script>
<script>

    $(function(){
    	let CheckObj = document.getElementsByName("rowcheck");
    	let rowCnt = CheckObj.length;
    	$("input[name='allCheck']").click(function(){
    		let check_listArr = $("input[name='rowcheck']");
    		for(let i=0; i <check_listArr.length; i++){
    			check_listArr[i].checked = this.checked;
    		}	
    	});
    	$("input[name='rowcheck']").click(function(){
    		if($("input[name='rowcheck']:checked").legnth == rowCnt){
    			$("input[name='allCheck']")[0].checked == true;
    		}
    		else{
    			$("input[name='allCheck']")[0].checked == false;
    		}
    	});
    });
    
    function deleteValue(){
    	let url = "${cpath}/mail/deletemail";
    	let valueArr = new Array();
    	let list = $("input[name='rowcheck']");
    	for(let i=0; i < list.length; i ++){
    		if(list[i].checked){
    			valueArr.push(list[i].value);
    			console.log(valueArr);
    		}
    	}
    	if(valueArr.length == 0){
    		alert("선택된 메일이 없습니다!!")
    	}
    	else{
    		let check = confirm("정말 삭제하시겠습니까?");
    		if(true===true){
    		$.ajax({
    			url : url,
    			type : 'POST',
    			traditional : true,
    			data : {
    				valueArr : valueArr
    			},
    			datatype : "json",
    			success: function(jdata){
    				if(jdata = 1){
    					alert("삭제성공");
    					location.replace("${cpath}/mail/deleteList")
    				}
    				else{
    					alert("삭제실패");
    				}
    			}
    		})
    		}
    		else{}
    	}
    }

</script>
    
<head>
</html>
    
    

