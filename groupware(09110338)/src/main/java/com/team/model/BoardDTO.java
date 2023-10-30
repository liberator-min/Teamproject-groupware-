package com.team.model;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class BoardDTO {
   
   private int board_idx;
   private String board_title;
   private String board_content;
   @JsonFormat(shape = JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
   private Date write_date;
   private String board_category;
   private int writer_id;
   private int isnotice;
   private PagingDTO paging;
   private String receiver;
   private int sender;
   private String employee_name;
   private String department;
   public String getEmployee_idx() {
	return employee_idx;
}
public void setEmployee_idx(String employee_idx) {
	this.employee_idx = employee_idx;
}
private String employee_idx;
   
   public String getDepartment() {
	return department;
}
public void setDepartment(String department) {
	this.department = department;
}
public String getEmployee_name() {
	return employee_name;
}
public void setEmployee_name(String employee_name) {
	this.employee_name = employee_name;
}
public PagingDTO getPaging() {
      return paging;
   }
   public void setPaging(PagingDTO paging) {
      this.paging = paging;
   }
   /*============club DTO==============*/
   private int club_idx;
   private String club_name;
   /*============address DTO===========*/
   private String address_value;
   private String placeName;
   private int board_id;
   
   
   public String getReceiver() {
   return receiver;
   }
   public void setReceiver(String receiver) {
      this.receiver = receiver;
   }
   public int getSender() {
      return sender;
   }
   public void setSender(int sender) {
      this.sender = sender;
   }
   
   public String getAddress_value() {
      return address_value;
   }
   public void setAddress_value(String address_value) {
      this.address_value = address_value;
   }
   public String getPlaceName() {
      return placeName;
   }
   public void setPlaceName(String placeName) {
      this.placeName = placeName;
   }
   public int getBoard_id() {
      return board_id;
   }
   public void setBoard_id(int board_id) {
      this.board_id = board_id;
   }
   public int getClub_idx() {
      return club_idx;
   }
   public void setClub_idx(int club_idx) {
      this.club_idx = club_idx;
   }
   public String getClub_name() {
      return club_name;
   }
   public void setClub_name(String club_name) {
      this.club_name = club_name;
   }
   public int getBoard_idx() {
      return board_idx;
   }
   public void setBoard_idx(int board_idx) {
      this.board_idx = board_idx;
   }
   public String getBoard_title() {
      return board_title;
   }
   public void setBoard_title(String board_title) {
      this.board_title = board_title;
   }
   public String getBoard_content() {
      return board_content;
   }
   public void setBoard_content(String board_content) {
      this.board_content = board_content;
   }
   public Date getWrite_date() {
      return write_date;
   }
   public void setWrite_date(Date write_date) {
      this.write_date = write_date;
   }
   public String getBoard_category() {
      return board_category;
   }
   public void setBoard_category(String board_category) {
      this.board_category = board_category;
   }
   public int getWriter_id() {
      return writer_id;
   }
   public void setWriter_id(int writer_id) {
      this.writer_id = writer_id;
   }
   public int getIsnotice() {
      return isnotice;
   }
   public void setIsnotice(int isnotice) {
      this.isnotice = isnotice;
   }
   
   


}