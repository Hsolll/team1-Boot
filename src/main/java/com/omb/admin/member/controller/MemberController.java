package com.omb.admin.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.omb.admin.member.service.MemberService;
import com.omb.admin.member.vo.MemberVO;
import com.omb.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor
@Controller
@RequestMapping("/admin/*")
@Slf4j
public class MemberController {

	@Setter(onMethod_= @Autowired)
	private MemberService memberService;
	
	
	@GetMapping("/memberList")
	public String memberList(@ModelAttribute MemberVO mvo, Model model) {
		log.info("memberList 메서드 확인");
		
		List<MemberVO> memberList = memberService.memberList(mvo);
		model.addAttribute("memberList", memberList);
		
		int total = memberService.memberListCnt(mvo);
		
		model.addAttribute("pageMaker", new PageDTO(mvo, total));
		
		return "admin/memberMng/memberList";
	}
	
	@GetMapping("/memberDetail")
	public String memberDetail(@ModelAttribute MemberVO mvo, Model model) {
		log.info("memberDetail 메서드 확인");
		
		MemberVO detail = memberService.memberDetail(mvo);
		model.addAttribute("detail", detail);
		
		return "admin/memberMng/memberDetail";
	}
	
	
	@GetMapping("/nmemberList")
	public String nmemberList(@ModelAttribute MemberVO mvo, Model model) {
		log.info("nmemeberList 메서드 확인");
		
		List<MemberVO> nmemberList = memberService.nmemberList(mvo);
		model.addAttribute("nmemberList", nmemberList);
		
		
		
		return "admin/memberMng/nmemberList";
	}
	
	@GetMapping("/nmemberDetail")
	public String nmemberDetail(@ModelAttribute MemberVO mvo, Model model) {
		log.info("nmemberDetail 메서드 확인");
		
		MemberVO detail = memberService.memberDetail(mvo);
		model.addAttribute("detail", detail);
		
		return "admin/memberMng/nmemberDetail";
	}
}
