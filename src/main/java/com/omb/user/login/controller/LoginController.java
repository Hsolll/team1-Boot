package com.omb.user.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

//import com.omb.user.member.service.MemberService;
import com.omb.user.member.vo.MemberVO;
import com.omb.user.memberLogin.service.MemberLoginService;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
//@SessionAttributes("memberLogin")
@RequestMapping("/*")
@Slf4j
public class LoginController {
	
	@Setter(onMethod_= @Autowired)
	private MemberLoginService memberLoginService;
	
	
	/*@ModelAttribute
	public MemberVO memberLogin() {
		return new MemberVO();
	}*/
	
	@GetMapping("/login")
	public String loginForm() {
		log.info("로그인 화면 호출");
		
		return "user/login/loginForm";
	}
	@GetMapping("/result")
	public String index() {
		log.info("메인호출");
		
		return "user/login/index";
	}
	
	/*@PostMapping("/login")
	public String loginProcess(MemberVO login, Model model, RedirectAttributes ras) {
		String url="";
		MemberVO memberLogin = memberLoginService.loginProcess(login);
		log.info("로그인 성공");
		if(memberLogin !=null) {
			model.addAttribute("memberLogin", memberLogin);
			url ="/member/mypage";
		}else {
			ras.addFlashAttribute("errorMsg","로그인 실패");
			url = "/member/login";
		}
		return "redirect:"+url;
	}*/
	
	@PostMapping("/login")
	public String login(HttpSession session , MemberVO mvo, RedirectAttributes ras) {
		
		MemberVO memberLogin = memberLoginService.memberLogin(mvo);
		String url="";
		if(memberLogin !=null) {
			session.setAttribute("memberLogin", memberLogin);
			url ="/";						
		}else {	
			ras.addFlashAttribute("errorMsg","로그인 실패");
			url = "/login";
		}
		return "redirect:"+url;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		log.info("로그아웃 처리");
		session.invalidate();
		return "redirect:/";
	}
	
	
		
	
}