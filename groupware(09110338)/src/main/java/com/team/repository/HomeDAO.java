package com.team.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.team.model.ApprovalDTO;
import com.team.model.DepartmentDTO;
import com.team.model.EmployeesDTO;
import com.team.model.ScheduleDTO;

@Repository
public interface HomeDAO {

	EmployeesDTO selectOne(EmployeesDTO dto);
	
	List<EmployeesDTO> selectTree();
	
	List<DepartmentDTO> selectAllDepartment();

	List<EmployeesDTO> selectAllContact();

	EmployeesDTO selectOneEmployees(int idx);

	int updateEmployees(EmployeesDTO dto);

	int resetPassword(EmployeesDTO dto);

	
	List<EmployeesDTO> selectDepart(String department);

	List<DepartmentDTO> select_Tree_dp();

	ArrayList<EmployeesDTO> chat_selectAll(String search);

	int updateLoginState(EmployeesDTO login);

	List<ApprovalDTO> homeApproval(String userid);

	List<ScheduleDTO> homeSchedule(String department);

	int receiveMailNoReadCount(String mail);
	
	EmployeesDTO selectSalt(EmployeesDTO dto);
	
	String selectProfileImg(EmployeesDTO dto);

	int updateProfileImg(EmployeesDTO dto);

	int updatePw(EmployeesDTO dto);
}
