package com.team.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.team.model.BoardFileDTO;
import com.team.model.MailDTO;

@Repository
public interface FileUploadDAO {

   List<BoardFileDTO> select(int board_idx);

   int insertNotice(BoardFileDTO dto);

   int MaxIdxFromUpload();

   void insertFile(HashMap<String, Object> param);

   int insertSuggetion(BoardFileDTO dto);

   int insertEvent(BoardFileDTO dto);
   
   int update(BoardFileDTO dto);
   
   void updateFile(HashMap<String, Object> param);
   
   int deleteEventFile(int board_idx);
   
   void updateAddress(BoardFileDTO dto);
   
   int delete(int board_idx);
   
   
   void insertMailFile(HashMap<String, Object> param);

   int MaxIdxFromMailUpload();

   int insertMail(MailDTO dto);

  

   int insertSenderMail(MailDTO dto);

   int MaxIdxFromMailSenderUpload();

   void insertMailSenderFile(HashMap<String, Object> param);
   
   List<MailDTO> receiveListSelectMail(int idx);

   List<MailDTO> sendListSelectMail(int idx);

   List<MailDTO> deleteListSelectMail(int idx);

   String fileDelete(int board_idx);

}

