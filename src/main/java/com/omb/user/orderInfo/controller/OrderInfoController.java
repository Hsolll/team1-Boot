package com.omb.user.orderInfo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	
	/* 구매확정 상태변경 */
	@GetMapping("/confirm")
	public String updateOrderStatusConfirm(HttpSession session, OrderInfoVO ovo) {
		String path = "";
		int result = 0;
		
		result = orderInfoService.updateOrderStatusConfirm(ovo);
		
		if(result == 1) {	// 상태변경 성공 시 입금정보 추가
			
			// 주문상품 금액 조회
			OrderInfoVO price = orderInfoService.selectOrderInfoPrice(ovo);
			ovo.setSp_price(price.getSp_price());
			
			int depositResult =  admDepositInfoService.insertDepositInfo(ovo);
			if(depositResult == 1) {
				log.info("입금정보 추가 성공");
				path = "/order/buyList";
			}
			
		} else {
			path = "/order/buyList";
		}
		
		
		return "redirect:" + path;
	}

}
