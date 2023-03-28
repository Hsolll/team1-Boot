package com.omb.user.product.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.omb.common2.vo.PageDTO2;
import com.omb.user.member.vo.MemberVO;
import com.omb.user.product.service.ProductService;
import com.omb.user.product.vo.ProductVO;
import com.omb.user.productReply.service.ProductReplyService;
import com.omb.user.productReply.vo.ProductReplyVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping(value="/product/*")
@Controller
public class ProductController {
	
	@Setter(onMethod_ = @Autowired)
	private ProductService productService;

	@Setter(onMethod_ = @Autowired)
	private ProductReplyService productReplyService;
	
	@GetMapping(value="productList")
	public String productList(HttpSession session,Model model) {
	    // 세션 정보 사용
	    MemberVO member = (MemberVO)session.getAttribute("memberLogin");
	    
	    // 모델 객체에 데이터 전달
	    model.addAttribute("member", member);
	    
	    log.info("member :"+member);
	    
	    
	    return "/user/product/productListView";
	}
	
	@GetMapping(value="productAllList")
	public String selectProductList( HttpSession session, Model model, ProductVO pvo) {
		 // 세션 정보 사용
	    MemberVO member = (MemberVO)session.getAttribute("memberLogin");
	    log.info("selectProductList() 메서드 실행성공");
	    
	    // 모델 객체에 데이터 전달
	    model.addAttribute("member", member);
	    
	    log.info("member :"+member);
		
		List<ProductVO> productList =  productService.selectProductList(pvo);
		
		log.info("productList :"+productList);
		log.info("pvo :"+pvo);
		
		
		model.addAttribute("productList", productList);
		log.info("model.productList :"+model.getAttribute("productList"));
		
		int total = productService.productListCnt(pvo);
		log.info("total :"+total);
		
		model.addAttribute("pageMaker", new PageDTO2(pvo, total));
		log.info("model.pageMaker :"+model.getAttribute("pageMaker"));
		log.info("pageNum :" + pvo.getPageNum());
		
		int count = total - (pvo.getPageNum()-1) * pvo.getAmount();
		log.info("count :"+count);
		
		model.addAttribute("count", count);
		log.info("model.count :"+model.getAttribute("count"));
		
		
		return "user/product/productAllListView";
	}
	@GetMapping(value="/p_cate")
	public String category(HttpSession session, Model model,@ModelAttribute ProductVO pvo) {
		log.info("category() 메서드 실행성공");
		
		
		 // 세션 정보 사용
	    MemberVO member = (MemberVO)session.getAttribute("memberLogin");
	    
	    // 모델 객체에 데이터 전달
	    model.addAttribute("member", member);
	    
	    log.info("member :"+member);
		
		
		List<ProductVO> clist = productService.category(pvo);
		log.info("category 서비스 완료, clist :"+clist);
		
		log.info("pvo.p_cate :"+pvo.getP_cate());
		
		model.addAttribute("clist",clist);
		log.info("모델에 clist : " + model.getAttribute("clist"));
		
		
	
		int total = productService.productCateListCnt(pvo);
		log.info("total :"+total);
		
		model.addAttribute("pageMaker", new PageDTO2(pvo, total));
		log.info("model.pageMaker :"+model.getAttribute("pageMaker"));
		log.info("pageNum :" + pvo.getPageNum());
		
		int count = total - (pvo.getPageNum()-1) * pvo.getAmount();
		log.info("count :"+count);
		
		model.addAttribute("count", count);
		log.info("model.count :"+model.getAttribute("count"));
		
		return "user/product/productCategoryListView";
	}
	
	@GetMapping(value="productDetail")
	public String selectProductDetail(HttpSession session, Model model,int p_no,ProductReplyVO prvo) {
		 // 세션 정보 사용
	    MemberVO member = (MemberVO)session.getAttribute("memberLogin");
	    
	    // 모델 객체에 데이터 전달
	    model.addAttribute("member", member);
	    
	    log.info("member :"+member);
		
		log.info("selectProductDetail() 메서드 실행성공");
		
		ProductVO detail = productService.selectProductDetail(p_no);
		
		model.addAttribute("detail", detail);
		
		List<ProductReplyVO> list = productReplyService.replySelect(prvo);
		
		model.addAttribute("list",list);
		
		return "user/product/productDetailView";
	}
	
	@GetMapping(value="insertProductView")
	public String insertProductView(HttpSession session, Model model) {
		
		log.info("insertPrdouctView() 메서드 실행완료");
		  // 세션 정보 사용
	    MemberVO member = (MemberVO)session.getAttribute("memberLogin");
	    
	    // 모델 객체에 데이터 전달
	    model.addAttribute("member", member);
	    
	    log.info("member :"+member);
	    
	    // 포워드 방식으로 페이지 이동
		
		return "user/product/insertProductView";
	}
	
	
	@PostMapping("/insertProduct")
	public String insertProduct(Model model,ProductVO pvo) throws Exception {
		
		int result = productService.insertProduct(pvo);
		String url=null;
		log.info("result :"+result);
		
		if(result == 1) {
			url ="redirect:productList";
		}else {
			url = "user/product/productError";
		}
		
		return url;
	}
	
//	@GetMapping(value="/prod_like")
//	public String fullHeart(ProductVO pvo) {
//		
//		String url="";
//		int result = productService.fullHeart(pvo);
//		if (result == 1) {
//			url = "redirect:productList";
//		}else {
//			url = "user/product/productError";
//			log.info("pvo :"+pvo);
//		}
//		return url; 
//	}
	@GetMapping(value="/prod_like_in")
	
	public String insertProductLike(HttpSession session,Model model,ProductVO pvo) {
		
		
		  // 세션 정보 사용 
		MemberVO member = (MemberVO)session.getAttribute("memberLogin");
		model.addAttribute("member",member);
		  
		log.info("member :"+member);
		String url="";
		int result = productService.insertProductLike(pvo);
		if (result == 1) {
			url = "redirect:productList";
		}else {
			url = "user/product/productError";
			log.info("pvo :"+pvo);
		}
		return url; 
	}
	
	@GetMapping(value="/prod_like_del")
	public String deleteProductLike(ProductVO pvo) {
		String url="";
		int result = productService.deleteProductLike(pvo);
		if (result == 1) {
			url = "redirect:productList";
		}else {
			url = "user/product/productError";
			log.info("pvo :"+pvo);
		}
		return url; 
	}
	@GetMapping(value="/p_local")
	public String selectLocal(Model model,ProductVO pvo) {
		
		log.info("selectLocal() 메서드 실행성공");
		log.info("pvo :"+ pvo);
		
		
		
		  List<ProductVO> plist = productService.selectLocal(pvo);
		  log.info("plist :"+plist);
		  
		  model.addAttribute("plist", plist);
		  log.info("model.plist :"+model.getAttribute("plist"));
		  
		  int total = productService.productLcoalListCnt(pvo);
		  log.info("total :"+total);
		  
		  model.addAttribute("pageMaker", new PageDTO2(pvo, total));
		  log.info("model.pageMaker :"+model.getAttribute("pageMaker"));
		  log.info("pageNum :" + pvo.getPageNum());
		  
		  int count = total - (pvo.getPageNum()-1) * pvo.getAmount();
		  log.info("count :"+count);
		  
		  model.addAttribute("count", count);
		  log.info("model.count :"+model.getAttribute("count"));
		 
		return "user/product/productLocalListView";
	}
	
	
	
}
