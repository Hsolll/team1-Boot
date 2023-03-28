package com.omb.user.payment.controller;


import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.omb.user.orderInfo.service.OrderInfoService;
import com.omb.user.orderInfo.vo.OrderInfoVO;
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
	
	@Setter(onMethod_ = @Autowired)
	private OrderInfoService orderInfoService;

	@ResponseBody
	@PostMapping(value="/complete", produces = MediaType.TEXT_PLAIN_VALUE)
	public String paymentComplete(HttpSession session, PaymentVO pvo, SafeProductVO spvo, OrderInfoVO ovo)
			throws IOException {
		
		int result = 0;
		
		String resultString = null;
		
		// 결제된 금액 조회를 위해 토큰 생성
		String token = paymentService.getToken();
		log.info("토큰 : " + token);
		
		// ajax로 전달받은 데이터 확인
		log.info("--------------ajax로 전달받은 데이터 확인--------------");
		log.info("pvo : " + pvo);
		log.info("spvo : " + spvo);
		log.info("ovo : " + ovo);
		log.info("상품번호 : " + spvo.getSp_no());
		log.info("o_id : " + ovo.getO_id());

		// 결제 완료된 금액
		int amount = paymentService.paymentInfo(pvo.getPay_id(), token);
		log.info("결제 완료된 금액 amount : " + amount);
	
		try {

			// DB에 저장된 상품 금액 가져오기
			int price = 0;
			price = safeProductService.selectSafeProductPrice(spvo);
			
			log.info("DB에 저장된 금액 price : " + price);

			// 계산 된 금액과 실제 금액이 다를 때 결제 취소처리
			if (price != amount) {
				
				result = paymentService.paymentCancle(token, pvo.getPay_id(), "결제 금액 오류");
				
				log.info("취소요청 후 결과 result : " + result);
				
				if(result == 1) {
					return "결제 금액 오류, 결제 취소";
				} else {
					return "결제 취소 오류 (관리자에게 문의하세요)";
				}
			}else {
				resultString = "결제 성공";
				
				// 결제 성공 시 안심상품 판매상태 "판매완료"로 변경
				int statusResult = 0;
				statusResult = safeProductService.updateSafeProductStatus(spvo);
				
				if(statusResult == 1) {	// 변경 성공 시 
					log.info("판매상태 변경 완료");
				} 
				
				// 주문 시 회원이 수령인 주소를 다른 주소로 입력했을 시 주소테이블에 추가

				// 결제 정상처리 시 결제내역에 추가
				int payInfoInsert = 0;
				payInfoInsert = paymentService.insertPaymentInfo(pvo);
				
				if(payInfoInsert == 1) {
					log.info("결제내역 저장 성공");
				} else {
					log.info("결제내역 저장 실패");
					paymentService.paymentCancle(token, pvo.getPay_id(), "결제 내역 저장 오류로 결제취소");
					return "결제 내역 저장 오류로 결제취소";
				}
				
				// 결제 정상 처리 시 주문내역에 추가
				PaymentVO pvoNo = paymentService.selectPaymentNo(pvo);
				log.info("결제내역 저장 후 저장된 결제번호 조회 : " + pvoNo.getPay_no());
				
				ovo.setPay_no(pvoNo.getPay_no());
				log.info("결제내역 추가 후 ovo : " + ovo);
				
				int orderInfoInsert = 0;
				orderInfoInsert = orderInfoService.insertOrderInfo(ovo);
				
				if(orderInfoInsert == 1) {
					log.info("주문내역 저장 성공");
				} else {
					log.info("주문내역 저장 실패");
					paymentService.paymentCancle(token, pvo.getPay_id(), "주문 내역 저장 오류로 결제취소");
					return "주문 내역 저장 오류로 결제취소";
				}
				
			}
			
		} catch (Exception e) {
			result = paymentService.paymentCancle(token, pvo.getPay_id(), "결제 에러");
			return "결제 에러";
		}
		
		return resultString;
	}
	
	
	@GetMapping("/cancel")
	public String paymentCancel(OrderInfoVO ovo, Model model) throws IOException {
		
		log.info("전달받은 주문번호 : " + ovo.getO_no());
		
		String path = "";
		
		PaymentVO pvo = orderInfoService.selectPaymentId(ovo);	// 주문번호로 결제id 얻어오기
		
		String pay_id = pvo.getPay_id();	// 결제id 담기
		
		String token = paymentService.getToken();	// 결제 취소를 위해 토큰 발급
		
		
		
		// 취소완료 후 주문상태 결제취소로 변경
		int result = orderInfoService.updateOrderStatus(ovo);
		
		if(result == 1) {
			// 상태변경 성공 시 취소처리
			paymentService.paymentCancle(token, pay_id);
			log.info("결제취소 완료");
			path = "/order/buyList";
		} else {
			log.info("주문상태 변경 실패");
			path = "/order/buyList";
			String comment = "처리에 실패하였습니다. 관리자에게 문의해주세요.";
			model.addAttribute("changeFail", comment);
		}
		
		return "redirect:" + path;
	}
	
}
