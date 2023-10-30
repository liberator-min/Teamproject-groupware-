package com.team.service;

import java.io.File;
import java.io.IOException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import java.util.Scanner;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.team.component.HashComponent;
import com.team.component.MailComponent;
import com.team.model.ApprovalDTO;
import com.team.model.BoardDTO;
import com.team.model.DepartmentDTO;
import com.team.model.EmployeesDTO;
import com.team.model.ScheduleDTO;
import com.team.repository.ApprovalDAO;
import com.team.repository.BoardDAO;
import com.team.repository.HomeDAO;


@Service
public class HomeService {
	
	@Autowired private HomeDAO dao;
	@Autowired private ApprovalDAO adao;
	@Autowired private BoardDAO bdao;
	@Autowired private HashComponent hashComponent;
	
	@Autowired private MailComponent mailComponent;
	@Value("classpath:resetPassword.html")
	private Resource html;
	private SecureRandom random = new SecureRandom();
	
	
	@Transactional
	public int resetPassword(EmployeesDTO dto) throws IOException {
		// 비밀번호 업데이트
//		EmployeesDTO saltdto = selectSalt(dto);
		String salt = "";
		String saltCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&";
		StringBuilder saltsb = new StringBuilder(8);
		
        // 문자는 모든 문자(특수 문자, 문자, 숫자) 중에서 랜덤으로 선택
        for (int i = 0; i < 8; i++) {
        	saltsb.append(saltCharacters.charAt(random.nextInt(saltCharacters.length())));
        }
		
		salt += saltsb.toString();
//		System.out.println("reset된 솔트 값 : " + salt);
		dto.setSalt(salt);
//		System.out.println("가져온 reset 솔트 값 : " + dto.getSalt());
		
		String userpw = "";
		
		String specialChar = "!@$%&";
		String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		StringBuilder userpwsb = new StringBuilder(10);
		
        // 특수 문자를 리스트에 추가
        List<Character> specialCharList = new ArrayList<>();
        for (char c : specialChar.toCharArray()) {
        	specialCharList.add(c);
        }
        Collections.shuffle(specialCharList);
        List<Character> chosenSpecialCharList = specialCharList.subList(0, 3);

        
        List<Character> charList = new ArrayList<>();
        for (int i = 0; i < 7; i++) {
            char randomChar = characters.charAt(random.nextInt(characters.length()));
            charList.add(randomChar);
        }

        List<Character> finalCharacters = new ArrayList<>();
        finalCharacters.addAll(chosenSpecialCharList);
        finalCharacters.addAll(charList);
        Collections.shuffle(finalCharacters);
        
        // 문자열로 변환
        for (Character character : finalCharacters) {
        	userpwsb.append(character);
        }
        
		userpw += userpwsb.toString();
//		System.out.println("해시처리 전 userpw : " + userpw);
//		System.out.println("해시처리 전 salt : " + salt);
//		System.out.println("userpw + salt : " + userpw + salt);
		String hash = hashComponent.getHash(userpw + salt);
//		System.out.println("해시처리 한 번한 값 : " + hash);
		for(int i = 0; i < 10000; i++) {
			hash = hashComponent.getHash(hash);
		}
		System.out.println("해시처리 10000번한 값 : " + hash);
		dto.setEmployee_userpw(hash);
		int row = dao.resetPassword(dto);
		
		// 변경이 성공적으로 수행되었다면, 이메일 전송
		if(row != 0) {
			String content = "";
			Scanner sc = new Scanner(html.getFile());
			while(sc.hasNextLine()) {
				content += sc.nextLine();
			}
			sc.close();
			content = String.format(content, userpw);
			mailComponent.sendMail(dto.getRecovery_email(), content);
		}
		return row;
	}
	
	public EmployeesDTO selectOne(EmployeesDTO dto) {
		EmployeesDTO salt = selectSalt(dto);
		String saltedHash = hashComponent.getHash((dto.getEmployee_userpw() + salt.getSalt()));
		for(int i = 0; i < 10000; i++) {
			saltedHash = hashComponent.getHash(saltedHash);
		}
		dto.setEmployee_userpw(saltedHash);
		EmployeesDTO login = dao.selectOne(dto);
		return login;
	}
	public List<EmployeesDTO> selectTree() {
		return dao.selectTree();
	}

