package com.team.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team.model.BoardDTO;
import com.team.model.BoardFileDTO;
import com.team.model.EmployeesDTO;
import com.team.model.PagingDTO;
import com.team.model.ReplyDTO;
import com.team.model.SendReceiverDTO;
import com.team.service.BoardService;
import com.team.service.FileUploadService;
import com.team.service.SendReceiverService;


@Controller
@RequestMapping("/board")
public class BoardController {
   
   @Autowired private BoardService boardService;
   @Autowired private FileUploadService fileUploadService;
   @Autowired private SendReceiverService sendReceiverService; 
   
   /* ======================== board view(메인 페이지) ======================= */
   
   @GetMapping("/view")
   public ModelAndView view(@RequestParam(value="page", defaultValue="1") int page, HttpServletRequest params, HttpSession session) {
      PagingDTO search = new PagingDTO();
      search.setBd_column(params.getParameter("bd_column"));
      search.setBd_search(params.getParameter("bd_search"));
      int boardCount = boardService.selectCount(search);;
      PagingDTO paging = new PagingDTO(page, boardCount);
      paging.setBd_search(params.getParameter("bd_search"));
      paging.setBd_column(params.getParameter("bd_column"));
      


      List<SendReceiverDTO> senderReceiver = sendReceiverService.selectSendReceiver();

      
      ModelAndView mav = new ModelAndView("/board/view");
      List<BoardDTO> boardList = boardService.selectAll(paging);

      mav.addObject("boardList", boardList);
      mav.addObject("paging", paging);

      mav.addObject("sr",senderReceiver);
      return mav;
      
   }
   
   @PostMapping("/view")
   public ModelAndView searchView(@RequestParam(value="page", defaultValue="1") int page, HttpServletRequest params) {
      PagingDTO search = new PagingDTO();
      search.setBd_column(params.getParameter("bd_column"));
      search.setBd_search(params.getParameter("bd_search"));
      
      int boardCount = boardService.selectCount(search);
      PagingDTO paging = new PagingDTO(page, boardCount);
      
      paging.setBd_column(params.getParameter("bd_column"));
      paging.setBd_search(params.getParameter("bd_search"));
      
      System.out.println("column:"+paging.getBd_column());
      System.out.println("search:"+paging.getBd_search());
      System.out.println("offset:"+paging.getOffset());
      System.out.println("perpage:"+paging.getPerPage());
      List<SendReceiverDTO> senderReceiver = sendReceiverService.selectSendReceiver();
      ModelAndView mav = new ModelAndView("/board/view");
      List<BoardDTO> boardList = boardService.selectAll(paging);
      mav.addObject("boardList", boardList);
      mav.addObject("paging", paging);
      mav.addObject("sr",senderReceiver);
      return mav;
   }
   
