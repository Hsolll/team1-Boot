package com.omb.user.serviceCenter.faq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.omb.admin.serviceCenter.faq.vo.FaqVO;
import com.omb.common.vo.PageDTO;
import com.omb.user.serviceCenter.faq.service.FaqService;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value = "/faq/*")
@Slf4j
public class FaqController {
	
	@Setter(onMethod_=@Autowired)
	private FaqService faqService;
	
	@GetMapping(value="/faqList")
	public String faqList(@ModelAttribute FaqVO vo, Model model) {
		log.info("faqList 실행");
		List<FaqVO> faqList = faqService.selectUserFaq(vo);
		model.addAttribute("faqList", faqList);
		
		int total = faqService.selectFaqCnt(vo);
		model.addAttribute("pageMaker", new PageDTO(vo, total));
		return "user/serviceCenter/faqList";
	}
	
	@GetMapping(value="/faqDetail")
	public String faqDetail(@ModelAttribute FaqVO vo, Model model) {
		log.info("faqDetail 실행");
		FaqVO faq = faqService.selectDetail(vo);
		model.addAttribute("detail", faq);
		return "user/serviceCenter/faqDetail";
	}
	
}
