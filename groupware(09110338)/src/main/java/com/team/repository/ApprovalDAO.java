package com.team.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.team.model.ApprovalDTO;
import com.team.model.DepartmentDTO;
import com.team.model.EmployeesDTO;

@Repository
public interface ApprovalDAO {

	List<ApprovalDTO> selectReceiver(String userid);

	EmployeesDTO selectBoss(String userid);

	EmployeesDTO selectOne(String userid);

	List<ApprovalDTO> selectWait(String userid);

	List<ApprovalDTO> selectAll(String userid);

	ApprovalDTO selectRoot(int idx);

	int update(ApprovalDTO dto);

	List<ApprovalDTO> bossSelect(String boss);
	
	int insert(ApprovalDTO dto);

	int insertFile(ApprovalDTO dto);

	List<EmployeesDTO> selectBosses();

	EmployeesDTO writer(String userid);
}
