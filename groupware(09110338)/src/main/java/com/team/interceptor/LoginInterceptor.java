package com.team.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.team.model.EmployeesDTO;

@Component
public class LoginInterceptor implements HandlerInterceptor{

   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
      
      HttpSession session = request.getSession();
      EmployeesDTO login = (EmployeesDTO)session.getAttribute("login");
   
      if(login == null) {
         String urlPrior = request.getRequestURL().toString() + "?" + request.getQueryString();
         request.getSession().setAttribute("url_prior_login", urlPrior);
         
         response.sendRedirect(request.getContextPath() + "/login");
         return false;
      }   
      return true;
   }
   
   
   
   @Override
   public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
         ModelAndView modelAndView) throws Exception {
      // TODO Auto-generated method stub
      HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
   }
   
   @Override
   public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
         throws Exception {
      // TODO Auto-generated method stub
      HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
   }
   
}