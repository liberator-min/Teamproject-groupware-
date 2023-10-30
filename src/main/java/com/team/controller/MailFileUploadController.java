package com.team.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.team.model.MailDTO;
import com.team.service.MailFileUploadService;

@Controller
public class MailFileUploadController {
	
	@Autowired MailFileUploadService mailFileUploadService;
	@PostMapping("/mail/upload")
	   public String mailupload(MailDTO dto ) {
		   
		   int row = mailFileUploadService.mailInsert(dto);
		   int row1 = mailFileUploadService.senderMailInsert(dto);
		   System.out.println(row + "행이 추가되었습니다");
		   System.out.println(row1 + "행이 추가되었습니다");
		   return "redirect:/mail/receiveList";
	   }
}
