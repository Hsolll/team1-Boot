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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.omb.common.vo.PageDTO;
import com.omb.user.account.service.AccountService;
import com.omb.user.account.vo.AccountVO;
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
	
	@Setter(onMethod_ = @Autowired)
	private AccountService accountService;
	
	
	/* 안심거래 상품목록 조회 */
	@GetMapping("/productList")
	public String selectSafeProductList(SafeProductVO spvo, Model model) {
		
		log.info("selectSafeProductList 호출 성공");
		
		// 한 페이지에 보여줄 데이터 수 설정
		spvo.setAmount(20);
		
		// 전체 레코드 조회
		List<SafeProductVO> safeProduct = safeProductService.selectSafeProductList(spvo);
		model.addAttribute("safeProduct", safeProduct);
		
		// 전체 레코드 수 구현 
		int total = safeProductService.safeProductListCnt(spvo); 
		//페이징 처리
		model.addAttribute("pageMaker", new PageDTO(spvo, total));
		 
		return "user/safeProduct/safeProductList";
	}
	
	/* 안심거래 상품 상세 */
	@GetMapping("/productDetail")
	public String selectSafeProductDetail(SafeProductVO spvo, Model model) {
		
		log.info("selectSafeProductDetail 호출 성공");
		
		String path = "";
		
		// 전체 레코드 조회
		SafeProductVO detail = safeProductService.selectSafeProductDetail(spvo);
		model.addAttribute("detail", detail);
		
		// 비밀번호 여부 조회
		String password = detail.getSp_pwd();
		
		if(password == null) {
			log.info("비밀번호 없음");
			path = "user/safeProduct/safeProductDetail";
		} else {
			log.info("비밀번호 확인 페이지 이동");
			path = "user/safeProduct/safeProductPwdConfirm";
		}
		
		return path;
	}
	
	/* 비밀번호 확인 후 안심거래 상품 상세조회 */
	@GetMapping("/productDetailConfirm")
	public String SafeProductDetailConfirm(SafeProductVO spvo, Model model) {
		
		log.info("SafeProductDetailConfirm 호출 성공");
		
		// 전체 레코드 조회
		SafeProductVO detail = safeProductService.selectSafeProductDetail(spvo);
		model.addAttribute("detail", detail);
		
		return "user/safeProduct/safeProductDetail";
	}
	
	/* 안심상품 상세 조회 시 비밀번호 일치여부 조회 */
	@ResponseBody
	@PostMapping("/productPwdChk")
	public String safeProductPwdChk(SafeProductVO spvo) {
		
		String result = "";
		SafeProductVO detail = safeProductService.selectSafeProductDetail(spvo);
		
		// 비밀번호 일치여부 조회
		if(detail.getSp_pwd().equals(spvo.getSp_pwd())) {
			result = "일치";
		} else {
			result = "불일치";
		}
		
		return result;
	}
	
	
	/* 주문 페이지 이동 */
	@GetMapping("/productOrder")
	public String selectSafeProductOrder(HttpSession session, SafeProductVO spvo, Model model) {

		log.info("selectSafeProductOrder 호출 성공");
		
		// 상품 정보 조회
		SafeProductVO detail = safeProductService.selectSafeProductDetail(spvo);
		model.addAttribute("detail", detail);
		
		// 회원정보 세션에서 꺼내오기
		MemberVO mvo = (MemberVO)session.getAttribute("memberLogin");
		
		// 회원 기본 배송지 조회
		MemberAddressVO addressvo =  memberAddressService.memberAddressInfo(mvo);
		model.addAttribute("address", addressvo);
		
		// 회원 배송지 목록 조회
		List<MemberAddressVO> addressList = memberAddressService.memberAddressInfoAll(mvo);
		model.addAttribute("addressList", addressList);
		
		return "user/safeProduct/safeProductOrder";
	}
	
	
	/* 물품 등록 페이지 이동 */
	@GetMapping("/productInsertView")
	public String safeProductInsertView(HttpSession session, Model model) {
		
		MemberVO mvo = (MemberVO)session.getAttribute("memberLogin");
		
		// 회원 계좌정보 조회
		AccountVO account = accountService.selectAccount(mvo);
		
		model.addAttribute("account", account);
		
		// 중고상품에 등록한 목록 조회
		List<ProductVO> list = safeProductService.selectProductList(mvo);
		
		model.addAttribute("productList", list);
		
		return "user/safeProduct/safeProductInsertView";
	}
	
	
	/* 안심상품 등록페이지 -> 등록할 상품 선택 시 상품 가격 가져오기 */
	@ResponseBody
	@GetMapping("/findPrice")
	public int findAddress(SafeProductVO spvo) {
		
		int price = safeProductService.selectProductPrice(spvo);
		
		return price;
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
		
		model.addAttribute("detail", detail);
		
		return "user/safeProduct/safeProductUpdateView";
	}
	
	/* 상품 수정 */
	@PostMapping(value="/productUpdate", produces = MediaType.TEXT_PLAIN_VALUE)
	public String safeProductUpdate(SafeProductVO spvo, Model model, RedirectAttributes ras) {
		
		String path = "";
		int result = 0;
		result = safeProductService.updateSafeProduct(spvo);
		
		if(result == 1) {
			ras.addFlashAttribute("msg", "상품이 수정되었습니다.");
			path = "/safe/productSell";
		} else {
			ras.addFlashAttribute("msg", "상품 수정 실패");
			path = "/safe/productUpdateView";
		}
		
		
		return "redirect:" + path;
	}
	
	
	/* 상품 삭제 */
	@GetMapping("/productDelete")
	public String safeProductDelete(SafeProductVO spvo, RedirectAttributes ras) {
		
		String path = "";
		int result = 0;
		
		// 안심상품 삭제 시 중고상품 판매상태 변경 (거래진행중 -> 판매중)
		int updateResult = safeProductService.updateProductStatusReturn(spvo);
		
		if(updateResult == 1) {
			
			// 상태변경 후 삭제처리
			result = safeProductService.deleteSafeProduct(spvo);
			
			if(result == 1) {
				ras.addFlashAttribute("msg", "상품이 삭제되었습니다.");
				path = "/safe/productSell";
			}
		} else {
			ras.addFlashAttribute("msg", "다시 시도해주세요.");
			path = "/safe/productSell";
		}
		
		return "redirect:" + path;
	}
	
}
