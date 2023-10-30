package com.team.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.team.model.SendReceiverDTO;

@Repository
public interface SendReceiverDAO {

   int insertReceiver(SendReceiverDTO srdto);

   List<SendReceiverDTO> selectSendReceiver();

   int deleteSendReceiver(int board_idx);

}