package com.team.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.model.ChatDTO;
import com.team.model.EmployeesDTO;
import com.team.service.ChatService;
import com.team.service.HomeService;

@Controller
public class ChatController {

   @Autowired HomeService homeService;
   @Autowired ChatService chatService;
    
    @ResponseBody
   @RequestMapping("/getChatList")
   public List<EmployeesDTO> getChatList(@RequestParam(value="searchTerm", defaultValue="") String search) {
      ArrayList<EmployeesDTO> chatList = new ArrayList<EmployeesDTO>();
      chatList = homeService.chat_selectAll(search);
      return chatList;
   }
    
    @ResponseBody
    @RequestMapping("/getRoomChat")
    public List<ChatDTO> getRoomChat(@RequestParam(value="roomName") String roomName){
       ArrayList<ChatDTO> list = chatService.getRoomChat(roomName);
       return list;
    }
    

    @MessageMapping("/hello/{roomName}")
    @SendTo("/queue/chat/{roomName}")
    public ChatDTO broadcasting(ChatDTO chat) {
        chat.setChatWriteDate(new Date());
        System.out.println(chat.getChatcontent());
        int result = chatService.insertChat(chat);
        return chat;
    }
    
}