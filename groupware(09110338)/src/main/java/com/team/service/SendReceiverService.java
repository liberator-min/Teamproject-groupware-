package com.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.model.SendReceiverDTO;
import com.team.repository.SendReceiverDAO;

@Service
public class SendReceiverService {
   
   @Autowired private SendReceiverDAO sendReceiverDAO;

   public int insertReceiver(SendReceiverDTO srdto) {
      
      int row = sendReceiverDAO.insertReceiver(srdto);
      
      return row;
   }

   public List<SendReceiverDTO> selectSendReceiver() {

      return sendReceiverDAO.selectSendReceiver();
   }

public int deleteSendReceiver(int board_idx) {
	return sendReceiverDAO.deleteSendReceiver(board_idx);
}

   

   
}