   @GetMapping("selectOne/{board_idx}")
   public ModelAndView selectOne(@PathVariable("board_idx") int board_idx) {
      BoardDTO selectOne = boardService.selectOne(board_idx); 
      ModelAndView mav = null;
      
      List<BoardFileDTO> selectList = fileUploadService.select(board_idx);
      for(BoardFileDTO dto : selectList) {
            System.out.println(dto.getBoard_title());
            System.out.println(dto.getBoard_filepath());
            if(dto.getBoard_filepath() != null && !dto.getBoard_filepath().contains("octet-stream")) {
               String[] arr = dto.getBoard_filepath().split(",");
               for(String s : arr) {
                  System.out.printf("이미지 : %s \n",s);
               }
            }
      }
      
      
      String category = selectOne.getBoard_category();
      System.out.println(selectOne.getBoard_idx());
      System.out.println(selectOne.getBoard_category());
      switch(category) {
      
      case "공지사항":
         mav = new ModelAndView("/board/notice/noticeview");
         break;
      case "건의사항":
         mav = new ModelAndView("/board/suggestion/suggestionview");
         break;
      case "경조사":
         BoardDTO selectAddress = boardService.selectAddress(board_idx);
         mav = new ModelAndView("/board/event/eventview");
         mav.addObject("selectAddress",selectAddress);
         break;   
      }
      mav.addObject("selectOne", selectOne);
      mav.addObject("selectList", selectList);
      return mav;
   }
   @GetMapping("selectOne/{board_idx}/update")
   public ModelAndView categoryUpdate(@PathVariable("board_idx") int board_idx) {
      BoardDTO selectOne = boardService.selectOne(board_idx); 
      ModelAndView mav = null;
      
      List<BoardFileDTO> selectList = fileUploadService.select(board_idx);
      for(BoardFileDTO dto : selectList) {
            System.out.println(dto.getBoard_title());
            System.out.println(dto.getBoard_filepath());
            if(dto.getBoard_filepath() != null && !dto.getBoard_filepath().contains("octet-stream")) {
               String[] arr = dto.getBoard_filepath().split(",");
               for(String s : arr) {
                  System.out.printf("이미지 : %s \n",s);
               }
            }
      }
      
      
      String category = selectOne.getBoard_category();
      System.out.println(selectOne.getBoard_idx());
      System.out.println(selectOne.getBoard_category());
      switch(category) {
      
      case "공지사항":
         mav = new ModelAndView("/board/notice/update");
         break;
      case "건의사항":
         mav = new ModelAndView("/board/suggestion/update");
         break;
      case "경조사":
         BoardDTO selectAddress = boardService.selectAddress(board_idx);
         mav = new ModelAndView("/board/event/update");
         mav.addObject("selectAddress",selectAddress);
         break;   
      }
      mav.addObject("selectOne", selectOne);
      mav.addObject("selectList", selectList);
      return mav;
   }
   
   
   /* ======================== notice(공지사항) ======================= */
   @GetMapping("/notice/list")
   public ModelAndView noticeList(@RequestParam(value="page", defaultValue="1") int page,  HttpServletRequest params) {
      ModelAndView mav = new ModelAndView("/board/notice/list");
      PagingDTO search = new PagingDTO();
      PagingDTO sessionSearch = new PagingDTO();
      search.setBd_column(params.getParameter("bd_column"));
      search.setBd_search(params.getParameter("bd_search"));
      
      sessionSearch.setBd_column(search.getBd_column());
      sessionSearch.setBd_search(search.getBd_search());
      System.out.println("파라미터 칼럼 : " + sessionSearch.getBd_column());
      System.out.println("파라미터 서치 : " + sessionSearch.getBd_search());
      int boardCount = boardService.noticeSearchCount(sessionSearch);
      
      PagingDTO paging = new PagingDTO(page, boardCount);
      paging.setBd_column(sessionSearch.getBd_column());
      paging.setBd_search(sessionSearch.getBd_search());
      
      List<BoardDTO> noticeList = boardService.selectNotice(paging);
      
      mav.addObject("paging",paging);
      mav.addObject("noticeList", noticeList);
      return mav;
   }
   @PostMapping("/notice/list")
   public ModelAndView searchNotice(@RequestParam(value="page", defaultValue="1") int page,  HttpServletRequest params) {
      ModelAndView mav = new ModelAndView("/board/notice/list");
      PagingDTO search = new PagingDTO();
      PagingDTO sessionSearch = new PagingDTO();
      search.setBd_column(params.getParameter("bd_column"));
      search.setBd_search(params.getParameter("bd_search"));
      
      sessionSearch.setBd_column(search.getBd_column());
      sessionSearch.setBd_search(search.getBd_search());
      System.out.println("파라미터 칼럼 : " + sessionSearch.getBd_column());
      System.out.println("파라미터 서치 : " + sessionSearch.getBd_search());
      int boardCount = boardService.noticeSearchCount(sessionSearch);
      
      PagingDTO paging = new PagingDTO(page, boardCount);
      paging.setBd_column(sessionSearch.getBd_column());
      paging.setBd_search(sessionSearch.getBd_search());
      
      List<BoardDTO> noticeList = boardService.selectNotice(paging);
      
      mav.addObject("paging",paging);
      mav.addObject("noticeList", noticeList);
      return mav;
   }
   
   @GetMapping("/notice/insert")
   public ModelAndView noticeInsert() {
      ModelAndView mav = new ModelAndView("board/notice/insert");
      return mav;
   }
   
   @GetMapping("/notice/delete") 
   public void nodelete() {
	   
   }
   @PostMapping("/notice/delete") 
   public String noticedelete(int board_idx) {
   int row = boardService.noticedelete(board_idx);
   
   System.out.println("보드 idx: " + board_idx);
   return "redirect:/board/notice/list";
   }
   /* ======================== suggestion(건의사항) ======================= */
   @GetMapping("/suggestion/list")
   public ModelAndView suggestionList(@RequestParam(value="page", defaultValue="1") int page, HttpServletRequest params) {
      ModelAndView mav = new ModelAndView("/board/suggestion/list");
      PagingDTO search = new PagingDTO();
      PagingDTO sessionSearch = new PagingDTO();
      search.setBd_column(params.getParameter("bd_column"));
      search.setBd_search(params.getParameter("bd_search"));
      
      sessionSearch.setBd_column(search.getBd_column());
      sessionSearch.setBd_search(search.getBd_search());
      System.out.println("파라미터 칼럼 : " + sessionSearch.getBd_column());
      System.out.println("파라미터 서치 : " + sessionSearch.getBd_search());
      int boardCount = boardService.suggestionSearchCount(sessionSearch);
      PagingDTO paging = new PagingDTO(page, boardCount);
      
      paging.setBd_column(sessionSearch.getBd_column());
      paging.setBd_search(sessionSearch.getBd_search());
      
      List<BoardDTO> suggestionList = boardService.selectSuggestion(paging);
      List<SendReceiverDTO> senderReceiver = sendReceiverService.selectSendReceiver();
      mav.addObject("sr",senderReceiver);
      mav.addObject("paging",paging);
      mav.addObject("suggestionList", suggestionList);
      return mav;
   }
   
