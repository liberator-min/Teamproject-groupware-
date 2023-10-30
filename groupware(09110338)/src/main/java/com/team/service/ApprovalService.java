package com.team.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.team.model.ApprovalDTO;
import com.team.model.EmployeesDTO;
import com.team.repository.ApprovalDAO;


@Service
public class ApprovalService {
	@Autowired private ApprovalDAO dao;
	
	

	public List<ApprovalDTO> selectReceiver(String userid) {
		return dao.selectReceiver(userid);
	}

	public EmployeesDTO selectBoss(String userid) {
		return dao.selectBoss(userid);
	}

	public EmployeesDTO selectOne(String userid) {
		return dao.selectOne(userid);
	}

	public List<ApprovalDTO> selectWait(String userid) {
		return dao.selectWait(userid);
	}

	public List<ApprovalDTO> selectAll(String userid) {
		return dao.selectAll(userid);
	}

	public ApprovalDTO selectRoot(int idx) {
		return dao.selectRoot(idx);
	}

	public int update(ApprovalDTO dto) {
		return dao.update(dto);
	}

	public List<ApprovalDTO> bossSelect(String boss) {
		return dao.bossSelect(boss);
	}

	public int insertFile(ApprovalDTO dto) {
		int row = 0;
		System.out.println("getUpload: " + dto.getUpload());
			
		MultipartFile f = dto.getUpload();
		
		
		if (!f.getOriginalFilename().equals("") && f != null) {
			File dir = new File("/home/ec2-user/ApprovalFile");
				
			if(dir.exists() == false) {
				dir.mkdirs();
			}
			File dest = new File(dir, f.getOriginalFilename());
			System.out.println("getOriginalFilename: " + f.getOriginalFilename());
			try {
				f.transferTo(dest);
				
				dto.setApproval_filepath(dest.getName());
				System.out.println("approval_filepath: " + dto.getApproval_filepath());
				row = dao.insertFile(dto);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		else {
			row = dao.insert(dto);
		}
		return row;
	}

	public int insert(ApprovalDTO dto) {
		return dao.insert(dto);
	}

	public List<EmployeesDTO> selectBosses() {
		return dao.selectBosses();
	}

	public EmployeesDTO writer(String userid) {
		return dao.writer(userid);
	}
	
	

}
