	package com.team.service;


import java.io.File;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.model.EmployeesDTO;
import com.team.model.MailDTO;
import com.team.model.MailPagingDTO;
import com.team.repository.MailDAO;

@Service
public class MailService {
	
	@Autowired private MailDAO dao;

	

	public List<MailDTO> selectAllRecieveList(MailPagingDTO pagingdto) {

		return dao.selectAllRecieveList(pagingdto);
	}


	public List<MailDTO> selectAllSenderList(MailPagingDTO pagingdto) {
		
		return dao.selectAllSenderList(pagingdto);
	}
	public List<MailDTO> selectAllDeleteList(MailPagingDTO pagingdto) {
		
		return dao.selectAllDeleteList(pagingdto);
	}

	
	
	public int receiveMailNoReadCount(String mail) {
		
		return dao.receiveMailNoReadCount(mail);
	}
	public int deleteMailNoReadCount(String mail) {
		
		return dao.deleteMailNoReadCount(mail);
	}
	
	public int receivePageCount(MailPagingDTO searchdto) {
		
		return dao.receivePageCount(searchdto);
	}
	
	public int senderPageCount(MailPagingDTO searchdto) {
		
		return dao.senderPageCount(searchdto);
	}
	public int deletePageCount(MailPagingDTO searchdto) {
		
		return dao.deletePageCount(searchdto);
	}

	
	public List<EmployeesDTO> selectAll() {
		
		return dao.selectAll();
	}

	public MailDTO sendListSelectOne(int idx) {
		
		return dao.sendListSelectOne(idx);
	}
	public int mailDelete(String string){
		
		return dao.mailDelete(string);
		
		
	}


	public MailDTO receiveListSelectOne(int idx)  {
		
		return dao.receiveListSelectOne(idx);
	}

	public MailDTO deleteListSelectOne(int idx) {
		
		return dao.deleteListSelectOne(idx);
	}

	
	
	public int mailFilePath(String string) {
		
		return dao.mailFilePath(string);
	}

	public int deleteMailFilePath(String string) {
		
		return dao.deleteMailFilePath(string);
	}

	public int senderMailFilePath(String string) {
		
		return dao.senderMailFilePath(string);
	}

	

	public int read(int idx) {
		return dao.read(idx);
	}
	public int senderMailFileDelete(String string) {
		int idx = Integer.parseInt(string);
		System.out.println(idx);
		MailDTO dto = dao.sendListSelectOne(idx);
		if(dto.getMail_filePath() != null && dto.getMail_filePath() != "") {
			String filename =  dto.getMail_filePath();
	
			
			String[] arr = filename.split(",");
			System.out.println(arr);
			
			for(int i = 0; i< arr.length; i++) {
			File dir = new File("/home/ec2-user/MailFile/"+arr[i]);
			System.out.println(arr[i]);
			if(dir.exists()) {
				dir.delete();
				System.out.println("삭제성공");
			}
			else {
				System.out.println("삭제실패");
		}
		}
		}
		
		return dao.senderMailFileDelete(string);
	}

	public int deleteMailFileDelete(String string) {
		int idx = Integer.parseInt(string);
		System.out.println(idx);
		MailDTO dto = dao.deleteListSelectOne(idx);
		if(dto.getMail_filePath() != null && dto.getMail_filePath() != "") {
			String filename =  dto.getMail_filePath();
	
			
			String[] arr = filename.split(",");
			System.out.println(arr);
			
			for(int i = 0; i< arr.length; i++) {
			File dir = new File("/home/ec2-user/MailFile/"+arr[i]);
			
			if(dir.exists()) {
				dir.delete();
				System.out.println("삭제성공");
			}
			else {
				System.out.println("삭제실패");
		}
		}
		}
		return dao.deleteMailFileDelete(string);
	}


	

	




	




	

	


	

}
