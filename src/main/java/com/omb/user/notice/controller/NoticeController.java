package com.omb.user.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.omb.admin.notice.service.AdmNoticeService;
import com.omb.admin.notice.vo.AdmNoticeVO;
import com.omb.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/notice/*")
@Slf4j
public class NoticeController {

	@Setter(onMethod_= @Autowired)
	private AdmNoticeService admNoticeService;
	
	
	@GetMapping("/noticeList")
	public String selectNoticeList(@ModelAttribute AdmNoticeVO nvo, Model model) {
		log.info("noticeList 호출 성공");
		
		List<AdmNoticeVO> noticeList = admNoticeService.noticeList(nvo);
		model.addAttribute("noticeList", noticeList);
		
		int total = admNoticeService.noticeListCnt(nvo);
		model.addAttribute("pageMaker", new PageDTO(nvo, total));
		
		return "user/notice/noticeList";
	
	}
	
	// event글목록 보기
		@GetMapping("/eventList")
		public String eventList(@ModelAttribute AdmNoticeVO nvo, Model model) {
			log.info("noticeList 메서드 호출");
			
			List<AdmNoticeVO> noticeList = admNoticeService.eventList(nvo);
			model.addAttribute("noticeList", noticeList);
			
			int total = admNoticeService.noticeListCnt(nvo);
			model.addAttribute("pageMaker", new PageDTO(nvo, total));
			
			return "user/notice/eventList";
		}
		
		// 상세보기
		@GetMapping("/noticeDetail")
		public String noticeDetail(@ModelAttribute AdmNoticeVO nvo, Model model) {
			log.info("noticeDetail 메서드 호출");
			
			AdmNoticeVO detail = admNoticeService.noticeDetail(nvo);
			model.addAttribute("detail", detail);
			
			return "user/notice/noticeDetail";
		}
		
		// 상세보기
		@GetMapping("/eventDetail")
		public String eventDetail(@ModelAttribute AdmNoticeVO nvo, Model model) {
			log.info("noticeDetail 메서드 호출");
			
			AdmNoticeVO detail = admNoticeService.noticeDetail(nvo);
			model.addAttribute("detail", detail);
			
			return "user/notice/eventDetail";
		}
}

