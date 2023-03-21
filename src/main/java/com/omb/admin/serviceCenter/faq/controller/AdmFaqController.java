package com.omb.admin.serviceCenter.faq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.omb.admin.serviceCenter.faq.service.AdmFaqService;
import com.omb.admin.serviceCenter.faq.vo.FaqVO;
import com.omb.admin.vo.AdminVO;
import com.omb.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value = "/admin/*")
@Slf4j
public class AdmFaqController {
	
	
	@Setter(onMethod_ = @Autowired)
	private AdmFaqService faqService;

	@GetMapping(value = "/faqList")
	public String faqList(@ModelAttribute FaqVO vo, Model model) {
		log.info("faqList 실행...");
		List<FaqVO> faqList = faqService.selectFaq(vo);
		model.addAttribute("faqList", faqList);

		int total = faqService.selectFaqCnt(vo);
		vo.setAmount(20);
		model.addAttribute("pageMaker", new PageDTO(vo, total));
		return "admin/serviceCenter/faqList";
	}

	@RequestMapping(value = "/faqInsertForm")
	public String faqInsertForm() {
		log.info("insertForm 실행...");
		return "admin/serviceCenter/faqInsertForm";
	}

	@PostMapping(value = "/faqInsert")
	public String faqInsert(FaqVO vo, Model model) throws Exception {
		String url = "";
		int result = 0;
		result = faqService.insertFaq(vo);
		if (result == 1) {
			url = "/admin/faqList";
		} else {
			url = "/admin/faqInsertForm";
		}
		return "redirect:" + url;
	}

	@GetMapping("/faqUpdateForm")
	public String faqUpdateForm(@ModelAttribute("adminLogin") AdminVO admin, @ModelAttribute FaqVO vo, Model model) {
		log.info("updateForm 실행...");
		log.info("f_no = " + vo.getF_no());

		vo.setA_no(admin.getA_no());

		FaqVO faqData = faqService.updateForm(vo);

		model.addAttribute("faqData", faqData);
		return "admin/serviceCenter/faqUpdateForm";
	}

	@PostMapping(value = "/faqUpdate")
	public String faqUpdate(@ModelAttribute("adminLogin") AdminVO admin, @ModelAttribute FaqVO vo) throws Exception {
		log.info("faqUpdate 실행...");

		String url = "";
		int result = 0;
		result = faqService.updateFaq(vo);

		if (result == 1) {
			url = "/admin/faqList";
		} else {
			url = "/admin/faqUpdateForm";
		}
		return "redirect:" + url;
	}
	
	@GetMapping(value="/faqDelete")
	public String faqDelete(@ModelAttribute FaqVO vo) throws Exception {

		log.info("faqDelete 실행...");
		log.info("f_no = " + vo.getF_no());
		int result = faqService.updateFaqDel(vo);
		log.info("실행 결과 : " + result);

		return "redirect:/admin/faqList";

	}
}
