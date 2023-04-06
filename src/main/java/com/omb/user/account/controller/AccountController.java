package com.omb.user.account.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.omb.user.account.service.AccountService;
import com.omb.user.account.vo.AccountVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/account/*")
@Slf4j
public class AccountController {
	
	@Setter(onMethod_ = @Autowired)
	private AccountService accountService;

	@ResponseBody
	@PostMapping(value="/insertAccount", consumes = "application/json")
	public String insertAccount(@RequestBody AccountVO account) {
		
		log.info("전달받은 계좌 정보 : " + account);
		
		String comment = "";
		int result = 0;
		
		result = accountService.insertAccount(account);
		
		if(result == 1) {
			log.info("배송정보 등록 성공");
			comment = "success";
		} else {
			comment = "fail";
		}
		
		return comment;
	}
	
	
	@ResponseBody
	@PostMapping(value="/updateAccount", consumes = "application/json")
	public String updateAccount(@RequestBody AccountVO account) {
		
		log.info("전달받은 계좌 정보 : " + account);
		
		String comment = "";
		int result = 0;
		
		result = accountService.updateAccount(account);
		
		if(result == 1) {
			log.info("배송정보 수정 성공");
			comment = "success";
		} else {
			comment = "fail";
		}
		
		return comment;
	}
	
}
