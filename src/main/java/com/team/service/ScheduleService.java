package com.team.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.model.ScheduleDTO;
import com.team.repository.ScheduleDAO;

@Service
public class ScheduleService {

	@Autowired private ScheduleDAO dao;

	public List<ScheduleDTO> selectAll(String department) {
		
		
		return dao.selectAll(department);
	}

	

	public ScheduleDTO selectOne(int idx) {
		
		return dao.selectOne(idx);
	}



	public int insert(ScheduleDTO dto) {
		String newContent=dto.getContent().trim();
		dto.setContent(newContent);	
		return dao.insert(dto);
	}



	public int update(ScheduleDTO dto) {
		
		return dao.update(dto);
	}



	public List<ScheduleDTO> select(String name) {
		
		return dao.select(name);
	}



	public int delete(int idx) {
	
		return dao.delete(idx);
	}

	
}