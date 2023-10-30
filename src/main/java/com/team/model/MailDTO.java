package com.team.model;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class MailDTO {
	
	private int mail_idx;
	private String mail_title;
	private String mail_content;
	private Date mail_writedate;
	private String mail_writer;
	private String mail_receiver;
	private String mail_filePath;
	private List<MultipartFile> mailupload;
	private int mail_read;
	
	
	
	public int getMail_read() {
		return mail_read;
	}
	public void setMail_read(int mail_read) {
		this.mail_read = mail_read;
	}
	public String getMail_filePath() {
		return mail_filePath;
	}
	public void setMail_filePath(String mail_filePath) {
		this.mail_filePath = mail_filePath;
	}
	public List<MultipartFile> getMailupload() {
		return mailupload;
	}
	public void setMailupload(List<MultipartFile> mailupload) {
		this.mailupload = mailupload;
	}
	public int getMail_idx() {
		return mail_idx;
	}
	public void setMail_idx(int mail_idx) {
		this.mail_idx = mail_idx;
	}
	public String getMail_title() {
		return mail_title;
	}
	public void setMail_title(String mail_title) {
		this.mail_title = mail_title;
	}
	public String getMail_content() {
		return mail_content;
	}
	public void setMail_content(String mail_content) {
		this.mail_content = mail_content;
	}
	public Date getMail_writedate() {
		return mail_writedate;
	}
	public void setMail_writedate(Date mail_writedate) {
		this.mail_writedate = mail_writedate;
	}

	
	public String getMail_writer() {
		return mail_writer;
	}
	public void setMail_writer(String mail_writer) {
		this.mail_writer = mail_writer;
	}
	public String getMail_receiver() {
		return mail_receiver;
	}
	public void setMail_receiver(String mail_receiver) {
		this.mail_receiver = mail_receiver;
	}
	
	@Override
	public String toString() {
		return "MailDTO [mail_idx=" + mail_idx + ", mail_title=" + mail_title + ", mail_content=" + mail_content
				+ ", mail_writedate=" + mail_writedate + ", mail_writer=" + mail_writer + ", mail_receiver="
				+ mail_receiver + ", mail_filePath=" + mail_filePath + ", mailupload=" + mailupload + "]";
	}
	
	


}
