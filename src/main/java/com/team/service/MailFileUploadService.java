package com.team.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.team.model.MailDTO;
import com.team.repository.MailFileUploadDAO;

@Service
public class MailFileUploadService {
	 public MailFileUploadService() {
	      if(dir.exists() == false) {
	         dir.mkdirs();
	      }
	   }
	
	@Autowired private MailFileUploadDAO dao;
	private File dir= new File("/home/ec2-user/MailFile");
	
	// 파일을 전달받으면 새로운 이름을 문자열로 반환하는 함수
	   private String generateNewFileName(MultipartFile f) {
	      String fileName = UUID.randomUUID().toString().replace("-", "");
//	      String contentType = f.getContentType();
	      String ori = f.getOriginalFilename();
	      System.out.println("ori: " + ori);
	      System.out.println("fkldjal: " + fileName);
	      fileName += ori;
//	      "." + contentType.substring(contentType.indexOf("/") + 1)
	      return fileName;
	   }
	
	@Transactional
	public int mailInsert(MailDTO dto) {
   List<MultipartFile> uploadList = dto.getMailupload();
   ArrayList<String> fileNameList = new ArrayList<>();
   for(MultipartFile f : uploadList) {
     
      if(f.getOriginalFilename().equals("mailfile")) {
         File test = new File(dir, null);
         
         fileNameList.add(test.getName());
         try {
            f.transferTo(test);
         } catch(Exception e) {
            e.printStackTrace();
         }
      }
      else {
         File dest = new File(dir,generateNewFileName(f));
      
         fileNameList.add(dest.getName());
         try {
            f.transferTo(dest);
         } catch(Exception e) {
            e.printStackTrace();
         }
      }
   }
   int row = 0;
   
   row += dao.insertMail(dto);
   int fk = dao.MaxIdxFromMailUpload();
   
   HashMap<String, Object> param = new HashMap<>();
   param.put("mailupload", fk);
   param.put("list", fileNameList);
   
   dao.insertMailFile(param);
   
   return row;
}
public  int senderMailInsert(MailDTO dto) {
		
		List<MultipartFile> uploadList = dto.getMailupload();
		   ArrayList<String> fileNameList = new ArrayList<>();
		   for(MultipartFile f : uploadList) {
		     
		      if(f.getOriginalFilename().equals("mailfile")) {
		         File test = new File(dir, null);
		         
		         fileNameList.add(test.getName());
		         try {
		            f.transferTo(test);
		         } catch(Exception e) {
		            e.printStackTrace();
		         }
		      }
		      else {
		         File dest = new File(dir, generateNewFileName(f));
		      
		         fileNameList.add(dest.getName());
		         try {
		            f.transferTo(dest);
		         } catch(Exception e) {
		            e.printStackTrace();
		         }
		      }
		   }
		   int row = 0;
		  
		   
		   row += dao.insertSenderMail(dto);
		   int fk = dao.MaxIdxFromMailSenderUpload();
		   
		   HashMap<String, Object> param = new HashMap<>();
		   param.put("mailupload", fk);
		   param.put("list", fileNameList);
		   
		   dao.insertMailSenderFile(param);
		   
		   return row;
	
	}
	
	public List<MailDTO> receiveListSelectMail(int idx) {
		List<MailDTO> selectList = dao.receiveListSelectMail(idx);
		
		return selectList;
	}

	public List<MailDTO> sendListSelectMail(int idx) {
		List<MailDTO> selectList = dao.sendListSelectMail(idx);
	
		return  selectList;
	}

	public List<MailDTO> deleteListSelectMail(int idx) {
		List<MailDTO> selectList = dao.deleteListSelectMail(idx);
		
		return selectList;
	}

}