   @PostMapping("/suggestion/list")
   public ModelAndView searchSuggestionList(@RequestParam(value="page", defaultValue="1") int page, HttpServletRequest params) {
      ModelAndView mav = new ModelAndView("/board/suggestion/list");
      PagingDTO search = new PagingDTO();
      PagingDTO sessionSearch = new PagingDTO();
      search.setBd_column(params.getParameter("bd_column"));
      search.setBd_search(params.getParameter("bd_search"));
      
      sessionSearch.setBd_column(search.getBd_column());
      sessionSearch.setBd_search(search.getBd_search());
      System.out.println("파라미터 칼럼 : " + sessionSearch.getBd_column());
      System.out.println("파라미터 서치 : " + sessionSearch.getBd_search());
      int boardCount = boardService.suggestionSearchCount(sessionSearch);
      PagingDTO paging = new PagingDTO(page, boardCount);
      
      paging.setBd_column(sessionSearch.getBd_column());
      paging.setBd_search(sessionSearch.getBd_search());
      
      List<BoardDTO> suggestionList = boardService.selectSuggestion(paging);
      List<SendReceiverDTO> senderReceiver = sendReceiverService.selectSendReceiver();
      mav.addObject("sr",senderReceiver);
      mav.addObject("paging",paging);
      mav.addObject("suggestionList", suggestionList);
      return mav;
   }
   
   @GetMapping("/suggestion/insert")
   public ModelAndView suggestionInsert() {
      ModelAndView mav = new ModelAndView("board/suggestion/insert");
      List<EmployeesDTO> selectHumanList = boardService.selectHumanList();
      mav.addObject("selectHumanList", selectHumanList);
      return mav;
   }
   @GetMapping("/suggestion/delete") 
   public void sudelete() {
	   
   }
   @PostMapping("/suggestion/delete") 
   public String suggestiondelete(int board_idx) {
   int row = boardService.suggestiondelete(board_idx);
   System.out.println("보드 idx: " + board_idx);
   return "redirect:/board/suggestion/list";
   }
   /* ======================== club(동호회) ======================= */
   @GetMapping("/club/list")
   public ModelAndView clubList(@RequestParam(value="page", defaultValue="1") int page,  HttpServletRequest params) {
      ModelAndView mav = new ModelAndView("/board/club/list");
      PagingDTO search = new PagingDTO();
      PagingDTO sessionSearch = new PagingDTO();
      search.setBd_column(params.getParameter("bd_column"));
      search.setBd_search(params.getParameter("bd_search"));
      
      sessionSearch.setBd_column(search.getBd_column());
      sessionSearch.setBd_search(search.getBd_search());
      System.out.println("파라미터 칼럼 : " + sessionSearch.getBd_column());
      System.out.println("파라미터 서치 : " + sessionSearch.getBd_search());
      int boardCount = boardService.clubSearchCount(sessionSearch);
      
      PagingDTO paging = new PagingDTO(page, boardCount);
      paging.setBd_column(sessionSearch.getBd_column());
      paging.setBd_search(sessionSearch.getBd_search());
      
      List<BoardDTO> clubList = boardService.selectClub(paging);
      
      mav.addObject("paging",paging);
      mav.addObject("clubList", clubList);
      return mav;
   }
   @PostMapping("/club/list")
   public ModelAndView searchClub(@RequestParam(value="page", defaultValue="1") int page,  HttpServletRequest params) {
      ModelAndView mav = new ModelAndView("/board/club/list");
      PagingDTO search = new PagingDTO();
      PagingDTO sessionSearch = new PagingDTO();
      search.setBd_column(params.getParameter("bd_column"));
      search.setBd_search(params.getParameter("bd_search"));
      
      sessionSearch.setBd_column(search.getBd_column());
      sessionSearch.setBd_search(search.getBd_search());
      System.out.println("파라미터 칼럼 : " + sessionSearch.getBd_column());
      System.out.println("파라미터 서치 : " + sessionSearch.getBd_search());
      int boardCount = boardService.clubSearchCount(sessionSearch);
      System.out.println("서치 값 : " + boardCount);
      
      PagingDTO paging = new PagingDTO(page, boardCount);
      paging.setBd_column(sessionSearch.getBd_column());
      paging.setBd_search(sessionSearch.getBd_search());
      
      List<BoardDTO> clubList = boardService.selectClub(paging);
      
      mav.addObject("paging",paging);
      mav.addObject("clubList", clubList);
      return mav;
   }
   @GetMapping("/club/insert")
   public ModelAndView clubInsert() {
      ModelAndView mav = new ModelAndView("board/club/insert");
      return mav;
   }
   @PostMapping("/club/insert") 
   public String clubInsert(BoardDTO dto) {
	   int row = boardService.clubInsert(dto);
	   return "redirect:/board/club/list";
   }
   
