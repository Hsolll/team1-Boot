package com.omb.user.address.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.omb.user.address.service.MemberAddressService;
import com.omb.user.address.vo.MemberAddressVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/address/*")
@Slf4j
public class MemberAddressController {
	
	@Setter(onMethod_ = @Autowired)
	private MemberAddressService memberAddressService;
	
	@ResponseBody
	@PostMapping(value="/insert", produces = MediaType.TEXT_PLAIN_VALUE)
	public String insertMemberAddress(MemberAddressVO addvo) {
		
		String result = "";
		
		// ajax로 전달받은 데이터 확인
		log.info("--------------ajax로 전달받은 데이터 확인--------------");
		log.info("addvo : " + addvo);
		
		int row = memberAddressService.insertMemberAddress(addvo);
		
		if(row == 1) {
			result = "배송지 등록 성공";			
		} else {
			result="배송지 등록 실패 입력하신 주소를 다시 확인해주세요.";
		}
		
		return result;
	}
	@ResponseBody
	@GetMapping("/findAddress")
	public MemberAddressVO findAddress(MemberAddressVO address) {
		log.info("ajax로 전달받은 값 : " + address);
		
		MemberAddressVO addvo = memberAddressService.memberAddressInfoNo(address);
		log.info("주소 조회 후 반환받은 객체 : " + addvo);
		
		return addvo;
	}
}
