package com.team.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import com.team.model.EmployeesDTO;
import com.team.model.MailDTO;
import com.team.model.MailPagingDTO;

import com.team.service.FileUploadService;
import com.team.service.MailFileUploadService;
import com.team.service.MailService;

@RequestMapping("/mail")
@Controller
public class MailController {

	@Autowired private MailService mailService;
	@Autowired private MailFileUploadService mailFileUploadService;

	 @GetMapping("/receiveList") 
	 public ModelAndView mailreceiveList(@RequestParam(value="page", defaultValue="1") int page,HttpServletRequest param,HttpSession session) { 
			 MailPagingDTO searchdto = new MailPagingDTO(); 
			 String mail = ((EmployeesDTO)session.getAttribute("login")).getMail();
			 int receiveNoCount = mailService.receiveMailNoReadCount(mail);
			 searchdto.setMail_search(param.getParameter("mail_search"));
			 searchdto.setMail_column(param.getParameter("mail_column")); 
			 int mailCount = mailService.receivePageCount(searchdto);
			 MailPagingDTO pagingdto = new MailPagingDTO(page,mailCount);
			 pagingdto.setMail(mail);
			 pagingdto.setMail_search(param.getParameter("mail_search"));
		     pagingdto.setMail_column(param.getParameter("mail_column"));
			 ModelAndView mav = new ModelAndView("/mail/receiveList"); 
			 List<MailDTO> list = mailService.selectAllRecieveList(pagingdto); 
			 mav.addObject("list",list); 
			 mav.addObject("mailpaging",pagingdto);
			 mav.addObject("receiveNoCount",receiveNoCount);
			 return mav;
	 
	  }
	 @PostMapping("/receiveList") 
	 public ModelAndView mailreceiveListaa(@RequestParam(value="page", defaultValue="1") int page,HttpServletRequest param,HttpSession session) { 
			 MailPagingDTO searchdto = new MailPagingDTO(); 
			 String mail = ((EmployeesDTO)session.getAttribute("login")).getMail();
			 searchdto.setMail_search(param.getParameter("mail_search"));
			 searchdto.setMail_column(param.getParameter("mail_column")); 
			 int mailCount = mailService.receivePageCount(searchdto);
			 MailPagingDTO pagingdto = new MailPagingDTO(page,mailCount);
			 pagingdto.setMail(mail);
			 pagingdto.setMail_search(param.getParameter("mail_search"));
		     pagingdto.setMail_column(param.getParameter("mail_column"));
			 ModelAndView mav = new ModelAndView("/mail/receiveList"); 
			 List<MailDTO> list = mailService.selectAllRecieveList(pagingdto); 
			 mav.addObject("list",list); 
			 mav.addObject("mailpaging",pagingdto);
			 return mav;
	 
	  }
	 @GetMapping("/sendList") 
	 public ModelAndView mailsendList(@RequestParam(value="page", defaultValue="1") int page,HttpServletRequest param,HttpSession session) { 
			 MailPagingDTO searchdto = new MailPagingDTO(); 
			 String mail = ((EmployeesDTO)session.getAttribute("login")).getMail();
			 searchdto.setMail_search(param.getParameter("mail_search"));
			 searchdto.setMail_column(param.getParameter("mail_column")); 
			 int mailCount = mailService.senderPageCount(searchdto);
			 MailPagingDTO pagingdto = new MailPagingDTO(page,mailCount);
			 pagingdto.setMail(mail);
			 pagingdto.setMail_search(param.getParameter("mail_search"));
		     pagingdto.setMail_column(param.getParameter("mail_column"));
			 ModelAndView mav = new ModelAndView("/mail/sendList"); 
			 List<MailDTO> list = mailService.selectAllSenderList(pagingdto); 
			 mav.addObject("list",list); 
			 mav.addObject("mailpaging",pagingdto);
			 return mav;
	 
	  }
	 
	 @PostMapping("/sendList") 
	 public ModelAndView mailsendListaa(@RequestParam(value="page", defaultValue="1") int page,HttpServletRequest param,HttpSession session) { 
			 MailPagingDTO searchdto = new MailPagingDTO(); 
			 String mail = ((EmployeesDTO)session.getAttribute("login")).getMail();
			 searchdto.setMail_search(param.getParameter("mail_search"));
			 searchdto.setMail_column(param.getParameter("mail_column")); 
			 int mailCount = mailService.senderPageCount(searchdto);
			 MailPagingDTO pagingdto = new MailPagingDTO(page,mailCount);
			 pagingdto.setMail(mail);
			 pagingdto.setMail_search(param.getParameter("mail_search"));
		     pagingdto.setMail_column(param.getParameter("mail_column"));
			 ModelAndView mav = new ModelAndView("/mail/sendList"); 
			 List<MailDTO> list = mailService.selectAllSenderList(pagingdto); 
			 mav.addObject("list",list); 
			 mav.addObject("mailpaging",pagingdto);
			 return mav;
	 
	  }
	 
