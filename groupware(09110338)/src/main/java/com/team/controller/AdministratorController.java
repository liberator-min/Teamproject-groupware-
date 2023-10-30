package com.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.model.ApprovalDTO;
import com.team.model.DepartmentDTO;
import com.team.model.EmployeesDTO;
import com.team.model.JobDTO;
import com.team.service.AdministratorService;

@Controller
@RequestMapping("/administrator")
public class AdministratorController {
	@Autowired private AdministratorService administratorService;

	@GetMapping("/admin_main")
	public void main() {}
	
	@GetMapping("/member_list")
	public ModelAndView memberList() {
		ModelAndView mav = new ModelAndView();
		List<EmployeesDTO> list = administratorService.selectAllMember();
		mav.addObject("memberList", list);
		return mav;
	}
	
	@GetMapping("/member_insert")
	public ModelAndView memberInsert() {
		ModelAndView mav = new ModelAndView();
		List<JobDTO> jobList = administratorService.selectAllJob();
		List<DepartmentDTO> departmentList = administratorService.selectAllDepartment();
		mav.addObject("jobList", jobList);
		mav.addObject("departmentList", departmentList);
		return mav;
	}
	
	@PostMapping("/member_insert")
	public String memberInsert(EmployeesDTO dto) {
		int row = administratorService.insertMember(dto);
		System.out.println(row + "행이 추가되었습니다.");
		return "redirect:/administrator/member_list";
	}
	
	@GetMapping("/member_update/{employee_idx}")
	public ModelAndView memberUpdate(@PathVariable("employee_idx") int idx) {
		ModelAndView mav = new ModelAndView("/administrator/member_update");
		EmployeesDTO dto = administratorService.selectOneMember(idx);
		List<JobDTO> jobList = administratorService.selectAllJob();
		List<DepartmentDTO> departmentList = administratorService.selectAllDepartment();
		mav.addObject("dto", dto);
		mav.addObject("jobList", jobList);
		mav.addObject("departmentList", departmentList);
		return mav;
	}
	
	@PostMapping("/member_update/{employee_idx}")
	public String memberUpdate(EmployeesDTO dto) {
		int row = administratorService.updateMember(dto);
		System.out.println(row + "행이 수정되었습니다.");
		return "redirect:/administrator/member_list";
	}
	
	@GetMapping("/member_delete/{employee_idx}")
	public String memberDelete(@PathVariable("employee_idx") int idx) {
		int row = administratorService.deleteMember(idx);
		System.out.println(row + "행이 삭제되었습니다.");
		return "redirect:/administrator/member_list";
	}
	
	@GetMapping("/approval_log")
	public void approvalLog() {}
	
}
