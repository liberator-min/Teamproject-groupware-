package com.team.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.team.model.ChatDTO;

@Repository
public interface ChatDAO {
   int insertChat(ChatDTO chat);

   ArrayList<ChatDTO> getRoomChat(String roomName);
}
