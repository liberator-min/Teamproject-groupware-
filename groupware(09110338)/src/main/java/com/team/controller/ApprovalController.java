package com.team.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.model.ApprovalDTO;
import com.team.model.EmployeesDTO;
import com.team.service.ApprovalService;

@Controller
@RequestMapping("/approval")
public class ApprovalController {

   @Autowired private ApprovalService approvalService;
   
   @GetMapping("/request_list")
   public ModelAndView list(HttpSession session) {
      ModelAndView mav = new ModelAndView();
      String userid = ((EmployeesDTO) session.getAttribute("login")).getEmployee_userid();
      List<ApprovalDTO> list = approvalService.selectReceiver(userid);
      EmployeesDTO login_user = approvalService.writer(userid);
      mav.addObject("list", list);
      mav.addObject("login_user", login_user);
      return mav;
   }
   
   
   @GetMapping("/vacation_request")
   public ModelAndView vacation_request(HttpSession session) {
      String userid = ((EmployeesDTO) session.getAttribute("login")).getEmployee_userid();
      EmployeesDTO boss = approvalService.selectBoss(userid);
      EmployeesDTO user = approvalService.selectOne(userid);
      ModelAndView mav = new ModelAndView();
      mav.addObject("boss", boss);
      mav.addObject("user", user);
      return mav;
   }
   
   
   @ResponseBody
   @PostMapping("/vacation_request")
   public int vacation_request(@RequestBody ApprovalDTO dto) {
      int result = approvalService.insert(dto);
      return result;
   }
   
   
   @GetMapping("/pay_request")
   public ModelAndView pay_request(HttpSession session) {
      String userid = ((EmployeesDTO) session.getAttribute("login")).getEmployee_userid();
      EmployeesDTO boss = approvalService.selectBoss(userid);
      EmployeesDTO user = approvalService.selectOne(userid);
      ModelAndView mav = new ModelAndView();
      mav.addObject("boss", boss);
      mav.addObject("user", user);
      return mav;
   }
   
   @ResponseBody
   @PostMapping("/pay_request")
   public int pay_request(@ModelAttribute  ApprovalDTO dto) {
      int result = 0;
      result = approvalService.insertFile(dto);
      return result;
   }
   
   
   @GetMapping("/business_request")
   public ModelAndView business_request(HttpSession session) {
      String userid = ((EmployeesDTO) session.getAttribute("login")).getEmployee_userid();
      EmployeesDTO boss = approvalService.selectBoss(userid);
      EmployeesDTO user = approvalService.selectOne(userid);
      List<EmployeesDTO> bossesList = approvalService.selectBosses();
      ModelAndView mav = new ModelAndView();
      mav.addObject("boss", boss);
      mav.addObject("user", user);
      mav.addObject("bossesList", bossesList);
      return mav;
   }
   
   @ResponseBody // 결과값만 받겠다.
   @PostMapping("/business_request")
   public int business_request(@ModelAttribute ApprovalDTO dto) {
      int result = 0;
      result = approvalService.insertFile(dto);
      return result;
   }
   
   @GetMapping("/write")
   public void write() {}
   
   @GetMapping("/standby_list")
   public ModelAndView standby_list(HttpSession session) {
      ModelAndView mav = new ModelAndView();
      String userid = ((EmployeesDTO) session.getAttribute("login")).getEmployee_userid();
      List<ApprovalDTO> wait_list = approvalService.selectWait(userid);
      List<ApprovalDTO> all_list = approvalService.selectAll(userid);
      List<ApprovalDTO> boss_list = approvalService.bossSelect(userid);
      mav.addObject("wait_list", wait_list);
      mav.addObject("all_list", all_list);
      mav.addObject("boss_list", boss_list);
      return mav;
   }
   
   @GetMapping("/update/{approval_idx}")
   public ModelAndView root_select(@PathVariable("approval_idx") int idx) {
      ModelAndView mav = new ModelAndView("/approval/update");
      ApprovalDTO dto = approvalService.selectRoot(idx);
      mav.addObject("dto", dto);
      return mav;
   }
   
   @PostMapping("/update/{approval_idx}")
   public String root_select(ApprovalDTO dto) {
      int result = approvalService.update(dto);
      System.out.println(result);
      System.out.println(dto.getIsapprove());
      return "redirect:/approval/standby_list";
   }

   @GetMapping("/selectOne/{approval_idx}")
   public ModelAndView selectOne(@PathVariable("approval_idx") int idx) {
      ModelAndView mav = new ModelAndView("/approval/selectOne");
      ApprovalDTO dto = approvalService.selectRoot(idx);
      mav.addObject("dto", dto);
      return mav;
   }
}