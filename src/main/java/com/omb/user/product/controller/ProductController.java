
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
	
	
	@GetMapping(value="productList")
	public String productList(@ModelAttribute ProductVO pvo, HttpSession session,RedirectAttributes ras,Model model) {
	    // 세션 정보 사용
		
		 MemberVO member = (MemberVO)session.getAttribute("memberLogin"); 
	    
	    // 모델 객체에 데이터 전달
		 model.addAttribute("member", member); 
		
		 
	    
	    
//	    log.info("member :"+member);
	    
	    ras.addFlashAttribute("ProductVO", pvo);
	    
	    
	    return "user/product/productListView";
	}
	

	@GetMapping(value="productAllList")
	public String selectProductList( HttpSession session,RedirectAttributes ras, Model model,ProductVO pvo) {
		 // 세션 정보 사용
		pvo.setAmount(8);
		log.info("pgaeAmount :"+pvo.getAmount());
		MemberVO member = (MemberVO)session.getAttribute("memberLogin");
//	    log.info("selectProductList() 메서드 실행성공");
	    
	    
//	    ras.addFlashAttribute("ProductVO", pvo);
	    // 모델 객체에 데이터 전달
	    model.addAttribute("member", member);
	    
//	    log.info("member :"+member);
//	    log.info("member.getU_no() :"+member.getU_no());
			
		int u_no = member.getU_no();
		
//		log.info("u_no :"+u_no);
		
		
		
		List<ProductVO> productList =  productService.selectProductList(pvo);
		
		List<ProductVO> like = productService.selectProductLike(member);
//		log.info("like :"+like);
		
		for (ProductVO likeItem : like) {
			
			log.info("likeItem : "+likeItem);
		    int p_no = likeItem.getP_no();
		   
		    
		    for (ProductVO product : productList) {
		       
		    	
		    	
		    	if (product.getP_no() == p_no) {
		            int prod_like = likeItem.getProd_like();
		            product.setProd_like(prod_like);
		            break;
		        }
		    }
		}
//		log.info(like.size()+", "+productList.size());
//		model.addAttribute("like",like);
//		log.info("like :"+like);

//		log.info("productList :"+productList);
//		log.info("pvo :"+pvo);
		
		
		model.addAttribute("productList", productList);
		model.addAttribute("productVO", pvo);
//		CommonVO cvo = (CommonVO)pvo;
//		model.addAttribute("commonVO",cvo);
		
//		log.info("model.productList :"+model.getAttribute("productList"));
		
		log.info("keyword : "+pvo.getKeyword() );
		log.info("search : "+pvo.getSearch() );
		int total = productService.productListCnt(pvo);
		log.info("total :"+total);
		
		model.addAttribute("pageMaker", new PageDTO(pvo, total));
		log.info("model.pageMaker :"+model.getAttribute("pageMaker"));
		log.info("pageNum :" + pvo.getPageNum());
		
		int count = total - (pvo.getPageNum()-1) * pvo.getAmount();
		log.info("count :"+count);
		
		model.addAttribute("count", count);
		log.info("model.count :"+model.getAttribute("count"));
		
		
		return "/user/product/productAllListView";
	}
	
