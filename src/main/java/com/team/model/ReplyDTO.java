package com.team.model;

import java.sql.Date;

public class ReplyDTO {
   
   private int reply_idx;
   private int writer_id;
   private int board_id;
   private Date reply_date;
   private String reply_content;
   
   /*==========employees join ==============*/
   private String profile_fic;
   
   public String getProfile_fic() {
      return profile_fic;
   }
   public void setProfile_fic(String profile_fic) {
      this.profile_fic = profile_fic;
   }
   public String getEmployee_name() {
      return employee_name;
   }
   public void setEmployee_name(String employee_name) {
      this.employee_name = employee_name;
   }
   private String employee_name;
   public int getReply_idx() {
      return reply_idx;
   }
   public void setReply_idx(int reply_idx) {
      this.reply_idx = reply_idx;
   }
   public int getWriter_id() {
      return writer_id;
   }
   public void setWriter_id(int writer_id) {
      this.writer_id = writer_id;
   }
   
   public int getBoard_id() {
      return board_id;
   }
   public void setBoard_id(int board_id) {
      this.board_id = board_id;
   }
   public Date getReply_date() {
      return reply_date;
   }
   public void setReply_date(Date reply_date) {
      this.reply_date = reply_date;
   }
   public String getReply_content() {
      return reply_content;
   }
   public void setReply_content(String reply_content) {
      this.reply_content = reply_content;
   }
   
   


}