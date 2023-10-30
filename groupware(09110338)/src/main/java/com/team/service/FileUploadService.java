package com.team.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.team.model.BoardFileDTO;
import com.team.model.MailDTO;
import com.team.repository.FileUploadDAO;

@Service
public class FileUploadService {

   @Autowired private FileUploadDAO fileUploadDAO;
   
   private File dir = new File("c:/home/ec2-user/BoardFile");
   
 
   public FileUploadService() {
      if(dir.exists() == false) {
         dir.mkdirs();
      }
   }
   public List<BoardFileDTO> select(int board_idx) {
	      
	      return fileUploadDAO.select(board_idx);
	   }
	   
	// 파일을 전달받으면 새로운 이름을 문자열로 반환하는 함수
	   private String generateNewFileName(MultipartFile f) {
	      String fileName = UUID.randomUUID().toString().replace("-", "");
	      String contentType = f.getContentType();
	      fileName += "." + contentType.substring(contentType.indexOf("/") + 1);
	      return fileName;
	   }
	   
	   @Transactional
	   public int insert(BoardFileDTO dto) {
	      List<MultipartFile> uploadList = dto.getUpload();
	      ArrayList<String> fileNameList = new ArrayList<>();
	      for(MultipartFile f : uploadList) {
	         System.out.println(f.getOriginalFilename());
	         if(f.getOriginalFilename().equals("teamproject")) {
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
	      
	      System.out.println("employee" + dto.getEmployee_idx());
	      
	      String category = dto.getBoard_category();
	      
	      switch(category) {
	      
	      case "공지사항" :
	         row += fileUploadDAO.insertNotice(dto);
	         break;
	      case "건의사항" :
	         row += fileUploadDAO.insertSuggetion(dto);
	         break;
	      case "경조사" :
	         row += fileUploadDAO.insertEvent(dto);
	         break;
	      }
	      
	      int fk = fileUploadDAO.MaxIdxFromUpload();
	      
	      HashMap<String, Object> param = new HashMap<>();
	      param.put("upload", fk);
	      param.put("list", fileNameList);
	      
	      fileUploadDAO.insertFile(param);
	      
	      return row;
	   }
	   
	   @Transactional
	   public int update(BoardFileDTO dto) {
	      List<MultipartFile> updateList = dto.getUpload();
	      ArrayList<String> fileNameList = new ArrayList<>();
	      for(MultipartFile f : updateList) {
	            System.out.println(f.getOriginalFilename());
	            if(f.getOriginalFilename().equals("teamproject")) {
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
	         
	         int board_idx = Integer.parseInt(dto.getBoard_idx());
	         row += fileUploadDAO.update(dto);
	         
	         HashMap<String, Object> param = new HashMap<>();
	         param.put("list", fileNameList);
	         param.put("bdidx", board_idx);
	         fileUploadDAO.updateFile(param);
	      
	   return row;
	   }
	   public int updateEvent(BoardFileDTO dto) {
	      List<MultipartFile> updateList = dto.getUpload();
	      ArrayList<String> fileNameList = new ArrayList<>();
	      for(MultipartFile f : updateList) {
	         System.out.println(f.getOriginalFilename());
	         if(f.getOriginalFilename().equals("teamproject")) {
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
	      
	      int board_idx = Integer.parseInt(dto.getBoard_idx());
	      fileUploadDAO.deleteEventFile(board_idx);
	      row += fileUploadDAO.update(dto);
	      fileUploadDAO.updateAddress(dto);
	      
	         
	      HashMap<String, Object> param = new HashMap<>();
	      param.put("upload", board_idx);
	      param.put("list", fileNameList);
	      
	      fileUploadDAO.insertFile(param);
	      return row;
	   }
	   public int delete(int board_idx) {
		      return fileUploadDAO.delete(board_idx);
	   }
	   
	   public int deleteEvent(int board_idx) {
	      return fileUploadDAO.deleteEventFile(board_idx);
	   }
	   
	   public int fileDelete(int board_idx) {
			int row = 0;
			String bdto = fileUploadDAO.fileDelete(board_idx);
			System.out.println(bdto);
			if(bdto != null && !bdto.equals("")) {
				
				
				String[] arr = bdto.split(",");
				System.out.println("arr:" + Arrays.toString(arr));
				for (int i = 0; i < arr.length; i++) {
					File dir = new File("c:/home/ec2-user/BoardFile",arr[i]);
					
					System.out.println("Target File Path: " + dir.getAbsolutePath());
					
					if(dir.exists()) {
						boolean isDeleted = dir.delete();
						if(isDeleted) {							
							row = 1;
							System.out.println("삭제성공");
						}
						else {
							row = 0;
							System.out.println("삭제실패");
						}
					}
					else {
						
						System.out.println("해당 파일이 존재하지 않습니다" + dir.getAbsolutePath());
					}
				}
			}
			return row;
		}

}