package com.team.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.team.model.BoardDTO;
import com.team.model.EmployeesDTO;
import com.team.model.PagingDTO;
import com.team.model.ReplyDTO;
import com.team.model.SendReceiverDTO;

@Repository
public interface BoardDAO {

   List<BoardDTO> selectAll(PagingDTO paging);

   List<BoardDTO> selectNotice(PagingDTO paging);

   List<BoardDTO> selectSuggestion(PagingDTO paging);

   List<BoardDTO> selectClub(PagingDTO paging);

   List<BoardDTO> selectEvent(PagingDTO paging);

   BoardDTO selectOne(int board_idx);

   List<EmployeesDTO> selectHumanList();

   List<ReplyDTO> selectReply(int board_id);

   int insertReply(ReplyDTO replyDTO);

   BoardDTO selectAddress(int board_idx);

   int noticeCount();
   
   int suggestionCount();
   
   int eventCount();

   int selectCount(PagingDTO sessionSearch);

   int noticeSearchCount(PagingDTO sessionSearch);

   int suggestionSearchCount(PagingDTO sessionSearch);
   
   int eventSearchCount(PagingDTO sessionSearch);

   SendReceiverDTO selectSendReceiver(int sender);

   List<BoardDTO> homeNotice();

   List<BoardDTO> homeSuggestion();

   List<BoardDTO> homeEvent();

   int noticedelete(int board_idx);

   int deleteAddress(int board_idx);

   int eventdelete(int board_idx);

   int clubSearchCount(PagingDTO sessionSearch);

   BoardDTO selectOneClub(int board_idx);

   int clubInsert(BoardDTO dto);

   int clubUpdate(BoardDTO dto);

   int clubDelete(int club_idx);

   int suggestiondelete(int board_idx);
}