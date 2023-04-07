package com.omb.user.interceptor;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.omb.admin.member.vo.AdmMemberVO;
import com.omb.user.member.vo.MemberVO;


 
 
@Component
public class LoginInterceptor implements HandlerInterceptor {
 
    private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
      
    // 요청을 컨트롤러에 보내기 전 작업
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        
        logger.info("LoginInterceptor - {}", "호출완료");
        
        HttpSession session = request.getSession();
        MemberVO mvo =(MemberVO) session.getAttribute("memberLogin");
        
        AdmMemberVO amvo =(AdmMemberVO) session.getAttribute("adminLogin");
        
		if (mvo != null/* || amvo != null */) {
            return true;
        } else {
              try { 
            	  response.setContentType("text/html; charset=UTF-8");
              PrintWriter out = response.getWriter();
              out.println("<script>alert('로그인이 필요합니다. 로그인페이지로 이동합니다.'); location.href='/login';</script>");
              out.flush();
                  //response.sendRedirect("/login"); 
              } catch (IOException e) {
                  e.printStackTrace(); 
              }
            return false;
            
        }
    }      
}