//	@GetMapping(value="heartSel")
//	public String heartSel(int p_no,int u_no,Model model) {
//		
//
//		int like = productService.selectProductLike(p_no,u_no);
//		log.info("like :"+like);
//		model.addAttribute("likes",like);
//		log.info("model.likes :"+model.getAttribute("likes"));
//		
//		return "/user/product/heartPage";
//	}
	
	
	
	
	@GetMapping(value="/p_cate")
	public String category(HttpSession session, Model model,@ModelAttribute ProductVO pvo) {
		log.info("category() 메서드 실행성공");
		pvo.setAmount(8);
		
		MemberVO member = (MemberVO)session.getAttribute("memberLogin");
//	    log.info("selectProductList() 메서드 실행성공");
	    
	    
	    // 모델 객체에 데이터 전달
	    model.addAttribute("member", member);
	    
//	    log.info("member :"+member);
//	    log.info("member.getU_no() :"+member.getU_no());
//			
		int u_no = member.getU_no();
		
//		log.info("u_no :"+u_no);
		
		List<ProductVO> clist = productService.category(pvo);
//		log.info("category 서비스 완료, clist :"+clist);
//		
//		log.info("pvo :"+pvo);
//		log.info("pvo.p_cate :"+pvo.getP_cate());
		
//		log.info("모델에 clist : " + model.getAttribute("clist"));
		
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
		
		
		model.addAttribute("clist",clist);
//		log.info(clist+"  ");
		int total = productService.productCateListCnt(pvo);
//		log.info("total :"+total);
		
		model.addAttribute("pageMaker", new PageDTO(pvo, total));
//		log.info("model.pageMaker :"+model.getAttribute("pageMaker"));
//		log.info("pageNum :" + pvo.getPageNum());
		
		int count = total - (pvo.getPageNum()-1) * pvo.getAmount();
		log.info("count :"+count);
		
		model.addAttribute("count", count);
		log.info("model.count :"+model.getAttribute("count"));
		
		return "/user/product/productCategoryListView";
	}
	
	@GetMapping(value="/productDetail")
	public String selectProductDetail(HttpSession session, Model model,int p_no,ProductReplyVO prvo) {
		 // 세션 정보 사용
		
	    MemberVO member = (MemberVO)session.getAttribute("memberLogin");
	    
	    // 모델 객체에 데이터 전달
	    model.addAttribute("member", member);
	    
	    log.info("member :"+member);
		
		log.info("selectProductDetail() 메서드 실행성공");
		
		ProductVO detail = productService.selectProductDetail(p_no);
		log.info("p_no :"+p_no);
		detail.setAmount(8);
		
		
		log.info("detail.u_nick:"+detail.getU_nick());
		
		model.addAttribute("detail", detail);
		
		log.info("detail:"+detail);
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
	public String insertProduct(HttpSession session, Model model,ProductVO pvo) throws Exception {
		
		
		MemberVO member = (MemberVO)session.getAttribute("memberLogin");
		
		model.addAttribute("member",member);
		  
		log.info("member :"+member);
		int u_no = member.getU_no();
		pvo.setU_no(u_no);
		log.info("u_no :"+ u_no);
		log.info("pvo.getU_no :"+pvo.getU_no());
		
		int p_no = pvo.getP_no();
		log.info("p_no :"+ p_no);
		pvo.setP_no(p_no);
		log.info("pvo.getP_no :"+pvo.getP_no());
		
		
		int result = productService.insertProduct(pvo);
		
		log.info("pvo.getP_no :"+pvo.getP_no());
		String url=null;
		log.info("result :"+result);
		
		
		if(result == 1) {
			url ="redirect:productList";
		}else {
			url = "user/product/productError";
		}
		
		return url;
	}

	@GetMapping(value="/prod_like_in")
	
	public String insertProductLike(HttpSession session,Model model, @ModelAttribute ProductVO pvo) {
		
		
		  // 세션 정보 사용 
		MemberVO member = (MemberVO)session.getAttribute("memberLogin");
		model.addAttribute("member",member);
		  
		log.info("member :"+member);
		String url="";
		log.info("p_no : "+pvo.getP_no());
		pvo.setU_no(member.getU_no());
		int result = productService.insertProductLike(pvo);
		if (result == 1) {
			log.info("p_no : "+pvo.getP_no()+", prod_like : "+pvo.getProd_like());
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
	public String selectLocal(HttpSession session, Model model,ProductVO pvo) {
		
		pvo.setAmount(8);
		log.info("selectLocal() 메서드 실행성공");
		MemberVO member = (MemberVO)session.getAttribute("memberLogin");
		
		
		// 모델 객체에 데이터 전달
		model.addAttribute("member", member);
		
//		log.info("member :"+member);
//		log.info("member.getU_no() :"+member.getU_no());
		
		int u_no = member.getU_no();
		
//		log.info("u_no :"+u_no);
//		
//		log.info("pvo :"+ pvo);
//		log.info("pvo.getPageNum :"+ pvo.getPageNum());
//		log.info("pvo.getAmount :"+ pvo.getAmount());

	    List<ProductVO> plist = productService.selectLocal(pvo);
//	    log.info("plist :"+plist);
	    
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
//	    log.info("model.plist :"+model.getAttribute("plist"));
//		
//		log.info("서비스 완료, plist :"+plist);
//		
//		log.info("pvo :"+pvo);
		
	    
	    
	    int total = productService.productLcoalListCnt(pvo);
	    log.info("total :"+total);
	  
	    model.addAttribute("pageMaker", new PageDTO(pvo, total));
	    log.info("model.pageMaker :"+model.getAttribute("pageMaker"));
	    log.info("pageNum :" + pvo.getPageNum());
	  
	    int count = total - (pvo.getPageNum()-1) * pvo.getAmount();
	    log.info("count :"+count);
	  
	    model.addAttribute("count", count);
	    log.info("model.count :"+model.getAttribute("count"));
		 
		return "/user/product/productLocalListView";
	}
	
	@GetMapping(value="/myWrite")
	public String myWrite(HttpSession session,Model model,ProductVO pvo) {
		
		pvo.setAmount(8);
		MemberVO member = (MemberVO)session.getAttribute("memberLogin");
		
		  model.addAttribute("member",member);
		  
		log.info("member :"+member);
		
		
		List<ProductVO> writeList =  productService.myWrite(pvo);
		log.info("writeList :"+writeList);
		
		model.addAttribute("wlist",writeList);
		  
		log.info("model.wlist :"+model.getAttribute("wlist"));
		
		int total = productService.WriteListCnt(pvo);
		log.info("total :"+total);
		
		model.addAttribute("pageMaker", new PageDTO(pvo, total));
		log.info("model.pageMaker :"+model.getAttribute("pageMaker"));
		log.info("pageNum :" + pvo.getPageNum());
		
		int count = total - (pvo.getPageNum()-1) * pvo.getAmount();
		log.info("count :"+count);
		
		model.addAttribute("count", count);
		log.info("model.count :"+model.getAttribute("count"));
		
		return "/user/product/myWriteView";
	}
	
	@GetMapping(value="/update")
	public String updateForm(HttpSession session, ProductVO pvo,ProductReplyVO prov,Model model) {
		
		
		log.info("updateForm() 메서드 실행성공");
		
		MemberVO member = (MemberVO)session.getAttribute("memberLogin");
		
		model.addAttribute("member",member);
		  
		log.info("member :"+member);
		int u_no = member.getU_no();
		log.info("u_no :"+ u_no);
		int p_no = pvo.getP_no();
		log.info("p_no :"+ p_no);
		ProductVO update = productService.updateForm(u_no,p_no);
		
		model.addAttribute("update", update);
		log.info("update : "+update);
		
		List<ProductReplyVO> list = productReplyService.replySelect(prov);
		
		model.addAttribute("list",list);
		
		return "user/product/updateForm";
	}
	
	@PostMapping("/updateCon")
	public String update(HttpSession session, Model model,ProductVO pvo) throws Exception {
		
	MemberVO member = (MemberVO)session.getAttribute("memberLogin");
		
		model.addAttribute("member",member);
		  
		log.info("member :"+member);
		int u_no = member.getU_no();
		pvo.setU_no(u_no);
		log.info("u_no :"+ u_no);
		int p_no = pvo.getP_no();
		log.info("p_no :"+ p_no);
		pvo.setP_no(p_no);
		
		
		log.info("pvo :"+pvo);
		int result = productService.update(pvo);
		String url=null;
		log.info("result :"+result);
		
		if(result == 1) {
			url ="redirect:productList";
		}else {
			url = "user/product/productError";
		}
		
		return url;
	}
	
	@GetMapping("/pdelete")
	public String delete(HttpSession session,Model model, ProductVO pvo) throws Exception {
		
		
		log.info("delete() 메서드 실행성공");
		
		MemberVO member = (MemberVO)session.getAttribute("memberLogin");
		
		model.addAttribute("member",member);
		  
		log.info("member :"+member);
		int u_no = member.getU_no();
		pvo.setU_no(u_no);
		log.info("u_no :"+ u_no);
		int p_no = pvo.getP_no();
		log.info("p_no :"+ p_no);
		pvo.setP_no(p_no);
		log.info("pvo :"+pvo);
		
		int result = productService.delete(pvo);
		String url=null;
		log.info("result :"+result);
		
		if(result == 1) {
			url ="redirect:productList";
		}else {
			url = "user/product/productError";
		}
		
		return url;
	}
	
	
}


