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

@Controller
@RequestMapping(value = "/admin/*")
public class AdmFaqController {

	@Setter(onMethod_ = @Autowired)
	private AdmFaqService faqService;

	// FAQ 리스트 조회
	@GetMapping(value = "/faq/faqList")
	public String faqList(@ModelAttribute AdminVO admin, @ModelAttribute FaqVO vo, Model model) {
		admin = (AdminVO) model.getAttribute("adminLogin");
		List<FaqVO> faqList = faqService.selectFaq(vo);
		model.addAttribute("faqList", faqList);

		int total = faqService.selectFaqCnt(vo);
		vo.setAmount(10);
		model.addAttribute("pageMaker", new PageDTO(vo, total));
		return "admin/serviceCenter/faq/faqList";
	}

	// FAQ 등록페이지로 이동
	@RequestMapping(value = "/faq/faqInsertForm")
	public String faqInsertForm() {
		return "admin/serviceCenter/faq/faqInsertForm";
	}

	// FAQ 등록
	@PostMapping(value = "/faq/faqInsert")
	public String faqInsert(FaqVO vo, Model model) throws Exception {
		String url = "";
		int result = 0;
		result = faqService.insertFaq(vo);
		if (result == 1) {
			url = "/admin/faq/faqList";
		} else {
			url = "/admin/faq/faqInsertForm";
		}
		return "redirect:" + url;
	}

	// FAQ 업데이트 페이지로 이동
	@GetMapping("/faq/faqUpdateForm")
	public String faqUpdateForm(@ModelAttribute("adminLogin") AdminVO admin, @ModelAttribute FaqVO vo, Model model) {

		vo.setA_no(admin.getA_no());

		FaqVO faqData = faqService.updateForm(vo);

		model.addAttribute("faqData", faqData);
		return "admin/serviceCenter/faq/faqUpdateForm";
	}

	// FAQ 업데이트 
	@PostMapping(value = "/faq/faqUpdate")
	public String faqUpdate(@ModelAttribute("adminLogin") AdminVO admin, @ModelAttribute FaqVO vo) throws Exception {

		String url = "";
		int result = 0;
		result = faqService.updateFaq(vo);

		if (result == 1) {
			url = "/admin/faq/faqList";
		} else {
			url = "/admin/faq/faqUpdateForm";
		}
		return "redirect:" + url;
	}

	// FAQ 삭제 업데이트
	@GetMapping(value = "/faq/faqDelete")
	public String faqDelete(@ModelAttribute FaqVO vo) throws Exception {

		faqService.updateFaqDel(vo);

		return "redirect:/admin/faq/faqList";

	}
}
