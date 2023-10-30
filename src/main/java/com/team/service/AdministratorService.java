package com.team.service;

import java.io.File;
import java.security.SecureRandom;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.component.HashComponent;
import com.team.model.ApprovalDTO;
import com.team.model.DepartmentDTO;
import com.team.model.EmployeesDTO;
import com.team.model.JobDTO;
import com.team.repository.AdministratorDAO;
import com.team.repository.HomeDAO;

@Service
public class AdministratorService {

	@Autowired AdministratorDAO dao;
	@Autowired HashComponent hashComponent;

	private SecureRandom random = new SecureRandom();

	public List<EmployeesDTO> selectAllMember() {
		return dao.selectAllMember();
	}

	public int insertMember(EmployeesDTO dto) {

		String salt = "";
		String saltCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&";
		StringBuilder sb = new StringBuilder(8);
		
        // 문자는 모든 문자(특수 문자, 문자, 숫자) 중에서 랜덤으로 선택
        for (int i = 0; i < 8; i++) {
            sb.append(saltCharacters.charAt(random.nextInt(saltCharacters.length())));
        }
		
		salt += sb.toString();

		dto.setSalt(salt);

		String userpw = hashComponent.getHash((dto.getEmployee_userpw() + dto.getSalt()));
		for(int i = 0; i < 10000; i++) {
			userpw = hashComponent.getHash(userpw);
		}
		dto.setEmployee_userpw(userpw);
		return dao.insertMember(dto);
	}
	@Autowired HomeDAO homeDAO;

	   public int deleteMember(int idx) {
	      File dir = new File("/home/ec2-user/ProFileImgFile");
	      EmployeesDTO dto = selectOneMember(idx);
	      String fileName = homeDAO.selectProfileImg(dto);
	      File file = new File(dir, fileName);   // 저장된 위치에 지정한 이름의 파일
	      if(file.exists()) {      // 파일이 있으면
	         file.delete();         // 파일을 삭제한다
	      }
	      int row = dao.deleteMember(idx);
	      System.out.println(row + "행이 삭제되었습니다");
	      return row;
	   }


	public EmployeesDTO selectOneMember(int idx) {
		return dao.selectOneMember(idx);
	}

	public int updateMember(EmployeesDTO dto) {
		return dao.updateMember(dto);
	}

	public List<JobDTO> selectAllJob() {
		return dao.selectAllJob();
	}

	public List<DepartmentDTO> selectAllDepartment() {
		return dao.selectAllDepartment();
	}

	public List<ApprovalDTO> selectAllApproval() {
		return dao.selectAllApproval();
	}

	public int dupCheck(String employeeUserid) {
		return dao.selectCount(employeeUserid);
	}

	public ApprovalDTO selectOneApproval(int idx) {
		return dao.selectOneApproval(idx);
	}
	

}
