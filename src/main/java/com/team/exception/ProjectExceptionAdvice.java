package com.team.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ProjectExceptionAdvice {
   @ExceptionHandler(Exception.class)
   public ModelAndView ex(Exception e) {
      e.printStackTrace();
      ModelAndView mav = new ModelAndView("/board/alert");
      String msg = "처리 도중 문제가 발생했습니다\\n";
      msg += "지속적으로 문제가 발생하면 관리자에게 알려주시기 바랍니다";
      mav.addObject("msg",msg);
      mav.addObject("url","/");
      return mav;
   }
}
