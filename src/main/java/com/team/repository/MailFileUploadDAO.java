package com.team.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.team.model.MailDTO;

@Repository
public interface MailFileUploadDAO {
	
		void insertMailFile(HashMap<String, Object> param);

	   int MaxIdxFromMailUpload();

	   int insertMail(MailDTO dto);

	   int insertSenderMail(MailDTO dto);

	   int MaxIdxFromMailSenderUpload();

	   void insertMailSenderFile(HashMap<String, Object> param);
	   
	   List<MailDTO> receiveListSelectMail(int idx);

	   List<MailDTO> sendListSelectMail(int idx);

	   List<MailDTO> deleteListSelectMail(int idx);
	   

}
