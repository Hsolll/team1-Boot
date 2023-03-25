package com.omb.user.payment.controller;


import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.omb.user.payment.service.PaymentService;
import com.omb.user.payment.vo.PaymentVO;
import com.omb.user.safeProduct.service.SafeProductService;
import com.omb.user.safeProduct.vo.SafeProductVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/payments/*")
@Slf4j
public class PaymentController {

	@Setter(onMethod_ = @Autowired)
	private PaymentService paymentService;
	
	@Setter(onMethod_ = @Autowired)
	private SafeProductService safeProductService;

	@ResponseBody
	@PostMapping(value="/complete", produces = MediaType.TEXT_PLAIN_VALUE)
	public String paymentComplete(HttpSession session, PaymentVO pvo, SafeProductVO spvo, String o_id)
			throws IOException {
		
		int result = 0;
		
		String token = paymentService.getToken();

		log.info("토큰 : " + token);
		
		// ajax로 전달받은 데이터 확인
		log.info("--------------ajax로 전달받은 데이터 확인--------------");
		log.info("pvo : " + pvo);
		log.info("spvo : " + spvo);
		log.info("상품번호 : " + spvo.getSp_no());
		log.info("o_id : " + o_id);

		// 결제 완료된 금액
		int amount = paymentService.paymentInfo(pvo.getPay_id(), token);
		log.info("결제 완료된 금액 amount : " + amount);
		
		String resultString = null;
		try {

			// DB에 저장된 상품 금액 가져오기
			int price = 0;
			price = safeProductService.selectSafeProductPrice(spvo);
			
			log.info("DB에 저장된 금액 price : " + price);

			// 계산 된 금액과 실제 금액이 다를 때
			if (price != amount) {
				result = paymentService.paymentCancle(token, pvo.getPay_id(), "결제 금액 오류");
				
				log.info("취소요청 후 결과 result : " + result);
				
				if(result == 1) {
					
					return "결제 금액 오류, 결제 취소";					
					
				}
			}else {
				resultString = "결제 성공";

				// 결제 정상처리 시 결제내역, 주문내역 추가
				int payInfoInsert = 0;
				payInfoInsert = paymentService.insertPaymentInfo(pvo);
				
				if(payInfoInsert == 1) {
					log.info("결제내역 저장 성공");
				} else {
					log.info("결제내역 저장 실패");
					paymentService.paymentCancle(token, pvo.getPay_id(), "결제 내역 저장 오류");
				}
				
			}
			
		} catch (Exception e) {
			result = paymentService.paymentCancle(token, pvo.getPay_id(), "결제 에러");
			return "결제 에러";
		}
		
		return resultString;
	}
	
	
}
