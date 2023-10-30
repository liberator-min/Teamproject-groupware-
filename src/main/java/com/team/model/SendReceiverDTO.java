package com.team.model;

import java.util.List;

public class SendReceiverDTO {
   private int receiver_idx;
   private int sender;
   private String receiver;
   private int board_id;
   private String receiverList;
   private String receiverIdxList;
   private String senderReceiver;
   private String employee_userid;
   private String employee_useridList;
   private List<SendReceiverDTO> sendReceiverDTO;
   private List<String> receiverName;
   private List<String> receiverIdx;
   private List<String> receiveruserID;
   
   
   public List<SendReceiverDTO> getSendReceiverDTO() {
   return sendReceiverDTO;
   }
   public void setSendReceiverDTO(List<SendReceiverDTO> sendReceiverDTO) {
      this.sendReceiverDTO = sendReceiverDTO;
   }
   public String getEmployee_useridList() {
   return employee_useridList;
   }
   public void setEmployee_useridList(String employee_useridList) {
      this.employee_useridList = employee_useridList;
   }
         
      public List<String> getReceiveruserID() {
      return receiveruserID;
   }
   public void setReceiveruserID(List<String> receiveruserID) {
      this.receiveruserID = receiveruserID;
   }
   public String getEmployee_userid() {
      return employee_userid;
   }
   public void setEmployee_userid(String employee_userid) {
      this.employee_userid = employee_userid;
   }
   
   public String getReceiverIdxList() {
      return receiverIdxList;
   }
   public void setReceiverIdxList(String receiverIdxList) {
      this.receiverIdxList = receiverIdxList;
   }
   public List<String> getReceiverName() {
   return receiverName;
   }
   public void setReceiverName(List<String> receiverName) {
      this.receiverName = receiverName;
   }
   public List<String> getReceiverIdx() {
      return receiverIdx;
   }
   public void setReceiverIdx(List<String> receiverIdx) {
      this.receiverIdx = receiverIdx;
   }
   public String getReceiverList() {
      return receiverList;
   }
   public void setReceiverList(String receiverList) {
      this.receiverList = receiverList;
   }
   public int getBoard_id() {
      return board_id;
   }
   public void setBoard_id(int board_id) {
      this.board_id = board_id;
   }
   
   public String getSenderReceiver() {
      return senderReceiver;
   }
   public void setSenderReceiver(String senderReceiver) {
      this.senderReceiver = senderReceiver;
   }
   public int getReceiver_idx() {
      return receiver_idx;
   }
   public void setReceiver_idx(int receiver_idx) {
      this.receiver_idx = receiver_idx;
   }
   
   public int getSender() {
      return sender;
   }
   public void setSender(int sender) {
      this.sender = sender;
   }
   public String getReceiver() {
      return receiver;
   }
   public void setReceiver(String receiver) {
      this.receiver = receiver;
   }
   
}