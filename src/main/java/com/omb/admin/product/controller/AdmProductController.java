package com.omb.admin.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.omb.admin.depositInfo.service.AdmDepositInfoService;
import com.omb.admin.depositInfo.vo.AdmDepositInfoVO;
import com.omb.admin.product.service.AdmProductService;
import com.omb.admin.vo.AdminVO;
import com.omb.common.vo.PageDTO;
import com.omb.user.product.vo.ProductVO;
import com.omb.user.safeProduct.vo.SafeProductVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value="/admin/*")
@Slf4j
public class AdmProductController {

	@Setter(onMethod_=@Autowired)
	private AdmProductService admProductService;
	
	@Setter(onMethod_=@Autowired)
	private AdmDepositInfoService depositService;
	
	@GetMapping("/product/productList")
	public String productList(@ModelAttribute AdminVO admin, @ModelAttribute ProductVO vo, Model model) {
		log.info("productList 실행");
		admin = (AdminVO)model.getAttribute("adminLogin");
		List<ProductVO> list = admProductService.selectProductList(vo);
		
		model.addAttribute("productList", list);
		
		int total = admProductService.productListCnt(vo);
		vo.setAmount(10);
		model.addAttribute("pageMaker", new PageDTO(vo, total));
		return "admin/product/productList";
	}
	
	@GetMapping("/product/safeProductList")
	public String safeProductList(@ModelAttribute AdminVO admin, @ModelAttribute SafeProductVO vo, Model model) {
		log.info("safeProductList() 실행");
		admin = (AdminVO)model.getAttribute("adminLogin");
		List<SafeProductVO> list = admProductService.selectSafeProductList(vo);
		model.addAttribute("safeProductList", list);
		
		int total = admProductService.selectsafeProductCnt(vo);
		vo.setAmount(10);
		model.addAttribute("pageMaker", new PageDTO(vo, total));
		return "admin/product/safeProductList";
	}
	
	@GetMapping("/product/queuedList")
	public String productQueuedList(@ModelAttribute AdminVO admin, @ModelAttribute ProductVO vo, Model model) {
		admin = (AdminVO)model.getAttribute("adminLogin");
		List<ProductVO> list = admProductService.selectQueuedList(vo);
		model.addAttribute("queuedList", list);
		
		int total = admProductService.queuedCnt(vo);
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
	public String productRejectLisst(@ModelAttribute AdminVO admin, @ModelAttribute ProductVO vo, Model model) {
		List<ProductVO> list = admProductService.selectRejectedList(vo);
		admin = (AdminVO)model.getAttribute("adminLogin");
		model.addAttribute("rejectedList", list);
		
		int total = admProductService.rejectedCnt(vo);
		vo.setAmount(15);
		model.addAttribute("pageMaker", new PageDTO(vo, total));
		return "admin/product/rejectedList";
	}
	
	@GetMapping("/product/depositList")
	public String depositInfoList(@ModelAttribute AdminVO admin, @ModelAttribute AdmDepositInfoVO vo, Model model) {
		log.info("depositList() 실행...");
		admin = (AdminVO)model.getAttribute("adminLogin");
		List<AdmDepositInfoVO> list = depositService.selectDepositList(vo);
		model.addAttribute("depositList", list);
		
		int total = depositService.selectDepositCnt(vo);
		vo.setAmount(15);
		model.addAttribute("pageMaker", new PageDTO(vo, total));
		return "admin/product/depositList";
	}
	
	@GetMapping("/product/depositedList")
	public String depositedInfoList(@ModelAttribute AdminVO admin, @ModelAttribute AdmDepositInfoVO vo, Model model) {
		log.info("depositedList() 실행...");
		admin = (AdminVO)model.getAttribute("adminLogin");
		List<AdmDepositInfoVO> list = depositService.selectDepositedList(vo);
		model.addAttribute("depositedList", list);
		
		int total = depositService.selectDepositedCnt(vo);
		vo.setAmount(15);
		model.addAttribute("pageMaker", new PageDTO(vo, total));
		return "admin/product/depositedList";
	}
	
	@PostMapping("/product/depositUpdate")
	public String depositUpdate(AdmDepositInfoVO dvo) {
		int result = depositService.updateDepositDate(dvo);
		log.info("결과 : "+result);
		return "redirect:/admin/product/depositList";
	}
	
	@PostMapping("/product/depositDelete")
	public String depositDelete(AdmDepositInfoVO dvo) {
		int result = depositService.updateDepositDelDate(dvo);
		log.info("결과 : "+result);
		return "redirect:/admin/product/depositedList";
	}
	
	@PostMapping(value="/product/depositInsert")
	public String depositInsert() {
		return "redirect:";
	}
	
}
