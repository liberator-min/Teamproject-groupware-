package com.team.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.team.model.EmployeesDTO;
import com.team.model.MailDTO;
import com.team.model.MailPagingDTO;

@Repository
public interface MailDAO {


	List<MailDTO> selectAllRecieveList(MailPagingDTO pagingdto);

	List<MailDTO> selectAllSenderList(MailPagingDTO pagingdto);
	
	List<MailDTO> selectAllDeleteList(MailPagingDTO pagingdto);

	int receiveMailNoReadCount(String mail);
	
	int deleteMailNoReadCount(String mail);
	
	int receivePageCount(MailPagingDTO searchdto);
	
	int senderPageCount(MailPagingDTO searchdto);
	
	int deletePageCount(MailPagingDTO searchdto);
	
	List<EmployeesDTO> selectAll();
	
	MailDTO sendListSelectOne(int idx);

	MailDTO receiveListSelectOne(int idx);
	
	MailDTO deleteListSelectOne(int idx);

	int mailDelete(String string);

	int deleteMailFileDelete(String string);

	int senderMailFileDelete(String string);
	
	int mailFilePath(String string);

	int deleteMailFilePath(String string);
	
	int senderMailFilePath(String string);
	
	int read(int idx);

	

	

	

	

	

	

	

	

	



}