	public List<DepartmentDTO> selectAllDepartment() {
		return dao.selectAllDepartment();
	}
	public List<EmployeesDTO> selectAllContact() {
		return dao.selectAllContact();
	}
	public EmployeesDTO selectOneEmployees(int idx) {
		return dao.selectOneEmployees(idx);
	}
	public int updateEmployees(EmployeesDTO dto) {
		return dao.updateEmployees(dto);
	}
	
	public List<EmployeesDTO> selectDepart(String department) {
		return dao.selectDepart(department);
	}

	public List<DepartmentDTO> depart_list() {
	      return dao.select_Tree_dp();
	   }

	public ArrayList<EmployeesDTO> chat_selectAll(String search) {
		return dao.chat_selectAll(search);
	}

	public int updateLoginState(EmployeesDTO login) {
		
		return dao.updateLoginState(login);
	}
	public EmployeesDTO selectSalt(EmployeesDTO dto) {
		return dao.selectSalt(dto);
	}

	

	public List<ScheduleDTO> homeSchedule(String department) {
		
		return dao.homeSchedule(department);
	}
	
	public int nReadMail(String mail) {
	      return dao.receiveMailNoReadCount(mail);
	   }
	public List<ApprovalDTO> homeApproval(String userid) {
		return adao.selectReceiver(userid);
	}

	public List<ApprovalDTO> bossSelect(String userid) {
		return adao.bossSelect(userid);
	}
	public List<BoardDTO> notice() {
		
		return bdao.homeNotice();
	}

	public List<BoardDTO> suggestion() {
		
		return bdao.homeSuggestion();
	}

	public List<BoardDTO> event() {
		
		return bdao.homeEvent();
	}
	
	// 파일을 전달받으면 새로운 이름을 문자열로 반환하는 함수
    private String generateNewFileName(MultipartFile f) {
      String fileName = UUID.randomUUID().toString().replace("-", "");
      String contentType = f.getContentType();
      fileName += "." + contentType.substring(contentType.indexOf("/") + 1);
      return fileName;
   }
		
		


		   public int updateProfileImg(EmployeesDTO dto) {
			   File dir = new File("/home/ec2-user/ProFileImgFile");
			      String fileName = dao.selectProfileImg(dto);
			      File file = new File(dir, fileName);   // 저장된 위치에 지정한 이름의 파일
			      int row = 0;
			      MultipartFile f = dto.getUpload_profileImg();
			      if(f.getOriginalFilename().equals("")) {
			         return row;
			      } 
			      else {
			         if(file.exists()) {      // 파일이 있으면
			            if(fileName.equals("tmp.jpg")) {
			               row = 0;
			            }
			            else {
			               file.delete();         // 파일을 삭제한다
			            }
			         }
			         if (!f.getOriginalFilename().equals("") && f != null) {
//			         System.out.println(dir);
			            if(dir.exists() == false) {
			               dir.mkdirs();
			            }
//			         File dest = new File(dir, f.getOriginalFilename());
			            File dest = new File(dir, generateNewFileName(f));
//			         System.out.println("getOriginalFilename: " + f.getOriginalFilename());
			            try {
			               f.transferTo(dest);
			               dto.setProfile_fic(dest.getName());
//			            System.out.println("profile_fic: " + dto.getProfile_fic());
			               row = dao.updateProfileImg(dto);
			            } catch (IllegalStateException | IOException e) {
			               e.printStackTrace();
			            }
			         }
			         else {
			            row = 0;
			         }
			      }
			      return row;
			   }

			   @Transactional
			   public int updatePw(EmployeesDTO dto, HttpSession session) {
			      String salt = "";
			      String saltCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&";
			      StringBuilder sb = new StringBuilder(8);
			        for (int i = 0; i < 8; i++) {
			            sb.append(saltCharacters.charAt(random.nextInt(saltCharacters.length())));
			        }
			      salt += sb.toString();
			      dto.setSalt(salt);
			      String saltedHash = hashComponent.getHash((dto.getEmployee_userpw() + dto.getSalt()));
			      for(int i = 0; i < 10000; i++) {
			         saltedHash = hashComponent.getHash(saltedHash);
			      }
			      dto.setEmployee_userpw(saltedHash);
			      session.invalidate();
			      return dao.updatePw(dto);
			   }
	
}
