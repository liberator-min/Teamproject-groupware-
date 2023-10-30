package com.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.team.model.ApprovalDTO;
import com.team.service.AdministratorService;

@RestController
public class AdministratorAJaxController {

	@Autowired AdministratorService administratorService;
	
	// 관리자 페이지 회원 insert시 ID 중복 체크 
	@RequestMapping("/dupCheck/{employee_userid}")
	public int dupCheck(@PathVariable("employee_userid") String employeeUserid) {
		int row = administratorService.dupCheck(employeeUserid);
		return row;
	}
	
	@GetMapping("/approvalLog")
	public List<ApprovalDTO> list() {
		List<ApprovalDTO> list = administratorService.selectAllApproval();
		return list;
	}
	
	@GetMapping("/approvalLog/{approval_idx}")
	public ApprovalDTO selectOneApproval(@PathVariable("approval_idx") int idx) {
		ApprovalDTO dto = administratorService.selectOneApproval(idx);
		return dto;
	}
	
}
