package com.team.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatTypes;

public class ApprovalDTO {
	
	private int approval_idx;
	private String writer;
	private String receiver;
	private String final_receiver;
	private Date start_date;
	private Date end_date;
	private String department;
	private int isapprove;
	private String type;
	private String approval_title;
	private String approval_content;
	private String approval_filepath;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date write_date;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date approval_date;
	private MultipartFile upload;


	//	-------------------------------------
	private String employee_name;
	private String job_name;
	private String w_department;
	
	
	
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public String getFinal_receiver() {
		return final_receiver;
	}
	public void setFinal_receiver(String final_receiver) {
		this.final_receiver = final_receiver;
	}
	public String getW_department() {
		return w_department;
	}
	public void setW_department(String w_department) {
		this.w_department = w_department;
	}
	public int getApproval_idx() {
		return approval_idx;
	}
	public void setApproval_idx(int approval_idx) {
		this.approval_idx = approval_idx;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
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
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public int getIsapprove() {
		return isapprove;
	}
	public void setIsapprove(int isapprove) {
		this.isapprove = isapprove;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	public String getApproval_filepath() {
		return approval_filepath;
	}
	public void setApproval_filepath(String approval_filepath) {
		this.approval_filepath = approval_filepath;
	}
	public String getEmployee_name() {
		return employee_name;
	}
	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}
	public String getJob_name() {
		return job_name;
	}
	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	public Date getApproval_date() {
		return approval_date;
	}
	public void setApproval_date(Date approval_date) {
		this.approval_date = approval_date;
	}
}
