package com.omb.admin.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.omb.admin.notice.service.AdmNoticeService;
import com.omb.admin.notice.vo.AdmNoticeVO;
import com.omb.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor
@Controller
@RequestMapping("/admin/*")
@Slf4j
public class AdmNoticeController {

	@Setter(onMethod_= @Autowired)
	private AdmNoticeService admNoticeService;
	
	// 글목록 보기
	@GetMapping("/noticeList")
	public String noticeList(@ModelAttribute AdmNoticeVO nvo, Model model) {
		log.info("noticeList 메서드 호출");
		
		List<AdmNoticeVO> noticeList = admNoticeService.noticeList(nvo);
		model.addAttribute("noticeList", noticeList);
		
		int total = admNoticeService.noticeListCnt(nvo);
		model.addAttribute("pageMaker", new PageDTO(nvo, total));
		
		return "admin/notice/noticeList";
	}
	
	// event글목록 보기
	@GetMapping("/eventList")
	public String eventList(@ModelAttribute AdmNoticeVO nvo, Model model) {
		log.info("noticeList 메서드 호출");
		
		List<AdmNoticeVO> noticeList = admNoticeService.eventList(nvo);
		model.addAttribute("noticeList", noticeList);
		
		int total = admNoticeService.eventListCnt(nvo);
		model.addAttribute("pageMaker", new PageDTO(nvo, total));
		
		return "admin/notice/eventList";
	}
	
	// 글쓰기 구현
	@RequestMapping(value="/noticeInsert", method = RequestMethod.POST)
	public String noticeInsert(AdmNoticeVO nvo, Model model) throws Exception{
		log.info("noticeInsert 호출 성공");
		
		int result = 0;
		String url = "";
		result = admNoticeService.noticeInsert(nvo);
		
		if(result == 1) {
			url = "/admin/noticeList";
		}else {
			url = "/admin/noticeWriteForm";
		}
		return "redirect:"+url;
	}
	
	
	// 상세보기
	@GetMapping("/noticeDetail")
	public String noticeDetail(@ModelAttribute AdmNoticeVO nvo, Model model) {
		log.info("noticeDetail 메서드 호출");
		
		AdmNoticeVO detail = admNoticeService.noticeDetail(nvo);
		model.addAttribute("detail", detail);
		
		return "admin/notice/noticeDetail";
	}
	
	// 상세보기
	@GetMapping("/eventDetail")
	public String eventDetail(@ModelAttribute AdmNoticeVO nvo, Model model) {
		log.info("noticeDetail 메서드 호출");
		
		AdmNoticeVO detail = admNoticeService.noticeDetail(nvo);
		model.addAttribute("detail", detail);
		
		return "admin/notice/eventDetail";
	}
	
	//글쓰기 폼 출력
	@RequestMapping(value="/noticeWriteForm")
	public String noticewriteForm() {
		log.info("noticeWriteForm 메서드 호출");
		
		return "admin/notice/noticeWriteForm";
	}
	
	// 글수정 폼 출력
	@RequestMapping(value="/noticeUpdateForm")
	public String noticeupdateForm(@ModelAttribute AdmNoticeVO nvo, Model model) {
		log.info("noticeUpdateForm 메서드 호출");
		log.info("an_no =" + nvo.getAn_no());
		
		AdmNoticeVO updateData = admNoticeService.noticeupdateForm(nvo);
		
		model.addAttribute("updateData", updateData);
		return "admin/notice/noticeUpdateForm";
	}
	
	// 글수정 구현
	@RequestMapping(value="/noticeUpdate", method = RequestMethod.POST)
	public String noticeUpdate(@ModelAttribute AdmNoticeVO nvo) throws Exception{
		log.info("noticeUpdate 호출 성공");
		log.info("AdmNoticeVO" + nvo);
		
		int result = 0;
		String url ="";
		
		result = admNoticeService.noticeUpdate(nvo);
		
		if(result == 1) {
			url="/admin/noticeDetail?an_no="+nvo.getAn_no();
		}else {
			url="/admin/noticeUpdateForm?an_no="+nvo.getAn_no();
		}
		
		return "redirect:"+url;
	}
	
	@RequestMapping(value="/noticeDelete")
	public String noticeDelete(@ModelAttribute AdmNoticeVO nvo) throws Exception{
		log.info("noticeDelete 호출 성공");
		log.info("삭제할 글번호:" + nvo.getAn_no());
		
		int result = 0;
		String url = "";
		
		result = admNoticeService.noticeDelete(nvo);
		
		if(result == 1) {
			url="/admin/noticeList";
		}else {
			url="/admin/noticeDetail?an_no"+nvo.getAn_no();
		}
		return "redirect:"+url;
	}
}

