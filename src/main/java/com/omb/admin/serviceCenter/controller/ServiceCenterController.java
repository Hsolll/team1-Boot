package com.omb.admin.serviceCenter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/*")
@Slf4j
public class ServiceCenterController {

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
	
	@GetMapping("serviceCenterwriteForm")
	public String serviceCenterwriteForm() {
		log.info("serviceCenterwriteForm 메서드 호출");
		
		return "admin/serviceCenter/serviceCenterwriteForm";
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
