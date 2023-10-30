package com.team.model;

import java.sql.Date;

public class DenyBackupDTO {
	
	private int accept_idx;
	private String writer;
	private Date start_date;
	private Date end_date;
	private int department_id;
	private String approval_title;
	private String approval_content;
	private String type;
	private String backup_filepath;
	public int getAccept_idx() {
		return accept_idx;
	}
	public void setAccept_idx(int accept_idx) {
		this.accept_idx = accept_idx;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public int getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}
	public String getApproval_title() {
		return approval_title;
	}
	public void setApproval_title(String approval_title) {
		this.approval_title = approval_title;
	}
	public String getApproval_content() {
		return approval_content;
	}
	public void setApproval_content(String approval_content) {
		this.approval_content = approval_content;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getBackup_filepath() {
		return backup_filepath;
	}
	public void setBackup_filepath(String backup_filepath) {
		this.backup_filepath = backup_filepath;
	}
	
	


}
