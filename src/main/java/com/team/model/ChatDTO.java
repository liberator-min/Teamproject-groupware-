package com.team.model;

import java.util.Date;

public class ChatDTO {

   private int chat_idx;
   private String chatsender;
   private String chatreceiver;
   private String roomName;
   private String chatcontent;
   private Date chatWriteDate;
   
   public int getChat_idx() {
      return chat_idx;
   }
   public void setChat_idx(int chat_idx) {
      this.chat_idx = chat_idx;
   }
   public String getChatsender() {
      return chatsender;
   }
   public void setChatsender(String chatsender) {
      this.chatsender = chatsender;
   }
   public String getChatreceiver() {
      return chatreceiver;
   }
   public void setChatreceiver(String chatreceiver) {
      this.chatreceiver = chatreceiver;
   }
   public String getRoomName() {
      return roomName;
   }
   public void setRoomName(String roomName) {
      this.roomName = roomName;
   }
   
   public String getChatcontent() {
      return chatcontent;
   }
   public void setChatcontent(String chatcontent) {
      this.chatcontent = chatcontent;
   }
   public Date getChatWriteDate() {
      return chatWriteDate;
   }
   public void setChatWriteDate(Date chatWriteDate) {
      this.chatWriteDate = chatWriteDate;
   }
   
   
   
   
}
