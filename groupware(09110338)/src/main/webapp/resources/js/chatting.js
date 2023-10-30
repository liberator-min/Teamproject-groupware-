'use strict';

function chatLoadHandler(){

const chattingBtn = document.getElementById('chattingBtn')
const root = document.getElementById('root')
const departmentList = ['경영부', '개발부', '인사부', '마케팅부', '영업부', '재무부']
const username = document.querySelector('.login_employee_name').innerText
let chatDivCreated = false
let selectedEmployee = null
console.log(selectedEmployee)
// side 채팅 버튼 이벤트 리스너 
chattingBtn.addEventListener('click', function() {
   if(!chatDivCreated){
      getChattingDiv()
      chatDivCreated = true
   }
   if(chatDivCreated && document.querySelector('.chattingDiv').style.display === 'none'){
      document.querySelector('.chattingDiv').style.display = 'flex'
   }
})



async function getChattingDiv(event) {

   const chattingDiv = document.createElement('div')
   chattingDiv.classList.add('chattingDiv')
   
   root.appendChild(chattingDiv)
   
   
   const chatEmployeeDiv = document.createElement('div')
   chatEmployeeDiv.classList.add('chatEmployeeDiv')
   
   const searchDiv = document.createElement('div')
   searchDiv.classList.add('searchDiv')
   
   
   const listDiv = document.createElement('div')
   listDiv.classList.add('listDiv')

   
   
   const chatDiv = document.createElement('div')
   chatDiv.classList.add('chatDiv')
   
   chattingDiv.appendChild(chatEmployeeDiv)
   chattingDiv.appendChild(chatDiv)
   
   chatEmployeeDiv.appendChild(searchDiv)
   chatEmployeeDiv.appendChild(listDiv)
   
   const input = document.createElement('input')
   input.type = 'text';        
   input.name = 'search';     
   input.placeholder = 'Search'; 
   searchDiv.appendChild(input)
   
   input.addEventListener('input', chathandleSearch)
   
   input.addEventListener('focus', chathandleSearch)
   
   input.focus()
   
   document.addEventListener('mouseup', function(e) {
    const chattingDiv = document.querySelector('.chattingDiv');
    if (!chattingDiv.contains(e.target)) {
       chattingDiv.style.display = 'none'
    }
})
   
   
   
}



async function chathandleSearch(event) {
    const searchTerm = event.target.value;

    // 백엔드에 검색어 전송하고 필터링된 데이터 가져오기
    const filteredEmployees = await getFilteredEmployees(searchTerm);

    // 결과를 화면에 업데이트
    updateEmployeeList(filteredEmployees);
}

async function getFilteredEmployees(searchTerm) {
    // 백엔드로 검색어를 전송하고 필터링된 데이터를 받아오는 코드
    const list = await fetch(cpath + '/getChatList?searchTerm=' + searchTerm).then(resp => resp.json());
    return list
}

function updateEmployeeList(employees) {
    // 기존의 리스트 초기화
    const employeeContainer = document.querySelector('.listDiv');
    
    if (employeeContainer){
       employeeContainer.innerHTML = ''
    }
    
    insertDepartment()
    
    for(let i = 0; i < employees.length; i++) {
        insertEmployeeList(employees[i])        
      }
    
}

function insertEmployeeList(employee){
        
      const employeeOne = document.createElement('button')
         employeeOne.classList.add('employeeOne')
         employeeOne.style.cssText=' margin: 5px auto;  width: 80%;  height: border: 1px solid black;'
       let tag = ''
       tag += '<div class="chatEmployeeEach">'
       tag += '<div><img src="' + cpath + '/profileupload/' + employee.profile_fic + '" height="50vh"></div>'
       tag += '<div>'
       tag += '      <div>' + employee.employee_name + '</div>'
       tag += '    <div>'+ employee.department + " / "+ employee.job_name + '</div>'
       if(employee.islogin == 1) tag += '   <div><img src="'+cpath+'/resources/btns/login.png" width=12px; height=12px;>온라인</div>'
       if(employee.islogin == 0) tag += '   <div><img src="'+cpath+'/resources/btns/logout.png" width=12px; height=12px;>오프라인</div>' 
       tag += '</div>'
       tag += '</div>'
       employeeOne.innerHTML += tag
       document.querySelector('.' + employee.department).appendChild(employeeOne)
       
       // employeeOne 클릭 이벤트 리스너 추가
       employeeOne.addEventListener('click', function() {
          if (selectedEmployee !== employeeOne) {
             selectedEmployee = employeeOne
             openChatRoom(employee)
          }
          else {
             return
          }
       });
       
}



function insertDepartment() {
    const ld = document.querySelector('.listDiv')
   
   departmentList.forEach(d =>{
          const department = document.createElement('details')
         department.classList.add('department')
         department.open = 'open'
         department.classList.add(d)
         const summary = document.createElement('summary')
            summary.classList.add('summary')
          summary.innerText = d
         ld.appendChild(department)
         department.appendChild(summary)
       })
   
}   

function openChatRoom(employee) {
   
   const chatDiv = document.querySelector('.chatDiv')
   
   if(chatDiv !== null) chatDiv.innerHTML = ''
   
   const chatDivTop = document.createElement('div')
   chatDivTop.classList.add('chatDivTop')
   
   const chatDivBottom = document.createElement('div')
   chatDivBottom.classList.add('chatDivBottom')
   
   chatDiv.appendChild(chatDivTop)
   chatDiv.appendChild(chatDivBottom)
   
   insertChatDivTop(employee)
   insertChatDivBottom(employee)
}

function insertChatDivTop(employee) {
   const chatDivTop = document.querySelector('.chatDivTop')
   
   let tag = ''
   tag += '<div class="chattingProImgSide"><img src="' + cpath + '/profileupload/' + employee.profile_fic + '" height="100vh"></div>'
   tag += '<div>'
   tag += '   <div>' + employee.employee_name + '</div>'
    tag += '    <div>'+ employee.department + " / "+ employee.job_name + '</div>'
    if(employee.islogin == 1) tag += '   <div><img src="'+cpath+'/resources/btns/login.png" width=12px; height=12px;>온라인</div>'
    if(employee.islogin == 0) tag += '   <div><img src="'+cpath+'/resources/btns/logout.png" width=12px; height=12px;>오프라인</div>' 
   tag += '</div>'
   chatDivTop.innerHTML += tag
}

function insertChatDivBottom(employee) {
      const chatDivBottom = document.querySelector('.chatDivBottom')
      const socket = new SockJS(cpath + '/chat') // SockJS 주소 설정
      const stompClient = Stomp.over(socket)
       const roomName = makeRoomName(employee)
       
       let chatpayload = document.createElement('div')
       chatpayload.classList.add('chatpayload')
         
       chatDivBottom.appendChild(chatpayload)
       
       let chatForm = document.createElement('form')

       let chatinput = document.createElement('input');
      chatinput.name = 'message';
      chatinput.placeholder = '메세지를 입력하세요';
      chatinput.type = 'text'
      chatinput.autocomplete = 'off'
      
       let chatSubmit = document.createElement('input')
       chatSubmit.type = 'submit'
       chatSubmit.value = '보내기'

       chatForm.appendChild(chatinput)
       chatForm.appendChild(chatSubmit)

       chatDivBottom.appendChild(chatForm)
       
       // 이미 생성한 해당 방이 있다면 그 내용을 불러오기
      
       getAndLoadChatRoom(roomName)
      
      // 메시지 띄우기 

      stompClient.connect({}, function(){
      
         stompClient.subscribe('/queue/chat/' + roomName , function(chat){
            var content = JSON.parse(chat.body)
            
            let tag = ''
            tag += '<div class="' + (content.chatsender == username ? 'chatown' : 'chatother') + '">'
            tag += '   <div class="chatuser">' + content.chatsender + '</div>'
            tag += '   <div class="chatcontent">' + content.chatcontent +'</div>'
            tag += '</div>'
         
            chatpayload.innerHTML += tag
         
            chatpayload.scroll({top: chatpayload.scrollHeight, behavior: 'smooth'})
            
            
         })
      })
      
       // 메시지 보내기 (submit 눌렀을때)
       chatForm.onsubmit = function (event) {
           event.preventDefault()
           
         if(chatForm.message.value == ''){
            return
         }
           
         stompClient.send('/app/hello/' + roomName , {} , JSON.stringify({
             chatcontent: chatForm.message.value,
             chatsender: username,
             chatreceiver: employee.employee_name,
             roomName: roomName
         }))
         
           chatForm.message.value = ''
           chatForm.message.focus()
       }
      
   }


   // 채팅방 이름 만들어주는 함수(오름차순 정렬)
   function makeRoomName(employee) {
      const namesArr = [username, employee.employee_name]
      namesArr.sort();
      const roomName = namesArr.join('_')
      return roomName
   }

   // 해당하는 방 이름의 채팅 로그들을 DB에서 불러와서 뿌려주는 함수
   async function getAndLoadChatRoom(roomName) {
      let isloaded = false 
      let chatpayload = document.querySelector('.chatpayload')
      
      if(!isloaded) {
         await fetch(cpath + '/getRoomChat?roomName=' + roomName)
         .then(resp => resp.json())
         .then(data => {
            
            data.forEach(ob => {
               
               let tag = ''
                tag += '<div class="' + (ob.chatsender == username ? 'chatown' : 'chatother') + '">';
                tag += '   <div class="chatuser">' + ob.chatsender + '</div>'
                tag += '   <div class="chatcontent">' + ob.chatcontent +'</div>';
                tag += '</div>';
         
                chatpayload.innerHTML += tag;
            })
         })
      }
      
      chatpayload.scroll({top: chatpayload.scrollHeight, behavior: 'smooth'});
   }
   
   
}