   @GetMapping("/club/view/{board_idx}")
   public ModelAndView clubView(@PathVariable("board_idx") int board_idx) {
      BoardDTO selectOne = boardService.selectOneClub(board_idx); 
      ModelAndView mav = new ModelAndView("board/club/view");
      
      mav.addObject("selectOne", selectOne);
      
      return mav;
   }
   
   @GetMapping("club/{board_idx}/update")
   public ModelAndView clubUpdate(@PathVariable("board_idx") int board_idx) {
      BoardDTO selectOne = boardService.selectOneClub(board_idx); 
      ModelAndView mav = new ModelAndView("board/club/update");
      
      mav.addObject("selectOne", selectOne);
      
      return mav;
   }
   @PostMapping("club/update")
   public String clubUpdate(BoardDTO dto) {
	   
	   int row = boardService.clubUpdate(dto);
	   
	   return "redirect:/board/club/list";
   }
   @PostMapping("club/delete")
   public String clubDelete(int club_idx) {
	   int row = boardService.clubDelete(club_idx);
	   
	   return "redirect:/board/club/list";
   }
   
   /* ======================== event(경조사) ======================= */
   @GetMapping("/event/list")
   public ModelAndView eventList(@RequestParam(value="page", defaultValue="1") int page, HttpServletRequest params) {
      ModelAndView mav = new ModelAndView("/board/event/list");
      PagingDTO search = new PagingDTO();
      PagingDTO sessionSearch = new PagingDTO();
      search.setBd_column(params.getParameter("bd_column"));
      search.setBd_search(params.getParameter("bd_search"));

      sessionSearch.setBd_column(search.getBd_column());
      sessionSearch.setBd_search(search.getBd_search());
      System.out.println("파라미터 칼럼 : " + sessionSearch.getBd_column());
      System.out.println("파라미터 서치 : " + sessionSearch.getBd_search());

      int boardCount = boardService.eventSearchCount(sessionSearch);
      PagingDTO paging = new PagingDTO(page, boardCount);

      paging.setBd_column(sessionSearch.getBd_column());
      paging.setBd_search(sessionSearch.getBd_search());
      
      List<BoardDTO> eventList = boardService.selectEvent(paging);
      mav.addObject("paging",paging);
      mav.addObject("eventList", eventList);
      return mav;
   }
   @PostMapping("/event/list")
   public ModelAndView searchEventList(@RequestParam(value="page", defaultValue="1") int page, HttpServletRequest params) {
      ModelAndView mav = new ModelAndView("/board/event/list");
      PagingDTO search = new PagingDTO();
      PagingDTO sessionSearch = new PagingDTO();
      search.setBd_column(params.getParameter("bd_column"));
      search.setBd_search(params.getParameter("bd_search"));

      sessionSearch.setBd_column(search.getBd_column());
      sessionSearch.setBd_search(search.getBd_search());
      System.out.println("파라미터 칼럼 : " + sessionSearch.getBd_column());
      System.out.println("파라미터 서치 : " + sessionSearch.getBd_search());

      int boardCount = boardService.eventSearchCount(sessionSearch);
      PagingDTO paging = new PagingDTO(page, boardCount);
      paging.setBd_column(sessionSearch.getBd_column());
      paging.setBd_search(sessionSearch.getBd_search());
      
      List<BoardDTO> eventList = boardService.selectEvent(paging);
      mav.addObject("paging",paging);
      mav.addObject("eventList", eventList);

      return mav;
   }
   
   @GetMapping("/event/insert")
   public ModelAndView eventInsert() {
      ModelAndView mav = new ModelAndView("/board/event/insert");
      
      return mav;
   }
   
   @GetMapping("/event/jusoPopup") 
   public ModelAndView jusoPopup()   {
      ModelAndView mav = new ModelAndView("/board/event/jusoPopup");
      
      return mav;
   }

   @PostMapping("/event/jusoPopup") 
   public ModelAndView innerAddress() {
      ModelAndView mav = new ModelAndView("/board/event/jusoPopup");
      
      return mav;
   }
   
   @GetMapping("/event/delete/{board_idx}") 
   public String eventdelete(@PathVariable("board_idx")int board_idx) {
   int row = boardService.eventdelete(board_idx);
   System.out.println("보드 idx: " + board_idx);
   return "redirect:/board/event/list";
   }
}