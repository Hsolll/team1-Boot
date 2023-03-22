package com.omb.admin.event.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/*")
@Slf4j
public class EventController {

	@GetMapping("eventList")
	public String eventList() {
		log.info("eventList 메서드 호출");
		
		return "admin/event/eventList";
	}
	
	@GetMapping("eventDetail")
	public String eventDetail() {
		log.info("eventDetail 메서드 호출");
		
		return "admin/event/eventDetail";
	}
	
	@GetMapping("eventupdateForm")
	public String eventupdateForm() {
		log.info("eventupdateForm 메서드 호출");
		
		return "admin/event/eventupdateForm";
	}
	
	@GetMapping("eventwriteForm")
	public String eventwriteForm() {
		log.info("eventwriteForm 메서드 호출");
		
		return "admin/event/eventwriteForm";
	}
}
