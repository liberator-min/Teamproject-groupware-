package com.team.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.team.model.ApprovalDTO;
import com.team.model.DepartmentDTO;
import com.team.model.EmployeesDTO;
import com.team.model.JobDTO;

@Repository
public interface AdministratorDAO {

	List<EmployeesDTO> selectAllMember();

	int insertMember(EmployeesDTO dto);

	int deleteMember(int idx);

	EmployeesDTO selectOneMember(int idx);

	int updateMember(EmployeesDTO dto);

	List<JobDTO> selectAllJob();

	List<DepartmentDTO> selectAllDepartment();

	List<ApprovalDTO> selectAllApproval();

	int selectCount(String employeeUserid);

	ApprovalDTO selectOneApproval(int idx);

}



