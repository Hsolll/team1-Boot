package com.omb.admin.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.omb.admin.product.service.AdmProductService;
import com.omb.common.vo.PageDTO;
import com.omb.user.product.vo.ProductVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value="/admin/*")
@Slf4j
public class AdmProductController {

	@Setter(onMethod_=@Autowired)
	private AdmProductService admProductService;
	
	@GetMapping("/product/productList")
	public String productList(@ModelAttribute ProductVO vo, Model model) {
		log.info("productList 실행");
		List<ProductVO> list = admProductService.selectProductList(vo);
		model.addAttribute("productList", list);
		
		int total = admProductService.productListCnt(vo);
		vo.setAmount(10);
		model.addAttribute("pageMaker", new PageDTO(vo, total));
		return "admin/product/productList";
	}
	
	@GetMapping("/product/queuedList")
	public String productQueuedList(@ModelAttribute ProductVO vo, Model model) {
		List<ProductVO> list = admProductService.selectQueuedList(vo);
		model.addAttribute("queuedList", list);
		
		int total = admProductService.productListCnt(vo);
		vo.setAmount(15);
		model.addAttribute("pageMaker", new PageDTO(vo, total));
		
		return "admin/product/queuedList";
	}
	
	
//	등록한 상품 승인한 경우 관리자 승인 컬럼 1(승인)로 업데이트
	@PostMapping(value="/product/productUp")
	public String productUp(ProductVO vo) {
//		List<String> pNo = new ArrayList<String>(Arrays.asList(valueArr.split(",")));
		
//		for(String p_no : pNo) {
//		}
		int result = admProductService.updateAdmRecognize(vo);			
		log.info("결과 : "+result);
		return "redirect:/admin/product/queuedList";
	}
	
//	등록한 상품 승인한 경우 관리자 승인 컬럼 2(거절)로 업데이트
	@PostMapping(value="/product/productDown")
	public String productDown(ProductVO vo) {
		
		int result = admProductService.updateAdmReject(vo);
		log.info("결과 : "+result);
		return "redirect:/admin/product/rejectedList";
	}
	
	@GetMapping("/product/rejectedList")
	public String productRejectLisst(@ModelAttribute ProductVO vo, Model model) {
		List<ProductVO> list = admProductService.selectRejectedList(vo);
		model.addAttribute("rejectedList", list);
		
		int total = admProductService.productListCnt(vo);
		vo.setAmount(15);
		model.addAttribute("pageMaker2", new PageDTO(vo, total));
		return "admin/product/rejectedList";
	}
	
	@GetMapping(value="/product/repositList")
	public String depositList() {
		return "admin/product/repositList";
	}
	
	@PostMapping(value="/product/depositInsert")
	public String depositInsert() {
		return "redirect:";
	}
	
//	주문정보 확인하기
	@GetMapping(value="/product/orderDetail")
	public String orderDetail() {
		return "admin/product/orderDetail";
	}
}
