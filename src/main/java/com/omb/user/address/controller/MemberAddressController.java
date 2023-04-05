package com.omb.user.address.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	@GetMapping("/deleteAddress")
	public String deleteMemberAddress(MemberAddressVO address, RedirectAttributes ras) {
		log.info("전달받은 배송지 번호 : " + address.getAdd_no());
		
		String path = "";
		int result = 0;
		result = memberAddressService.deleteMemberAddress(address);
		if(result == 1) {
			log.info("삭제 성공");
			path = "/member/addressCheck";
			ras.addFlashAttribute("msg", "배송지를 삭제하였습니다.");
		} else {
			path = "/member/addressCheck";
			ras.addFlashAttribute("msg", "배송지 삭제를 실패했습니다. 다시 시도해주세요.");
		}
		
		return "redirect:" + path;
	}
}
