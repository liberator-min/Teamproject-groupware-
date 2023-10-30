package com.team.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.model.DepartmentDTO;
import com.team.model.EmployeesDTO;
import com.team.model.MailDTO;
import com.team.service.HomeService;
import com.team.service.MailService;

@Controller
public class HomeController {

	@Autowired private HomeService homeService;

	@GetMapping("/")
	public String home(HttpSession session ,Model model) {
		EmployeesDTO login = (EmployeesDTO) session.getAttribute("login");
		
		return login == null ? "/login" : "/home";
	}

	@PostMapping("/")
	public String login (EmployeesDTO dto, HttpSession session) {
		EmployeesDTO login = homeService.selectOne(dto);
		if(login != null) {
			int row = homeService.updateLoginState(login);
		}
		session.setAttribute("login", login);
		
		return login == null ? "/login" : "/home";
	}
	@GetMapping("login")
	public void logina() {
		
	}

	
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		EmployeesDTO login = (EmployeesDTO)session.getAttribute("login");
		if(login != null) {
			int row = homeService.updateLoginState(login);
		}
		session.invalidate();
		return "/login";
	}
	
	@GetMapping("/tree")
	public ModelAndView tree() {
		ModelAndView mav = new ModelAndView();
		List<EmployeesDTO> treeList = homeService.selectTree();
		mav.addObject("treeList", treeList);
		return mav;
	}
	   @GetMapping("/tree_select/{department}")
	   public ModelAndView update_select(@PathVariable("department") String department) {
	      ModelAndView mav = new ModelAndView("/tree_select");
	      List<EmployeesDTO> tree_depart = homeService.selectDepart(department);
	      List<DepartmentDTO> depart_list = homeService.depart_list();
	      mav.addObject("tree_depart", tree_depart);
	      mav.addObject("department", department);
	      mav.addObject("depart_list", depart_list);
	      return mav;
	   }
	   
	
	@GetMapping("/contact")
	public void contact() {}
	
	@GetMapping("/mypage")
	public void mypage() {}
	
	@GetMapping("/resetPassword")
	public void resetPassword() {}
	
	@PostMapping("/resetPassword")
	public String resetPassword(EmployeesDTO dto) throws IOException {
		int row = homeService.resetPassword(dto);
		System.out.println(row != 0 ? "메일 발송 성공" : "실패 메일 발송");
		return "redirect:/";
	}
	
	@PostMapping("/updateMypage")
	public String mypage(EmployeesDTO dto) {
		int row = 0;
		row = homeService.updateEmployees(dto);
		System.out.println(row + "행이 수정되었습니다.");
		return "redirect:/mypage";
	}
	
	@PostMapping("/updateProfileImg")
	public String updateProfileImg(EmployeesDTO dto) {
		int row = 0;
		row = homeService.updateProfileImg(dto);
		System.out.println(row + "행이 수정되었습니다..");
		return "redirect:/mypage";
	}
	
	@GetMapping("/password_update")
	public void updatePassword() {}
	
	@PostMapping("/password_update")
	public String userPwUpdate(EmployeesDTO dto, HttpSession session) {
		System.out.println(dto.getEmployee_idx());
		System.out.println(dto.getEmployee_userpw());
		int row = homeService.updatePw(dto, session);
		System.out.println(row + "행이 수정되었습니다.");
		return "redirect:/";
	}
	
	@GetMapping("/company_Introduction")
	public void CompanyIntroduction() {}
}
