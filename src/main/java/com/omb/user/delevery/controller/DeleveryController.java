package com.omb.user.delevery.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.omb.user.delevery.service.DeleveryService;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/delevery/*")
@Slf4j
public class DeleveryController {
	
	@Setter(onMethod_ = @Autowired)
	private DeleveryService deleveryService;
	
	@ResponseBody
	@GetMapping(value="/codeSearch", produces = MediaType.TEXT_PLAIN_VALUE)
	public String companyList() throws IOException {
		
		String companyList = deleveryService.companyList();
		
		log.info("code : " + companyList);
		
		return companyList;
	}

}
