package com.omb.admin.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/*")
@Slf4j
public class NoticeController {

	@GetMapping("noticeList")
	public String noticeList() {
		log.info("noticeList 메서드 호출");
		
		return "admin/notice/noticeList";
	}
	
	@GetMapping("noticeDetail")
	public String noticeDetail() {
		log.info("noticeDetail 메서드 호출");
		
		return "admin/notice/noticeDetail";
	}
	
	@GetMapping("noticewriteForm")
	public String noticewriteForm() {
		log.info("noticewriteForm 메서드 호출");
		
		return "admin/notice/noticewriteForm";
	}
	
	@GetMapping("noticeupdateForm")
	public String noticeupdateForm() {
		log.info("noticewriteForm 메서드 호출");
		
		return "admin/notice/noticeupdateForm";
	}
}
