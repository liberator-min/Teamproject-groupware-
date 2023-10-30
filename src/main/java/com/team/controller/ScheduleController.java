	package com.team.controller;


import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import com.team.model.EmployeesDTO;
import com.team.model.ScheduleDTO;
import com.team.service.ScheduleService;


@Controller
@RequestMapping("/schedule")
public class ScheduleController {

	@Autowired private  ScheduleService scheduleService;
	@GetMapping("/listall")
	public String select(Model model ,HttpSession session) {
		List<ScheduleDTO> scheduleList = new ArrayList<ScheduleDTO>();
		String name = "경영부";
		
		scheduleList = scheduleService.select(name);
		model.addAttribute("scheduleList",scheduleList);
		return "/schedule/listall";
	}
	@GetMapping("/list")
	public String selectAll( HttpSession session, Model model) {
		String department = ((EmployeesDTO)session.getAttribute("login")).getDepartment(); 
		System.out.println(department);
		 List<ScheduleDTO> scheduleList = new ArrayList<ScheduleDTO>();
		
		 scheduleList = scheduleService.selectAll(department);
		 model.addAttribute("scheduleList",scheduleList);
		return "/schedule/list" ;
	}
	@GetMapping("/insert")
	public String insertView() {
		return "/schedule/insert";
	}
	@PostMapping("/insert")
	public String insert(HttpServletRequest request) throws ParseException {
		ScheduleDTO dto = new ScheduleDTO();
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		Date sqlstart_date = Date.valueOf(start_date);
		Date sqlend_date = Date.valueOf(end_date);
		dto.setContent(request.getParameter("content"));
		dto.setDepartment(request.getParameter("department"));
		dto.setTitle(request.getParameter("title"));
		dto.setType(request.getParameter("type"));
		dto.setWriter(request.getParameter("writer"));
		dto.setStart_date(sqlstart_date);
		dto.setEnd_date(sqlend_date);
		int row = scheduleService.insert(dto);
		return "/schedule/list";
	}
	
	@GetMapping("/selectallone/{schedule_idx}")
	public ModelAndView selectallone(@PathVariable("schedule_idx") int idx  ) {
		ModelAndView mav = new ModelAndView("/schedule/selectallone");
		ScheduleDTO dto = scheduleService.selectOne(idx);
		mav.addObject("schedule",dto);
		return mav;
	}
	
	
	
	@GetMapping("/selectone/{schedule_idx}")
	public ModelAndView selectone(@PathVariable("schedule_idx") int idx  ) {
		ModelAndView mav = new ModelAndView("/schedule/selectone");
		ScheduleDTO dto = scheduleService.selectOne(idx);
		mav.addObject("schedule",dto);
		return mav;
	}
	
	@GetMapping("/update/{schedule_idx}")
	public ModelAndView updateView(@PathVariable("schedule_idx") int idx) {
		ModelAndView mav = new ModelAndView("/schedule/update");
		ScheduleDTO dto = scheduleService.selectOne(idx);
		mav.addObject("schedule",dto);
		return mav;
	}
	@PostMapping("/update/{schedule_idx}")
	public String update(@PathVariable("schedule_idx") int idx , HttpServletRequest request) {
		ScheduleDTO dto = new ScheduleDTO();
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		Date sqlstart_date = Date.valueOf(start_date);
		Date sqlend_date = Date.valueOf(end_date);
		dto.setContent(request.getParameter("content"));
		dto.setDepartment(request.getParameter("department"));
		dto.setTitle(request.getParameter("title"));
		dto.setType(request.getParameter("type"));
		dto.setWriter(request.getParameter("writer"));
		dto.setStart_date(sqlstart_date);
		dto.setEnd_date(sqlend_date);
		dto.setSchedule_idx(idx);
		
		int row = scheduleService.update(dto);
		return "/schedule/list";
		
	}
	@GetMapping("/delete")
	public String delete() {
		return "/schedule/delete";
	}
	@PostMapping("/delete")
	public String delete(HttpServletRequest request) {
		int idx = Integer.parseInt(request.getParameter("idx"));
		int row = scheduleService.delete(idx);
		return "/schedule/delete";
	}

}
	 
