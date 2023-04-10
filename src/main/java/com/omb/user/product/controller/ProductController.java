
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.omb.common.vo.PageDTO;
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
	
	
	//메뉴리스트 페이지 
	@GetMapping(value="productList")
	public String productList(@ModelAttribute ProductVO pvo, HttpSession session,RedirectAttributes ras,Model model) {
		
		MemberVO member = (MemberVO)session.getAttribute("memberLogin"); 
	    
		model.addAttribute("member", member); 
		
	    ras.addFlashAttribute("ProductVO", pvo);
	    
	    return "user/product/productListView";
	}
	
	//전체 페이지리스
	@GetMapping(value="productAllList")
	public String selectProductList( HttpSession session,RedirectAttributes ras, Model model,ProductVO pvo) {
		pvo.setAmount(8);
		
		MemberVO member = (MemberVO)session.getAttribute("memberLogin");
	    
	    model.addAttribute("member", member);
	    
		List<ProductVO> productList =  productService.selectProductList(pvo);
		
		List<ProductVO> like = productService.selectProductLike(member);

		for (ProductVO likeItem : like) {
		    
			int p_no = likeItem.getP_no();
		   
			for (ProductVO product : productList) {
				if (product.getP_no() == p_no) {
					int prod_like = likeItem.getProd_like();
					product.setProd_like(prod_like);
					break;
		        }
		    }
		}
		model.addAttribute("productList", productList);
		
		model.addAttribute("productVO", pvo);
		
		int total = productService.productListCnt(pvo);
		
		model.addAttribute("pageMaker", new PageDTO(pvo, total));
		
		int count = total - (pvo.getPageNum()-1) * pvo.getAmount();
		
		model.addAttribute("count", count);
		
		return "/user/product/productAllListView";
	}

	
	
	
	//카테고리 리스트 
	@GetMapping(value="/p_cate")
	public String category(HttpSession session, Model model,@ModelAttribute ProductVO pvo) {
		log.info("category() 메서드 실행성공");
		pvo.setAmount(8);
		
		MemberVO member = (MemberVO)session.getAttribute("memberLogin");
	    
	    model.addAttribute("member", member);
	    
		List<ProductVO> clist = productService.category(pvo);
		List<ProductVO> like = productService.selectProductLike(member);
		
		for (ProductVO likeItem : like) {
		    int p_no = likeItem.getP_no();
		    for (ProductVO product : clist) {
		        if (product.getP_no() == p_no) {
		            int prod_like = likeItem.getProd_like();
		            product.setProd_like(prod_like);
		            break;
		        }
		    }
		}
		
		int total = productService.productCateListCnt(pvo);
		
		model.addAttribute("clist",clist);

		model.addAttribute("pageMaker", new PageDTO(pvo, total));
		
		int count = total - (pvo.getPageNum()-1) * pvo.getAmount();
		
		model.addAttribute("count", count);
		
		return "/user/product/productCategoryListView";
	}
	
	// 제품 상세정보 
	@GetMapping(value="/productDetail")
	public String selectProductDetail(HttpSession session, Model model,int p_no,ProductReplyVO prvo) {
		
		log.info("selectProductDetail() 메서드 실행성공");
	    
		MemberVO member = (MemberVO)session.getAttribute("memberLogin");
	    
	    model.addAttribute("member", member);
	    
		ProductVO detail = productService.selectProductDetail(p_no);

		detail.setAmount(8);
		
		model.addAttribute("detail", detail);
		
		List<ProductReplyVO> list = productReplyService.replySelect(prvo);
		
		model.addAttribute("list",list);
		
		return "user/product/productDetailView";
	}
	
	//새로운 제품등록 페이지
	@GetMapping(value="insertProductView")
	public String insertProductView(HttpSession session, Model model) {
		
		log.info("insertPrdouctView() 메서드 실행완료");
	    MemberVO member = (MemberVO)session.getAttribute("memberLogin");
	    
	    model.addAttribute("member", member);

	    return "user/product/insertProductView";
	}
	
	//새로운 제품등록 메서드
	@PostMapping("/insertProduct")
	public String insertProduct(HttpSession session, Model model,ProductVO pvo) throws Exception {
		
		
		MemberVO member = (MemberVO)session.getAttribute("memberLogin");
		
		model.addAttribute("member",member);
		  
		int u_no = member.getU_no();
		
		pvo.setU_no(u_no);
		
		int p_no = pvo.getP_no();
		
		pvo.setP_no(p_no);
		
		
		int result = productService.insertProduct(pvo);
		
		String url=null;
		
		if(result == 1) {
			url ="redirect:productList";
		}else {
			url = "user/product/productError";
		}
		
		return url;
	}
	
	
	//좋아요 인서트 기능
	@GetMapping(value="/prod_like_in")
	
	public String insertProductLike(HttpSession session,Model model, @ModelAttribute ProductVO pvo) {
		
		  // 세션 정보 사용 
		MemberVO member = (MemberVO)session.getAttribute("memberLogin");
		
		model.addAttribute("member",member);
		  
		String url="";
		
		pvo.setU_no(member.getU_no());
		
		int result = productService.insertProductLike(pvo);
		
		if (result == 1) {
			url = "redirect:productList";
		}else {
			url = "user/product/productError";
			log.info("pvo :"+pvo);
		}
		return url; 
	}
	
	//좋아요 딜리트 기능
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
	
	//지역 리스트 조회
	@GetMapping(value="/p_local")
	public String selectLocal(HttpSession session, Model model,ProductVO pvo) {
		
		log.info("selectLocal() 메서드 실행성공");
		
		pvo.setAmount(8);
		
		MemberVO member = (MemberVO)session.getAttribute("memberLogin");
		
		// 모델 객체에 데이터 전달
		model.addAttribute("member", member);
		
	    List<ProductVO> plist = productService.selectLocal(pvo);

	    List<ProductVO> like = productService.selectProductLike(member);
	    
		for (ProductVO likeItem : like) {
		    int p_no = likeItem.getP_no();
		    for (ProductVO product : plist) {
		        if (product.getP_no() == p_no) {
		            int prod_like = likeItem.getProd_like();
		            product.setProd_like(prod_like);
		            break;
		        }
		    }
		}
	  
	    model.addAttribute("plist", plist);
		
	    int total = productService.productLcoalListCnt(pvo);
	  
	    model.addAttribute("pageMaker", new PageDTO(pvo, total));
	  
	    int count = total - (pvo.getPageNum()-1) * pvo.getAmount();
	  
	    model.addAttribute("count", count);
		 
		return "/user/product/productLocalListView";
	}
	
	//내가 쓴 글 보기
	@GetMapping(value="/myWrite")
	public String myWrite(HttpSession session,Model model,ProductVO pvo) {
		
		pvo.setAmount(8);
		MemberVO member = (MemberVO)session.getAttribute("memberLogin");
		
		model.addAttribute("member",member);
		  
		List<ProductVO> writeList =  productService.myWrite(pvo);
		
		model.addAttribute("wlist",writeList);
		  
		int total = productService.WriteListCnt(pvo);
		
		model.addAttribute("pageMaker", new PageDTO(pvo, total));
		
		int count = total - (pvo.getPageNum()-1) * pvo.getAmount();
		
		model.addAttribute("count", count);
		
		return "/user/product/myWriteView";
	}
	
	//게시물 업데이트
	@GetMapping(value="/update")
	public String updateForm(HttpSession session, ProductVO pvo,ProductReplyVO prov,Model model) {
		
		
		log.info("updateForm() 메서드 실행성공");
		
		MemberVO member = (MemberVO)session.getAttribute("memberLogin");
		
		model.addAttribute("member",member);
		  
		int u_no = member.getU_no();
		
		int p_no = pvo.getP_no();
		
		ProductVO update = productService.updateForm(u_no,p_no);
		
		model.addAttribute("update", update);
		
		List<ProductReplyVO> list = productReplyService.replySelect(prov);
		
		model.addAttribute("list",list);
		
		return "user/product/updateForm";
	}
	
	//게시물 업데이트 완료
	@PostMapping("/updateCon")
	public String update(HttpSession session, Model model,ProductVO pvo) throws Exception {
		
	MemberVO member = (MemberVO)session.getAttribute("memberLogin");
		
		model.addAttribute("member",member);
		  
		int u_no = member.getU_no();
		
		pvo.setU_no(u_no);
		
		int p_no = pvo.getP_no();
		
		pvo.setP_no(p_no);
		
		
		int result = productService.update(pvo);
		
		String url=null;
		
		if(result == 1) {
			url ="redirect:productList";
		}else {
			url = "user/product/productError";
		}
		
		return url;
	}
	
	//게시물 삭제
	@GetMapping("/pdelete")
	public String delete(HttpSession session,Model model, ProductVO pvo) throws Exception {
		
		
		log.info("delete() 메서드 실행성공");
		
		MemberVO member = (MemberVO)session.getAttribute("memberLogin");
		
		model.addAttribute("member",member);
		  
		int u_no = member.getU_no();
		
		pvo.setU_no(u_no);
		
		int p_no = pvo.getP_no();
		
		pvo.setP_no(p_no);
		
		int result = productService.delete(pvo);
		String url=null;
		
		if(result == 1) {
			url ="redirect:productList";
		}else {
			url = "user/product/productError";
		}
		
		return url;
	}
	
	/* 나눔상품 리스트 조회 */
	@GetMapping("/shareList")
	public String selectShareProductList(ProductVO pvo, Model model) {
		log.info("selectShareProductList 메서드 호출");
		
		// 한 페이지에 보여줄 데이터 수 설정
		pvo.setAmount(12);
				
		List<ProductVO> productList =  productService.selectShareProductList(pvo);
		log.info("productList : " + productList);
		
		model.addAttribute("productList", productList);
		
		// 전체 레코드 수 구현 
		int total = productService.ShareProductListCnt(); 
		//페이징 처리
		model.addAttribute("pageMaker", new PageDTO(pvo, total));
		
		return "user/shareProduct/shareProductList";
	}
	
	
}


