package com.omb.user.orderInfo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.omb.admin.depositInfo.service.AdmDepositInfoService;
import com.omb.common.vo.PageDTO;
import com.omb.user.delivery.service.DeliveryService;
import com.omb.user.delivery.vo.DeliveryVO;
import com.omb.user.member.vo.MemberVO;
import com.omb.user.orderInfo.service.OrderInfoService;
import com.omb.user.orderInfo.vo.OrderInfoVO;
import com.omb.user.payment.service.PaymentService;
import com.omb.user.payment.vo.PaymentVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/order/*")
@Slf4j
public class OrderInfoController {
	
	@Setter(onMethod_ = @Autowired)
	private OrderInfoService orderInfoService;
	
	@Setter(onMethod_ = @Autowired)
	private PaymentService paymentService;
	
	@Setter(onMethod_ = @Autowired)
	private AdmDepositInfoService admDepositInfoService;
	
	@Setter(onMethod_ = @Autowired)
	private DeliveryService deliveryService;
	
	
	/* 안심거래 구매목록 조회 */
	@GetMapping("/buyList")
	public String buyOrderInfo(@ModelAttribute("data") OrderInfoVO ovo, HttpSession session, Model model) {
		
		// 로그인한 세선에서 회원정보를 꺼내온다.
		MemberVO mvo = (MemberVO)session.getAttribute("memberLogin");
		
		ovo.setU_no(mvo.getU_no());
		ovo.setAmount(20);
		
		// 서비스에서 회원번호를 매개변수로 주문목록 조회하는 쿼리 
		List<OrderInfoVO> buyList = orderInfoService.buyOrderInfoList(ovo);
		log.info("buyList : " + buyList);
		
		model.addAttribute("buyList", buyList);
		
		// 전체 레코드 수 구현 
		int total = orderInfoService.buyOrderInfoCnt(ovo); 
		//페이징 처리
		model.addAttribute("pageMaker", new PageDTO(ovo, total));
		
		return "user/orderInfo/buyList";
	}
	
	
	/* 안심거래 판매목록 조회 */
	@GetMapping("/sellList")
	public String safeProductSellList(@ModelAttribute("data") OrderInfoVO ovo, HttpSession session, Model model) {
		
		// 로그인한 세선에서 회원정보를 꺼내온다.
		MemberVO mvo = (MemberVO)session.getAttribute("memberLogin");
		log.info("회원정보 : " + mvo);
		log.info("회원번호 : " + mvo.getU_no());
		
		ovo.setU_no(mvo.getU_no());
		ovo.setAmount(5);
		
		// 서비스에서 회원번호를 매개변수로 주문목록 조회하는 쿼리 
		List<OrderInfoVO> sellList = orderInfoService.sellOrderInfoList(ovo);
		log.info("sellList : " + sellList);
		
		model.addAttribute("sellList", sellList);
		
		// 전체 레코드 수 구현 
		int total = orderInfoService.sellOrderInfoCnt(ovo); 
		//페이징 처리
		model.addAttribute("pageMaker", new PageDTO(ovo, total));
		
		return "user/orderInfo/sellCompleteList";
	}
	
	/* 구매목록 상세 조회 */
	@GetMapping("/buyListDetail")
	public String orderBuyListDetail(OrderInfoVO ovo, Model model) throws IOException {
		log.info("전달받은 주문번호 : " + ovo.getO_no());
		
		OrderInfoVO detail = orderInfoService.selectOrderInfoDetail(ovo);
		log.info("주문 상세 조회 결과 : " + detail);
		
		model.addAttribute("detail", detail);
		log.info("구매목록 상세조회 : " + detail);
		/* ajax로 대체
		// 결제 내역 조회를 위해 토큰 생성
		String token = paymentService.getToken();
		log.info("토큰 : " + token);
		
		// 결제 상세내역 조회
		String paymentDetail = paymentService.paymentDetailInfo(detail.getPay_id(), token);
	    log.info("결제 상세내역 : " + paymentDetail);
	    
		model.addAttribute("paymentDetail", paymentDetail);
		*/
		
		return "user/orderInfo/buyListDetail";
	}
	
	/* 판매목록 상세 조회 */
	@GetMapping("/sellListDetail")
	public String orderSellListDetail(OrderInfoVO ovo, Model model) throws IOException {
		log.info("전달받은 주문번호 : " + ovo.getO_no());
		
		OrderInfoVO detail = orderInfoService.selectOrderInfoDetail(ovo);
		
		model.addAttribute("detail", detail);
		log.info("판매목록 상세조회 : " + detail);
		
		// 운송장 등록여부 확인
		DeliveryVO delivery = deliveryService.selectDeliveryInfo(ovo);
		log.info("주문번호로 조회한 배송 정보 : " + delivery);
		
		model.addAttribute("delivery", delivery);
		
		return "user/orderInfo/sellListDetail";
	}
	
	@ResponseBody
	@PostMapping(value = "/paymentDetail", consumes = "application/json")
	public String paymentDetailInfo(@RequestBody PaymentVO pvo) throws IOException{
		
		log.info("전달받은 결제번호 : " + pvo.getPay_id());
		
		// 결제 내역 조회를 위해 토큰 생성
		String token = paymentService.getToken();
		log.info("토큰 : " + token);
		
		// 결제 상세내역 조회
		String paymentDetail = paymentService.paymentDetailInfo(pvo.getPay_id(), token);
	    log.info("결제 상세내역 : " + paymentDetail);
		
		return paymentDetail;
	}
	
	
	/* 상품 발송 시 주문상태 배송중으로 변경 */
	@GetMapping("/send")
	public String updateOrderStatusSend(OrderInfoVO ovo, RedirectAttributes ras) {
		log.info("전달받은 주문번호 : " + ovo.getO_no()); 
		String path = "";
		int result = 0;
		
		result = orderInfoService.updateOrderStatusSend(ovo);
		
		if(result == 1) {
			log.info("주문상태 변경 완료");
			ras.addFlashAttribute("msg", "발송완료 처리되었습니다.");
			path = "/order/sellList";
		} else {
			log.info("주문상태 변경 실패");
			ras.addFlashAttribute("msg", "발송처리를 실패했습니다. 다시 시도해주세요.");
			path = "/order/sellList";
		}
		
		return "redirect:" + path;
	}
	
	
	/* 구매확정 상태변경 */
	@ResponseBody
	@GetMapping("/confirm")
	public String updateOrderStatusConfirm(HttpSession session, OrderInfoVO ovo) {
		
		log.info("전달받은 주문번호 : " + ovo);
		String comment = "";
		int result = 0;
		
		result = orderInfoService.updateOrderStatusConfirm(ovo);
		
		if(result == 1) {	// 상태변경 성공 시 입금정보 추가
			log.info("주문상태 : 거래완료");
			// 주문상품 금액 조회
			OrderInfoVO price = orderInfoService.selectOrderInfoPrice(ovo);
			ovo.setSp_price(price.getSp_price());
			log.info("금액 조회 후 ovo : " + ovo);
			
			int depositResult =  admDepositInfoService.insertDepositInfo(ovo);
			if(depositResult == 1) {
				log.info("입금정보 추가 성공");
				comment = "처리성공";
			}
			
		} else {
			log.info("거래상태 변경 실패");
			comment = "다시 시도해주세요.";
		}
		return comment;
	}
	
	
	@GetMapping("/complete")
	public String complete(OrderInfoVO ovo, RedirectAttributes ras) {
		log.info("complete 메서드 호출");
		log.info("complete 전달받은 주문번호 : " + ovo);
		
		String path = "";
		int resultSafe = 0;
		int resultProduct = 0;
		
		resultSafe = orderInfoService.updateCompleteSafe(ovo);
		resultProduct = orderInfoService.updateCompleteProduct(ovo);
		
		if(resultSafe == 1 && resultProduct == 1) {
			log.info("상품 판매상태 변경 완료");
			ras.addFlashAttribute("msg", "구매확정 되었습니다.");
			path = "/order/buyList";
		} else {
			ras.addFlashAttribute("msg", "다시 시도해주세요.");
			path = "/order/buyList";
		}
		
		return "redirect:" + path;
	}

}
