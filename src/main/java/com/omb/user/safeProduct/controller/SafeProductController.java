package com.omb.user.safeProduct.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.omb.user.safeProduct.service.SafeProductService;
import com.omb.user.safeProduct.vo.SafeProductVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/safe/*")
@Slf4j
public class SafeProductController {
	
	@Setter(onMethod_ = @Autowired)
	private SafeProductService safeProductService;
	
	
	/* 안심거래 상품목록 조회 */
	@GetMapping("/productList")
	public String selectSafeProductList(Model model) {
		
		log.info("selectSafeProductList 호출 성공");
		
		// 전체 레코드 조회
		List<SafeProductVO> safeProduct = safeProductService.selectSafeProductList();
		model.addAttribute("safeProduct", safeProduct);
		
		return "user/safeProduct/safeProductList";	// /WEB-INF/views/safeProduct/safeProductList.jsp
	}
	
	/* 안심거래 상품 상세 */
	@GetMapping("/productDetail")
	public String selectSafeProductDetail(SafeProductVO spvo, Model model) {
		
		log.info("selectSafeProductDetail 호출 성공");
		
		// 전체 레코드 조회
		SafeProductVO detail = safeProductService.selectSafeProductDetail(spvo);
		model.addAttribute("detail", detail);
		
		return "user/safeProduct/safeProductDetail";
	}
	
	
	/* 주문 페이지 이동 */
	@GetMapping("/productOrder")
	public String selectSafeProductOrder(SafeProductVO spvo, Model model) {

		log.info("selectSafeProductOrder 호출 성공");
		
		// 상품 정보 조회
		SafeProductVO detail = safeProductService.selectSafeProductDetail(spvo);
		model.addAttribute("detail", detail);
		
		// 주소 정보 조회
		
		
		return "user/safeProduct/safeProductOrder";
	}
	
	
	/* 물품 등록 페이지 이동 */
	@GetMapping("/productInsertView")
	public String safeProductInsertView() {
		
		return "user/safeProduct/safeProductInsertView";
	}

	
	/* 안심거래 구매목록 조회 */
	@GetMapping("/productBuy")
	public String safeProductBuyList() {
		
		// 서비스에서 주문목록 조회하는 쿼리 
		
		return "user/safeProduct/safeProductBuyList";
	}
	
	
	/* 안심거래 판매목록 조회 */
	@GetMapping("/productSell")
	public String safeProductSellList() {
		
		return "user/safeProduct/safeProductSellList";
	}
	
}