	 @GetMapping("/deleteList") 
	 public ModelAndView maildeleteList(@RequestParam(value="page", defaultValue="1") int page,HttpServletRequest param,HttpSession session) { 
			 MailPagingDTO searchdto = new MailPagingDTO(); 
			 String mail = ((EmployeesDTO)session.getAttribute("login")).getMail();
			 int deleteCount = mailService.deleteMailNoReadCount(mail);
			 searchdto.setMail_search(param.getParameter("mail_search"));
			 searchdto.setMail_column(param.getParameter("mail_column")); 
			 int mailCount = mailService.deletePageCount(searchdto);
			 MailPagingDTO pagingdto = new MailPagingDTO(page,mailCount);
			 pagingdto.setMail(mail);
			 pagingdto.setMail_search(param.getParameter("mail_search"));
		     pagingdto.setMail_column(param.getParameter("mail_column"));
			 ModelAndView mav = new ModelAndView("/mail/deleteList"); 
			 List<MailDTO> list = mailService.selectAllDeleteList(pagingdto); 
			 mav.addObject("list",list); 
			 mav.addObject("mailpaging",pagingdto);
			 mav.addObject("deleteCount",deleteCount);
			 return mav;
	 
	  }
	 
	 @PostMapping("/deleteList") 
	 public ModelAndView maildeleteListaa(@RequestParam(value="page", defaultValue="1") int page,HttpServletRequest param,HttpSession session) { 
			 MailPagingDTO searchdto = new MailPagingDTO(); 
			 String mail = ((EmployeesDTO)session.getAttribute("login")).getMail();
			 searchdto.setMail_search(param.getParameter("mail_search"));
			 searchdto.setMail_column(param.getParameter("mail_column")); 
			 int mailCount = mailService.deletePageCount(searchdto);
			 MailPagingDTO pagingdto = new MailPagingDTO(page,mailCount);
			 pagingdto.setMail(mail);
			 pagingdto.setMail_search(param.getParameter("mail_search"));
		     pagingdto.setMail_column(param.getParameter("mail_column"));
			 ModelAndView mav = new ModelAndView("/mail/deleteList"); 
			 List<MailDTO> list = mailService.selectAllDeleteList(pagingdto); 
			 mav.addObject("list",list); 
			 mav.addObject("mailpaging",pagingdto);
			 return mav;
	 
	  }
	 

	
	@GetMapping("/insert")
	public ModelAndView emaillist() {
		ModelAndView mav = new ModelAndView();
		List<EmployeesDTO> list = mailService.selectAll();
		mav.addObject("list",list);
		return mav;
	}

	@GetMapping("/selectone/receiver/{mail_idx}") 
	public ModelAndView mailselelctone(@PathVariable("mail_idx") int idx) {
		ModelAndView mav = new ModelAndView("/mail/selectone/receiver");
		MailDTO mailOne = mailService.receiveListSelectOne(idx);
		System.out.println(mailOne.getMail_read());
		if(mailOne.getMail_read() == 0) {
		int row = mailService.read(idx);
		System.out.println(row+"행이 업데이트 되었습니다");
		}
		List<MailDTO> selectList = mailFileUploadService.receiveListSelectMail(idx);
		
	
		
		mav.addObject("dto",mailOne);
		mav.addObject("mailFilePath",selectList);
		return mav;
		
	}
	@GetMapping("/selectone/sender/{mail_idx}") 
	public ModelAndView sendMailSelelctOne(@PathVariable("mail_idx") int idx) {
		ModelAndView mav = new ModelAndView("/mail/selectone/sender");
		MailDTO mailOne = mailService.sendListSelectOne(idx);
		
		List<MailDTO> selectList = mailFileUploadService.sendListSelectMail(idx);
	
		
		mav.addObject("dto",mailOne);
		mav.addObject("mailFilePath",selectList);
		return mav;
		
	}
	@GetMapping("/selectone/delete/{mail_idx}") 
	public ModelAndView deleteMailSelelctOne(@PathVariable("mail_idx") int idx) {
		ModelAndView mav = new ModelAndView("/mail/selectone/delete");
		MailDTO mailOne = mailService.deleteListSelectOne(idx);
		
		List<MailDTO> selectList = mailFileUploadService.deleteListSelectMail(idx);
	
		
		mav.addObject("dto",mailOne);
		mav.addObject("mailFilePath",selectList);
		return mav;
		
	}
	@PostMapping("/delete")
	public String mailDelete(HttpServletRequest request) {
	
		String[] ajaxMsg = request.getParameterValues("valueArr");

		int size =  ajaxMsg.length;
		for(int i=0; i < size; i++) {
			System.out.println(ajaxMsg[i]);
			int row = mailService.mailDelete(ajaxMsg[i]);
			int row2 = mailService.mailFilePath(ajaxMsg[i]);
		}
		
		return "redirect:/mail/receiveList";
	}
	
	@PostMapping("/sendmail")
	public String mailSenderDelete(HttpServletRequest request) {
	
		String[] ajaxMsg = request.getParameterValues("valueArr");
		
		int size =  ajaxMsg.length;
		for(int i=0; i < size; i++) {
			System.out.println(ajaxMsg[i]);
			int row = mailService.senderMailFileDelete(ajaxMsg[i]);
			int row2 = mailService.senderMailFilePath(ajaxMsg[i]);
		}
		
		return "redirect:/mail/sendList";
	}
	
	@PostMapping("/deletemail")
	public String mailDeleteDelete(HttpServletRequest request) {
	
		String[] ajaxMsg = request.getParameterValues("valueArr");
		
		int size =  ajaxMsg.length;
		for(int i=0; i < size; i++) {
			System.out.println(ajaxMsg[i]);
			int row = mailService.deleteMailFileDelete(ajaxMsg[i]);
			int row2 = mailService.deleteMailFilePath(ajaxMsg[i]);
		}
		
		return "redirect:/mail/deleteList";
	}
	
}
