package com.team.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;


import com.team.model.BoardFileDTO;
import com.team.model.EmployeesDTO;
import com.team.model.MailDTO;
import com.team.service.FileUploadService;

@Controller
public class FileUploadController {

   @Autowired private FileUploadService fileUploadService;
   @PostMapping("/upload")
   public String upload(BoardFileDTO dto, HttpSession session) {
      String category = dto.getBoard_category();
      String returnValue = "";
      System.out.println("콘텐츠:" + dto.getBoard_content());
       int row = fileUploadService.insert(dto);
      System.out.println(row + "행이 추가 되었습니다");
      
      switch(category) {
      case "공지사항" :
         returnValue += "redirect:/board/notice/list";
         break;
      case "건의사항" :
         returnValue += "redirect:/board/suggestion/list";
         break;
      case "경조사" :
         returnValue += "redirect:/board/event/list";
         break;
      }
      return returnValue;
   }
   @PostMapping("/upload/update")
   public String update(BoardFileDTO dto, HttpSession session) {
      int row = fileUploadService.update(dto);
      return "redirect:/board/notice/list";
   }
   @PostMapping("/upload/update/event")
   public String updateEvent(BoardFileDTO dto, HttpSession session) {
      int row = fileUploadService.updateEvent(dto);
      return "redirect:/board/event/list";
   }
   
   
}