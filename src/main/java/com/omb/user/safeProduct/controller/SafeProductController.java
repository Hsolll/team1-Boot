package com.omb.user.safeProduct.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.omb.user.address.service.MemberAddressService;
import com.omb.user.address.vo.MemberAddressVO;
import com.omb.user.member.vo.MemberVO;
import com.omb.user.product.vo.ProductVO;
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
	
	@Setter(onMethod_ = @Autowired)
	private MemberAddressService memberAddressService;
	
	
	/* 안심거래 상품목록 조회 */
	@GetMapping("/productList")
	public String selectSafeProductList(Model model) {
		
		log.info("selectSafeProductList 호출 성공");
		
		// 전체 레코드 조회
		List<SafeProductVO> safeProduct = safeProductService.selectSafeProductList();
		model.addAttribute("safeProduct", safeProduct);
		
		log.info("safeProduct : " + safeProduct);
		
		
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
	public String selectSafeProductOrder(HttpSession session, SafeProductVO spvo, Model model) {

		log.info("selectSafeProductOrder 호출 성공");
		
		// 상품 정보 조회
		SafeProductVO detail = safeProductService.selectSafeProductDetail(spvo);
		model.addAttribute("detail", detail);
		log.info("상품 가격 : " + detail.getSp_price());
		// 주소 정보 조회
		MemberVO mvo = (MemberVO)session.getAttribute("memberLogin");
		
		MemberAddressVO addressvo =  memberAddressService.memberAddressInfo(mvo);
		model.addAttribute("address", addressvo);
		
		
		return "user/safeProduct/safeProductOrder";
	}
	
	
	/* 물품 등록 페이지 이동 */
	@GetMapping("/productInsertView")
	public String safeProductInsertView(HttpSession session, Model model) {
		
		MemberVO mvo = (MemberVO)session.getAttribute("memberLogin");
		
		List<ProductVO> list = safeProductService.selectProductList(mvo);
		
		model.addAttribute("productList", list);
		
		return "user/safeProduct/safeProductInsertView";
	}


	/* 상품 등록처리 */
	@PostMapping("/productInsert")
	public String insertSafeProduct(HttpSession session, SafeProductVO svo, RedirectAttributes ras) {
		
		log.info("svo : " + svo);
		
		int result = 0;
		String path = "";
		
		result = safeProductService.insertSafeProduct(svo);
		
		if(result == 1) {
			log.info("상품등록 성공");
			
			// 상품 등록 시 중고상품 판매상태 변경 (판매중 -> 거래진행중)
			int updateResult = safeProductService.updateProductStatus(svo);
			if(updateResult == 1) {
				log.info("중고상품 상태변경 완료");
				ras.addFlashAttribute("msg", "상품을 등록하였습니다.");
				path = "/safe/productList";
			}
			
		} else {
			log.info("상품등록 실패");
			ras.addFlashAttribute("msg", "상품 등록 실패");
			path = "/safe/productInsertView";
		}
		
		return "redirect:" + path;
	}
	
	
	
	/* 안심거래 판매목록 조회 */
	@GetMapping("/productSell")
	public String safeProductSellList(HttpSession session, Model model) {
		
		MemberVO mvo = (MemberVO)session.getAttribute("memberLogin");
		
		List<SafeProductVO> sellList = safeProductService.selectSafeProductListSell(mvo);
		
		model.addAttribute("sellList", sellList);
		
		return "user/safeProduct/safeProductSellList";
	}
	
	/* 판매등록상품 수정폼으로 이동 */
	@GetMapping("/productUpdateView")
	public String safeProductUpdateView(SafeProductVO spvo, Model model) {
		
		SafeProductVO detail = safeProductService.selectSafeProductDetail(spvo);
		
		log.info("조회된 상품 정보 : " + detail);
		
		model.addAttribute("detail", detail);
		
		return "user/safeProduct/safeProductUpdateView";
	}
	
	
	@PostMapping(value="/productUpdate", produces = MediaType.TEXT_PLAIN_VALUE)
	public String safeProductUpdate(SafeProductVO spvo, Model model, RedirectAttributes ras) {
		
		log.info("수정요청 값 : " + spvo);
		
		String path = "";
		int result = 0;
		result = safeProductService.updateSafeProduct(spvo);
		
		if(result == 1) {
			log.info("수정 성공");
			ras.addFlashAttribute("msg", "상품이 수정되었습니다.");
			path = "/safe/productSell";
		} else {
			log.info("수정 실패");
			ras.addFlashAttribute("msg", "상품 수정 실패");
			path = "/safe/productUpdateView";
		}
		
		
		return "redirect:" + path;
	}
	
	/* 상품 삭제 */
	@GetMapping("/productDelete")
	public String safeProductDelete(SafeProductVO spvo, RedirectAttributes ras) {
		
		log.info("삭제할 상품번호 : " + spvo.getSp_no());
		
		String path = "";
		int result = 0;
		
		result = safeProductService.deleteSafeProduct(spvo);
		
		if(result == 1) {
			log.info("안심상품 삭제 성공");
			
			// 안심상품 삭제 시 중고상품 판매상태 변경 (거래진행중 -> 판매중)
			int updateResult = safeProductService.updateProductStatusReturn(spvo);
			
			if(updateResult == 1) {
				log.info("중고상품 상태변경 완료");
				ras.addFlashAttribute("msg", "상품이 삭제되었습니다.");
				path = "/safe/productSell";
			}
			
		} else {
			log.info("안심상품 삭제 실패");
			ras.addFlashAttribute("msg", "상품 삭제 실패");
			path = "/safe/productSell";
		}
		
		
		return "redirect:" + path;
	}
	
}
