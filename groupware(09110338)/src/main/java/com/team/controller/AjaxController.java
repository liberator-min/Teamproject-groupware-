package com.team.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.team.model.ApprovalDTO;
import com.team.model.BoardDTO;
import com.team.model.DepartmentDTO;
import com.team.model.EmployeesDTO;
import com.team.model.ReplyDTO;
import com.team.model.ScheduleDTO;
import com.team.model.SendReceiverDTO;
import com.team.service.BoardService;
import com.team.service.HomeService;
import com.team.service.SendReceiverService;


@RestController
public class AjaxController {

	
	@Autowired
	private HomeService homeService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private SendReceiverService sendReceiverService;
	

	@GetMapping("/contactList")
	public Map<String, Object> contactList() {
		Map<String, Object> map = new HashMap<>();
		List<EmployeesDTO> contactList = homeService.selectAllContact();
		List<DepartmentDTO> departmentList = homeService.selectAllDepartment();

		map.put("contactList", contactList);
		map.put("departmentList", departmentList);

		return map;
	}

	@GetMapping("/userMypage/{employee_idx}")
	public EmployeesDTO mypage(@PathVariable("employee_idx") int idx) {
		EmployeesDTO dto = homeService.selectOneEmployees(idx);
		return dto;
	}
	
	@GetMapping("/userPwUpdate/{employee_idx}")
	public void userPwUpdateForm() {}
	
	@ResponseBody
	@GetMapping("/homeApproval")
	public List<ApprovalDTO> approvalList(HttpSession session) {
		String userid = ((EmployeesDTO) session.getAttribute("login")).getEmployee_userid();
		List<ApprovalDTO> approvalList = homeService.homeApproval(userid);
		return approvalList;
	}
	
	@ResponseBody
	@GetMapping("/waitAppList")
	public List<ApprovalDTO> waitList(HttpSession session) {
		String userid = ((EmployeesDTO) session.getAttribute("login")).getEmployee_userid();
		List<ApprovalDTO> waitList = homeService.bossSelect(userid);
		return waitList;
	}
	
	@GetMapping("/nReadMail")
	   public int nReadMail(HttpSession session) {
	      String mail = ((EmployeesDTO) session.getAttribute("login")).getMail();
	      int count = homeService.nReadMail(mail);
	      return count;
	   }
	@ResponseBody
	@GetMapping("/homeSchedule")
	public List<ScheduleDTO> scheduleList(HttpSession session){
		String department =  ((EmployeesDTO) session.getAttribute("login")).getDepartment();
		List<ScheduleDTO> scheduleList = homeService.homeSchedule(department);
		return scheduleList;
	}
	@GetMapping("/notice")
	public List<BoardDTO> noticeList(HttpSession session) {
		List<BoardDTO> noticeList = homeService.notice();
		return noticeList;
	}
	@GetMapping("/suggestion")
	public List<BoardDTO> suggestionList(HttpSession session) {
		List<BoardDTO> suggestionList = homeService.suggestion();
		return suggestionList;
	}
	@GetMapping("/event")
	public List<BoardDTO> eventList(HttpSession session) {
		List<BoardDTO> eventList = homeService.event();
		return eventList;
	}
	@GetMapping("/event/eventview/{board_id}")
    public List<ReplyDTO> replyList(@PathVariable("board_id") int board_id) {
      List<ReplyDTO> result = null;
      result = boardService.selectReply(board_id);
      
      return result;
    }
	@PostMapping("/event/reply/{board_id}")
    public void insertReply(@PathVariable("board_id") int board_id, @RequestBody List<ReplyDTO> replyData) {
      int row = 0;
	       
//	      replyDTO.setWriter_id(((EmployeesDTO)session.getAttribute("login")).getEmployee_idx());
      
      for(ReplyDTO replyDTO : replyData) {
         System.out.println("board_id : " + replyDTO.getBoard_id());
         System.out.println("name : " + replyDTO.getEmployee_name());
         System.out.println("profile : " + replyDTO.getProfile_fic());
         System.out.println("content : " + replyDTO.getReply_content());
         System.out.println("writer : " + replyDTO.getWriter_id());
         row = boardService.insertReply(replyDTO);
      }
      System.out.println(row + "행이 추가 되었습니다");
   }
	/* ========================== 비공개 대상 ajax 데이터 받아오기 ===================*/
   @PostMapping("/suggestion/insert/receiver")
      public String insertReceiver(@RequestBody List<SendReceiverDTO> senderReceiver, HttpSession session) {
      SendReceiverDTO srdto = new SendReceiverDTO();
      int employee_idx = ((EmployeesDTO)session.getAttribute("login")).getEmployee_idx();
      
      srdto.setSender(employee_idx);
      ArrayList<String> receiverName = new ArrayList<>();
      ArrayList<String> receiverIdx = new ArrayList<>();
      ArrayList<String> receiveruserID = new ArrayList<>();
      for(SendReceiverDTO dto : senderReceiver) {
         System.out.println(dto.getSenderReceiver());
         System.out.println(dto.getReceiver_idx());
         System.out.println(dto.getEmployee_userid());
         receiveruserID.add(dto.getEmployee_userid());
         receiverName.add(dto.getSenderReceiver());
         receiverIdx.add(String.valueOf(dto.getReceiver_idx()));
      }
      for(int i = 0; i < senderReceiver.size(); i++) {
         System.out.println(receiverIdx.get(i));
         System.out.println(receiverName.get(i));
      }
      
      srdto.setReceiveruserID(receiveruserID);
      srdto.setEmployee_useridList(String.join(",", receiveruserID));
      System.out.println("선택 대상 ID(S) : " + srdto.getEmployee_useridList());
      srdto.setReceiverName(receiverName);
      srdto.setReceiverList(String.join(",", receiverName));
      System.out.println("선택 대상 리스트(S) : " + srdto.getReceiverList());
      srdto.setReceiverIdx(receiverIdx);
      srdto.setReceiverIdxList(String.join(",", receiverIdx));
      System.out.println("선택 대상 IDX(S) : " + srdto.getReceiverIdxList());
      
      int row = sendReceiverService.insertReceiver(srdto);
      System.out.println(row + "행이 추가 되었습니다");
      return "redirect:/board/view";
   }

	
}
