package com.omb.user.delivery.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.omb.user.delivery.service.DeliveryService;
import com.omb.user.delivery.vo.DeliveryVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/delivery/*")
@Slf4j
public class DeliveryController {
	
	@Setter(onMethod_ = @Autowired)
	private DeliveryService deliveryService;
	
	@ResponseBody
	@GetMapping(value="/codeSearch", produces = MediaType.TEXT_PLAIN_VALUE)
	public String companyList() throws IOException {
		
		String companyList = deliveryService.companyList();
		
		log.info("code : " + companyList);
		
		return companyList;
	}
	
	@ResponseBody
	@GetMapping(value = "/deliveryTracking", produces = MediaType.TEXT_PLAIN_VALUE)
	public String deliveryTracking(DeliveryVO delivery) throws IOException{
		
		log.info("전달받은 주문번호 : " + delivery);
		String trackingInfo = "";
		DeliveryVO detail = deliveryService.selectDeliveryInfo(delivery);
		log.info("주문번호로 조회한 배송 정보 : " + detail);
		if(detail != null) {
			trackingInfo = deliveryService.deliveryTracking(detail);
		} else {
			trackingInfo = "배송정보없음";
		}
		
		return trackingInfo;
	}
	
	@ResponseBody
	@PostMapping(value="/insertDelivery", consumes = "application/json")
	public String insertDeliveryInfo(@RequestBody DeliveryVO delivery) {
		
		log.info("전달받은 운송장 정보 : " + delivery);
		
		int result = 0;
		String comment = "";
		
		result = deliveryService.insertDeliveryInfo(delivery);
		
		if(result == 1) {
			log.info("배송정보 등록 성공");
			comment = "success";
		} else {
			comment = "fail";
		}
		return comment;
	}
	
	@ResponseBody
	@PostMapping(value="/updateDelivery", consumes = "application/json")
	public String updateDeliveryInfo(@RequestBody DeliveryVO delivery) {
		
		log.info("전달받은 운송장 정보 : " + delivery);
		
		int result = 0;
		String comment = "";
		
		result = deliveryService.updateDeliveryInfo(delivery);
		
		if(result == 1) {
			log.info("배송정보 수정 성공");
			comment = "success";
		} else {
			comment = "fail";
		}
		return comment;
	}
	
	/* 배송 정보 조회 메서드 */
	@ResponseBody
	@GetMapping("/deliveryInfo")
	public DeliveryVO selectDeliveryInfo(DeliveryVO delivery, Model model) {
		log.info("전달받은 주문번호 : " + delivery);
		
		DeliveryVO detail = deliveryService.selectDeliveryInfo(delivery);
		
		log.info("조회 결과 : " + detail);
		
		return detail;
	}

}
