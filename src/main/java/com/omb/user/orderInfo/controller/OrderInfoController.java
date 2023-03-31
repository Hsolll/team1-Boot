package com.omb.user.orderInfo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.omb.admin.depositInfo.service.AdmDepositInfoService;
import com.omb.user.member.vo.MemberVO;
import com.omb.user.orderInfo.service.OrderInfoService;
import com.omb.user.orderInfo.vo.OrderInfoVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/order/*")
@Slf4j
public class OrderInfoController {
	
	@Setter(onMethod_ = @Autowired)
	private OrderInfoService orderInfoService;
	
	@Setter(onMethod_ = @Autowired)
	private AdmDepositInfoService admDepositInfoService;
	
	
	/* 안심거래 구매목록 조회 */
	@GetMapping("/buyList")
	public String buyOrderInfo(HttpSession session, Model model) {
		
		// 로그인한 세선에서 회원정보를 꺼내온다.
		MemberVO mvo = (MemberVO)session.getAttribute("memberLogin");
		
		// 서비스에서 회원번호를 매개변수로 주문목록 조회하는 쿼리 
		List<OrderInfoVO> buyList = orderInfoService.buyOrderInfoList(mvo);
		log.info("buyList : " + buyList);
		
		model.addAttribute("buyList", buyList);
		
		return "user/orderInfo/buyList";
	}
	
	
	/* 안심거래 판매목록 조회 */
	@GetMapping("/sellList")
	public String safeProductSellList(HttpSession session, Model model) {
		
		// 로그인한 세선에서 회원정보를 꺼내온다.
		MemberVO mvo = (MemberVO)session.getAttribute("memberLogin");
		log.info("회원정보 : " + mvo);
		log.info("회원번호 : " + mvo.getU_no());
		
		// 서비스에서 회원번호를 매개변수로 주문목록 조회하는 쿼리 
		List<OrderInfoVO> sellList = orderInfoService.sellOrderInfoList(mvo);
		log.info("sellList : " + sellList);
		
		model.addAttribute("sellList", sellList);
		
		return "user/orderInfo/sellCompleteList";
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
