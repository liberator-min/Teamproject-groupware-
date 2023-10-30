package com.team.model;

public class DepartmentDTO {

	private int department_idx;
	private String department_name;
	private int manager_idx;
	
	public int getDepartment_idx() {
		return department_idx;
	}
	public void setDepartment_idx(int department_idx) {
		this.department_idx = department_idx;
	}
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
	public int getManager_idx() {
		return manager_idx;
	}
	public void setManager_idx(int manager_idx) {
		this.manager_idx = manager_idx;
	}

	
}
