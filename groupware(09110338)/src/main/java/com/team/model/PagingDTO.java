package com.team.model;

import java.util.List;

public class PagingDTO {
   
   private int page;         // 사용자가 요청한 페이지 번호
   private int offset;         // idx역순으로 정렬했을 때 시작지점에서 건너뛰는 개수
   private int perPage = 10;
   private int boardCount;      // 총 게시글의 개수 (select count(*) from board2)
   private int pageCount;
   private String bd_column;
   private String bd_search;
   private int sender;
   private String receiver;
   

private int perSection = 10;   // 쪽번호 개수
   private int begin;            // 쪽번호 시작값
   private int end;            // 쪽번호 끝값
   private int section;
   private boolean prev;
   private boolean next;
   private List<PagingDTO> searchList;
   
   public PagingDTO() {}
   
   public PagingDTO(int page, int boardCount) {
      this.page = page;
      this.boardCount = boardCount;
      pageCount = boardCount / perPage;
      pageCount += (boardCount % perPage != 0) ? 1 : 0;
      
      if(page > pageCount) {   // 요청페이지가 최대수를 초과하면
         page = pageCount;   // 페이지 개수(마지막 페이지)를 대입
         this.page = page;   // 파라미터를 멤버 필드에 대입
      }
      offset = (page - 1) * perPage;
      
      end = ((page - 1) / perSection + 1) * perSection;
      begin = end - perSection + 1;
      section = (end - 1) / 10;
      prev = section != 0;
      
      end = end > pageCount ? pageCount : end;
      next = end != pageCount;
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

   public List<PagingDTO> getSearchList() {
      return searchList;
   }

   public void setSearchList(List<PagingDTO> searchList) {
      this.searchList = searchList;
   }

   public int getPerSection() {
      return perSection;
   }

   public void setPerSection(int perSection) {
      this.perSection = perSection;
   }

   public int getSection() {
      return section;
   }

   public void setSection(int section) {
      this.section = section;
   }

   public boolean isPrev() {
      return prev;
   }

   public void setPrev(boolean prev) {
      this.prev = prev;
   }

   public boolean isNext() {
      return next;
   }

   public void setNext(boolean next) {
      this.next = next;
   }

   public int getBegin() {
      return begin;
   }

   public void setBegin(int begin) {
      this.begin = begin;
   }

   public int getEnd() {
      return end;
   }

   public void setEnd(int end) {
      this.end = end;
   }

   

   public int getPage() {
      return page;
   }

   public void setPage(int page) {
      this.page = page;
   }

   public int getOffset() {
      return offset;
   }

   public void setOffset(int offset) {
      this.offset = offset;
   }

   public int getPerPage() {
      return perPage;
   }

   public void setPerPage(int perPage) {
      this.perPage = perPage;
   }

   public int getBoardCount() {
      return boardCount;
   }

   public void setBoardCount(int boardCount) {
      this.boardCount = boardCount;
   }

   public int getPageCount() {
      return pageCount;
   }

   public void setPageCount(int pageCount) {
      this.pageCount = pageCount;
   }
   public String getBd_column() {
      return bd_column;
   }
   public void setBd_column(String bd_column) {
      this.bd_column = bd_column;
   }
   public String getBd_search() {
      return bd_search;
   }
   public void setBd_search(String bd_search) {
      this.bd_search = bd_search;
   }

}