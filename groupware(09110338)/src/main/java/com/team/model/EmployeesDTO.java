package com.team.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class EmployeesDTO {
	
	private int employee_idx;
	private String employee_userid;
	private String employee_userpw;
	private String employee_name;
	private String mail;
	
	private String phone_number;
	private String birth_date;
	private String profile_fic;

	private int job_id;
	private Date hire_date;
	private String department;


	private int islogin;
	private String salt;
	private MultipartFile upload_profileImg;
//	-------------------------------------
	private String job_name;
	private String department_name;
	// 복구이메일
	private String recovery_email;

	public String getSalt() {
		return salt;
	}


	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getRecovery_email() {
		return recovery_email;
	}


	public void setRecovery_email(String recovery_email) {
		this.recovery_email = recovery_email;
	}


	public String getDepartment_name() {
		return department_name;
	}


	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}


	public int getEmployee_idx() {
		return employee_idx;
	}


	public void setEmployee_idx(int employee_idx) {
		this.employee_idx = employee_idx;
	}


	public String getEmployee_userid() {
		return employee_userid;
	}


	public void setEmployee_userid(String employee_userid) {
		this.employee_userid = employee_userid;
	}


	public String getEmployee_userpw() {
		return employee_userpw;
	}


	public void setEmployee_userpw(String employee_userpw) {
		this.employee_userpw = employee_userpw;
	}


	public String getEmployee_name() {
		return employee_name;
	}


	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}


	


	public String getPhone_number() {
		return phone_number;
	}


	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}


	public String getBirth_date() {
		return birth_date;
	}


	public void setBirth_date(String birth_date) {
		this.birth_date = birth_date;
	}


	public String getProfile_fic() {
		return profile_fic;
	}


	public void setProfile_fic(String profile_fic) {
		this.profile_fic = profile_fic;
	}


	public int getJob_id() {
		return job_id;
	}


	public void setJob_id(int job_id) {
		this.job_id = job_id;
	}


	public Date getHire_date() {
		return hire_date;
	}


	public void setHire_date(Date hire_date) {
		this.hire_date = hire_date;
	}


	public String getDepartment() {
		return department;
	}


	public void setDepartment(String department) {
		this.department = department;
	}


	public String getJob_name() {
		return job_name;
	}


	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}
	public String getMail() {
		return mail;
	}


	public void setMail(String mail) {
		this.mail = mail;
	}


	public int getIslogin() {
		return islogin;
	}


	public void setIslogin(int islogin) {
		this.islogin = islogin;
	}


	public MultipartFile getUpload_profileImg() {
		return upload_profileImg;
	}


	public void setUpload_profileImg(MultipartFile upload_profileImg) {
		this.upload_profileImg = upload_profileImg;
	}
	
	

}
