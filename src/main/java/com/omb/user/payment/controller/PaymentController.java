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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	   // 서버에서 실제 결제 완료된 금액
	   int amount = paymentService.paymentInfo(pvo.getPay_id(), token);
   
	   try {
		   int price = safeProductService.selectSafeProductPrice(spvo);  // DB에 저장된 상품 금액 가져오기

		   
		   if (price != amount) {  // 계산 된 금액과 실제 금액이 다를 때 결제 취소처리
            
			   int spStatusResult = safeProductService.updateSafeProductStatusReturn(spvo);  // 판매중으로 상태 복귀
            
			   if(spStatusResult == 1) {
            	
				   result = paymentService.paymentCancle(token, pvo.getPay_id(), "결제 금액 오류");
            	
				   if(result == 1) {
					   return "결제금액 오류로 결제취소 완료";
				   } else {
					   return "결제취소 오류 (관리자에게 문의하세요)";
				   }
			   } else return "오류가 발생했습니다. 다시 시도해주세요.";
            
		   }else {
			   resultString = "결제 성공";
            
			   // 결제 성공 시 안심상품 판매상태 "판매완료"로 변경
			   int statusResult = 0;
			   statusResult = safeProductService.updateSafeProductStatus(spvo);
            
			   if(statusResult == 1) {   // 변경 성공 시 
            	
				   // 결제 정상처리 시 결제내역에 추가
				   int payInfoInsert = paymentService.insertPaymentInfo(pvo);
               
				   if(payInfoInsert == 1) {	
					   // 결제내역 저장 성공 시 주문내역에 추가
					   PaymentVO pvoNo = paymentService.selectPaymentNo(pvo);
					   log.info("결제내역 저장 후 저장된 결제번호 조회 : " + pvoNo.getPay_no());
                   
					   ovo.setPay_no(pvoNo.getPay_no());  // 결제내역 번호 저장
                   
					   int orderInfoInsert = orderInfoService.insertOrderInfo(ovo);
                   
					   if(orderInfoInsert == 1) {  // 주문내역 저장 성공
						   return resultString;
					   } else { // 주문내역 저장 실패 시
						   int spStatusResult = safeProductService.updateSafeProductStatusReturn(spvo);  // 판매중으로 상태 복귀
						   
						   if(spStatusResult == 1) {
							   paymentService.paymentCancle(token, pvo.getPay_id(), "주문내역 저장오류");
							   return "주문내역 저장오류. 다시 시도해주세요.";
						   } else return "오류가 발생했습니다. 다시 시도해주세요.";
					   }
            	   
				   } else {  // 결제내역 저장 실패 시
					   int spStatusResult = safeProductService.updateSafeProductStatusReturn(spvo);  // 판매중으로 상태 복귀
            	   
					   if(spStatusResult == 1) {
						   paymentService.paymentCancle(token, pvo.getPay_id(), "결제내역 저장오류");
						   return "결제내역 저장오류. 다시 시도해주세요.";
					   } else return "오류가 발생했습니다. 다시 시도해주세요.";
				   }
               
			   }
            
		   }
         
	   } catch (Exception e) {
		   int spStatusResult = safeProductService.updateSafeProductStatusReturn(spvo);  // 판매중으로 상태 복귀
		   if(spStatusResult == 1) {
			   result = paymentService.paymentCancle(token, pvo.getPay_id(), "시스템 에러");
			   return "결제 에러";
		   } else return "오류가 발생했습니다. 다시 시도해주세요.";
	   }
      
	   return resultString;
   }
   
   
   @GetMapping("/cancel")
   public String paymentCancel(OrderInfoVO ovo, Model model, RedirectAttributes ras) throws IOException {
      
      log.info("전달받은 주문번호 : " + ovo.getO_no());
      
      String path = "";
      
      PaymentVO pvo = orderInfoService.selectPaymentId(ovo);   // 주문번호로 결제id 얻어오기
      
      String pay_id = pvo.getPay_id();   // 결제id 담기
      
      String token = paymentService.getToken();   // 결제 취소를 위해 토큰 발급
      
      // 주문상태 결제취소로 변경
      int result = orderInfoService.updateOrderStatusCancel(ovo);
      
      SafeProductVO spvo = new SafeProductVO();
      spvo.setSp_no(ovo.getSp_no());
      
      // 안심상품 판매상태 변경 (판매완료 -> 판매중)
      int spStatusResult = safeProductService.updateSafeProductStatusReturn(spvo);
      
      if(result == 1 && spStatusResult == 1) {
         // 상태변경 성공 시 취소처리
         paymentService.paymentCancle(token, pay_id);
         log.info("결제취소 완료");
         ras.addFlashAttribute("msg", "결제가 취소되었습니다.");
         path = "/order/buyList";
      } else {
         log.info("상태 변경 실패");
         path = "/order/buyList";
         String comment = "처리에 실패하였습니다. 관리자에게 문의해주세요.";
         model.addAttribute("changeFail", comment);
      }
      
      return "redirect:" + path;
   }
   
}