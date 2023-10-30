package com.team.repository;

import java.util.List;


import org.springframework.stereotype.Repository;

import com.team.model.ScheduleDTO;

@Repository
public interface ScheduleDAO {

	List<ScheduleDTO> selectAll(String department);

	ScheduleDTO selectOne(int idx);

	int insert(ScheduleDTO dto);

	int update(ScheduleDTO dto);

	List<ScheduleDTO> select(String name);

	int delete(int idx);
	



}
