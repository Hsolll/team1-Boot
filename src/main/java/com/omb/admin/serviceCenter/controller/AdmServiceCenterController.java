package com.omb.admin.serviceCenter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/*")
@Slf4j
public class AdmServiceCenterController {

	@GetMapping("serviceCenterList")
	public String serviceCenterList() {
		log.info("serviceCenterList 메서드 호출");
		
		return "admin/serviceCenter/serviceCenterList";
	}
	
	@GetMapping("serviceCenterDetail")
	public String serviceCenterDetail() {
		log.info("serviceCenterDetail 메서드 호출");
		
		return "admin/serviceCenter/serviceCenterDetail";
	}
	
	@GetMapping("serviceCenterWriteForm")
	public String serviceCenterwriteForm() {
		log.info("serviceCenterWriteForm 메서드 호출");
		
		return "admin/serviceCenter/serviceCenterWriteForm";
	}
	
	@GetMapping("serviceCenterupdateForm")
	public String serviceCenterupdateForm() {
		log.info("serviceCenterupdateForm 메서드 호출");
		
		return "admin/serviceCenter/serviceCenterupdateForm";
	}
	
	@GetMapping("serviceCenterReplyDetail")
	public String serviceCenterReplyDetail() {
		log.info("serviceCenterReplyDetail 메서드 호출");
		
		return "admin/serviceCenter/serviceCenterReplyDetail";
	}
}
