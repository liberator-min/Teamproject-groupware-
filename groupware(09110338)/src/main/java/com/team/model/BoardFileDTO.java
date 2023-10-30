package com.team.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BoardFileDTO {
   
   
   private int board_id;
   private String board_filepath;
   private List<MultipartFile> upload;
   
   // board table join
   private String board_title;
   private String board_content;
   private String board_idx;
   private String board_category;
   private int isnotice;
   
   // address table join
   private String address_value;
   private String placeName;
   
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
   public int getIsnotice() {
      return isnotice;
   }
   public void setIsnotice(int isnotice) {
      this.isnotice = isnotice;
   }
   private int employee_idx;
   
   public String getBoard_category() {
      return board_category;
   }
   public int getEmployee_idx() {
      return employee_idx;
   }
   public void setEmployee_idx(int employee_idx) {
      this.employee_idx = employee_idx;
   }
   public void setBoard_category(String board_category) {
      this.board_category = board_category;
   }
   public String getBoard_idx() {
      return board_idx;
   }
   public void setBoard_idx(String board_idx) {
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
   public List<MultipartFile> getUpload() {
      return upload;
   }
   public void setUpload(List<MultipartFile> upload) {
      this.upload = upload;
   }
   public int getBoard_id() {
      return board_id;
   }
   public void setBoard_id(int board_id) {
      this.board_id = board_id;
   }
   public String getBoard_filepath() {
      return board_filepath;
   }
   public void setBoard_filepath(String board_filepath) {
      this.board_filepath = board_filepath;
   }

   
   

}