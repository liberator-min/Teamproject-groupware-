package com.team.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.model.ChatDTO;
import com.team.repository.ChatDAO;

@Service
public class ChatService {
   
   @Autowired ChatDAO dao;

   public int insertChat(ChatDTO chat) {
      return dao.insertChat(chat);
   }


   public ArrayList<ChatDTO> getRoomChat(String roomName) {
      return dao.getRoomChat(roomName);
   }


}