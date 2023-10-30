package com.team.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team.model.BoardDTO;
import com.team.model.EmployeesDTO;
import com.team.model.PagingDTO;
import com.team.model.ReplyDTO;
import com.team.model.SendReceiverDTO;
import com.team.repository.BoardDAO;

@Service
public class BoardService {
   
   @Autowired private BoardDAO boardDAO;
   @Autowired private FileUploadService fileUploadService;
   @Autowired private SendReceiverService sendReceiverService;
   


   public List<BoardDTO> selectAll(PagingDTO paging) {

      return boardDAO.selectAll(paging);
   }

   public List<BoardDTO> selectNotice(PagingDTO paging) {
      List<BoardDTO> pagingList = boardDAO.selectNotice(paging);
      for(int i = 0; i < pagingList.size(); i++) {
         pagingList.get(i).setPaging(paging);
      }
      return pagingList;
   }

   public List<BoardDTO> selectSuggestion(PagingDTO paging) {
      List<BoardDTO> pagingList = boardDAO.selectSuggestion(paging);
      for(int i = 0; i < pagingList.size(); i++) {
         pagingList.get(i).setPaging(paging);
      }
      
      return pagingList;
   }

   public List<BoardDTO> selectClub(PagingDTO paging) {
      List<BoardDTO> pagingList = boardDAO.selectClub(paging);
      for(int i = 0; i < pagingList.size(); i++) {
         pagingList.get(i).setPaging(paging);
      }
      return pagingList;
   }

   public List<BoardDTO> selectEvent(PagingDTO paging) {
      List<BoardDTO> pagingList = boardDAO.selectEvent(paging);
      for(int i = 0; i < pagingList.size(); i++) {
         pagingList.get(i).setPaging(paging);
      }
      return pagingList;
   }

   public BoardDTO selectOne(int board_idx) {
   
      return boardDAO.selectOne(board_idx);
   }

   public List<EmployeesDTO> selectHumanList() {
      
      return boardDAO.selectHumanList();
   }

   public List<ReplyDTO> selectReply(int board_id) {
      
      return boardDAO.selectReply(board_id);
   }

   public int insertReply(ReplyDTO replyDTO) {

      return boardDAO.insertReply(replyDTO);
   }

   public BoardDTO selectAddress(int board_idx) {
      
      return boardDAO.selectAddress(board_idx);
   }

   public int noticeCount() {
      
      return boardDAO.noticeCount();
   }
   public int noticeSearchCount(PagingDTO sessionSearch) {
      
      return boardDAO.noticeSearchCount(sessionSearch);
   }
   
   public int suggestionCount() {
      
      return boardDAO.suggestionCount();
   }
   public int eventCount() {
      
      return boardDAO.eventCount();
   }

   public int selectCount(PagingDTO sessionSearch) {
      
      return boardDAO.selectCount(sessionSearch);
   }

   public int suggestionSearchCount(PagingDTO sessionSearch) {
      
      return boardDAO.suggestionSearchCount(sessionSearch);
   }

   public int eventSearchCount(PagingDTO sessionSearch) {

      return boardDAO.eventSearchCount(sessionSearch);
   }

   public SendReceiverDTO selectSendReceiver(int sender) {

      return boardDAO.selectSendReceiver(sender);
   }
   @Transactional
   public int noticedelete(int board_idx) {
	  int row1 = fileUploadService.fileDelete(board_idx); 
      int row2 = fileUploadService.delete(board_idx);
      int row = boardDAO.noticedelete(board_idx);
      
    return row;
   }
   @Transactional
   public int eventdelete(int board_idx) {
	int row1 = fileUploadService.fileDelete(board_idx);   
	int row2 = fileUploadService.deleteEvent(board_idx);
	int row3 = boardDAO.deleteAddress(board_idx);
	int row = boardDAO.eventdelete(board_idx);
	
	return row;
}
   public int clubSearchCount(PagingDTO sessionSearch) {
	      
	      return boardDAO.clubSearchCount(sessionSearch);
   }

   public BoardDTO selectOneClub(int board_idx) {
	
	return boardDAO.selectOneClub(board_idx);
}

   public int clubInsert(BoardDTO dto) {

	return boardDAO.clubInsert(dto);
}

   public int clubUpdate(BoardDTO dto) {

	return boardDAO.clubUpdate(dto);
}

   public int clubDelete(int club_idx) {

	return boardDAO.clubDelete(club_idx);
}

	public int suggestiondelete(int board_idx) {
	
		 int row1 = fileUploadService.fileDelete(board_idx); 
	     int row2 = fileUploadService.delete(board_idx);
	     int row3 = sendReceiverService.deleteSendReceiver(board_idx);
	     int row = boardDAO.suggestiondelete(board_idx);
	     
	   return row;
	}

}