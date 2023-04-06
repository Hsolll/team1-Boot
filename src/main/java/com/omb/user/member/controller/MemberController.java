package com.omb.user.member.controller;

import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.omb.admin.serviceCenter.service.AdmServiceCenterService;
import com.omb.admin.serviceCenter.vo.AdmServiceCenterVO;
import com.omb.common.vo.PageDTO;
import com.omb.user.address.service.MemberAddressService;
import com.omb.user.address.vo.MemberAddressVO;
import com.omb.user.member.service.MemberService;
import com.omb.user.member.vo.MemberVO;
import com.omb.user.product.service.ProductService;
import com.omb.user.product.vo.ProductVO;
import com.omb.user.serviceCenter.service.ServiceCenterService;
import com.omb.user.serviceCenter.vo.ServiceCenterVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@SessionAttributes("memberLogin")
@RequestMapping("/member/*")
@Slf4j
public class MemberController {
	
	@Setter(onMethod_=@Autowired)
	private MemberService memberservice;
	
	@Setter(onMethod_=@Autowired)
	private ProductService productService;
	
	@Setter(onMethod_=@Autowired)
	private ServiceCenterService serviceCenter;
	
	@Setter(onMethod_=@Autowired)
	private AdmServiceCenterService admserviceCenter;
	
	@Setter(onMethod_ = @Autowired)
	private MemberAddressService memberAddressService;
	
	@Autowired
    private JavaMailSender mailSender;
	
	@ModelAttribute
	public MemberVO memberLogin() {
		return new MemberVO();
	}
	
	@GetMapping("/signUpAgree")
	 public String signUpAgree() {
		 log.info("약관 동의 호출");
		 return "user/login/signUpAgree";
	 }
	
	@PostMapping("/signUpForm")
	public String signUpForm() {
		log.info("회원가입 화면 호출");
		
		return "user/login/signUpForm";
	}
	
	@PostMapping("/signUp")
	public String signUp(MemberVO mvo) {
		
		log.info("회원가입 완료");
		int nickResult = memberservice.nickChk(mvo);
		int result = memberservice.idChk(mvo);
		int emailResult= memberservice.emailChk(mvo);
		int phoneResult = memberservice.phoneChk(mvo);
		
		if(result == 1 && nickResult == 1 && emailResult == 1 && phoneResult == 1) {
			return "redirect:/member/signUpForm";
		}else {
			memberservice.signUp(mvo);
			memberservice.addressInsert(mvo);
		}
		
		
		
		return "redirect:/login";
	}
	
	
	
	/*@GetMapping("/mypage")
	public String myPage(@ModelAttribute MemberVO mvo, Model model) {
		log.info("마이페이지 호출 성공");
		
		MemberVO mypage = memberservice.myPage(mvo);
		model.addAttribute("mypage" ,mypage);
		
		return "user/myPage/myPageIndex";
	}*/
	

	
	
	@PostMapping("/updateForm")
	public String updateForm(@ModelAttribute MemberVO mvo, Model model) {
		log.info("회원수정 호출"+  mvo.getU_id());
		
		MemberVO result = memberservice.getMemberInfo(mvo);
		model.addAttribute("update",result);
		
		return "user/member/memberUpdateForm";
	}
	
	
	
		
	
	@PostMapping("/memberUpdate")
	public String memberUpdate(MemberVO mvo) {
		
		log.info("회원수정");
		
		memberservice.memberUpdate(mvo);
		memberservice.addressUpdate(mvo);
		
		
		return "redirect:/member/mypage";
	}
	
	@PostMapping("/deleteForm")
	public String deleteForm(MemberVO mvo) {
		log.info("회원탈퇴 호출");
		return "user/member/memberDeleteForm";
	}
	
	@PostMapping("/memberDelete")
	public String memberDelete(MemberVO mvo) {
		
		log.info("회원탈퇴");
		
		memberservice.memberDelete(mvo);
		
		
		return "redirect:/logout";
	}
	
	
	@ResponseBody
	@PostMapping("/idChk")
	public int idChk(MemberVO mvo) {
		int result = memberservice.idChk(mvo);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/nickChk")
	public int nickChk(MemberVO mvo) {
		int nickResult = memberservice.nickChk(mvo);
		return nickResult;
	}
	
	@ResponseBody
	@PostMapping("/emailChk")
	public int emailChk(MemberVO mvo) {
		int emailResult = memberservice.emailChk(mvo);
		return emailResult;
	}
	
	@ResponseBody
	@PostMapping("/phoneChk")
	public int phoneChk(MemberVO mvo) {
		int phoneResult = memberservice.phoneChk(mvo);
		return phoneResult;
	}
	
	
	@PostMapping("/pwdUpdateForm")
	public String pwdUpdateForm(MemberVO mvo) {
		log.info("회원비밀번호수정 호출");
		return "user/member/memberPwdUpdate";
	}
	
	@PostMapping("/memberPwdUpdate")
	public String memberPwdUpdate(MemberVO mvo) {
		
		log.info("회원비밀번호수정");
		memberservice.memberPwdUpdate(mvo);
		
		
		return "redirect:/logout";
	}
	
	@GetMapping("/pwdChkForm")
	public String pwdChkForm(MemberVO mvo) {
		log.info("회원수정 비밀번호 확인");
		
		return "user/member/memberConfirmPw";
	}
	
	@GetMapping("/pwdChkForm2")
	public String pwdChkForm2(MemberVO mvo) {
		log.info("회원비밀번호 수정 비밀번호 확인");
		
		return "user/member/memberConfirmPw2";
	}
	
	@GetMapping("/pwdChkForm3")
	public String pwdChkForm3(MemberVO mvo) {
		log.info("회원비밀번호 탈퇴 비밀번호 확인");
		
		return "user/member/memberConfirmPw3";
	}
	
	@PostMapping("/pwdChkResult")
	public String pwdChkResult(MemberVO mvo) {
		log.info("회원수정 호출");
		
		return "";
		
	}
	
	@ResponseBody
	@PostMapping("/pwdChk")
	public int pwdChk(MemberVO mvo) {
		int pwdChkResult = memberservice.pwdChk(mvo);
		
		return pwdChkResult;
	}
	
	@PostMapping("/confirmPwd")
	public String confirmPwd(MemberVO mvo) {
		int result = memberservice.pwdChk(mvo);
		
		if(result==1) {
			return "member/updateForm";
		}else{
		return "redirect:/member/pwdChkForm";
		}
	}
	
	/* 이메일 인증 */
    @RequestMapping(value="/mailCheck", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
        
        /* 뷰(View)로부터 넘어온 데이터 확인 */
        log.info("이메일 데이터 전송 확인");
        log.info("인증번호 : " + email);
        
        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        log.info("인증번호 " + checkNum);        
        /* 이메일 보내기 */
        String setFrom = "minseok1315@naver.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
		String num = Integer.toString(checkNum);
		
		return num;
    }
    
    /* 비밀번호 찾기이메일 인증 */
    @RequestMapping(value="/findPwMailCheck", method=RequestMethod.GET)
    @ResponseBody
    public String findPwMailCheckGET(String email) throws Exception{
        
        /* 뷰(View)로부터 넘어온 데이터 확인 */
        log.info("이메일 데이터 전송 확인");
        log.info("인증번호 : " + email);
        
        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        log.info("인증번호 " + checkNum);        
        /* 이메일 보내기 */
        String setFrom = "minseok1315@naver.com";
        String toMail = email;
        String title = "비밀번호 찾기 인증 이메일 입니다.";
        String content = 

                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
		String num = Integer.toString(checkNum);
		
		return num;
    }
    
    /* 회원수정 이메일변경 인증 */
    @RequestMapping(value="/updateMailCheck", method=RequestMethod.GET)
    @ResponseBody
    public String updateMailCheckGET(String email) throws Exception{
        
        /* 뷰(View)로부터 넘어온 데이터 확인 */
        log.info("이메일 데이터 전송 확인");
        log.info("인증번호 : " + email);
        
        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        log.info("인증번호 " + checkNum);        
        /* 이메일 보내기 */
        String setFrom = "minseok1315@naver.com";
        String toMail = email;
        String title = "이메일 재설정 인증 이메일 입니다.";
        String content = 

                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
		String num = Integer.toString(checkNum);
		
		return num;
    }
    
    @GetMapping("/findId")
	public String findIdForm() {
		log.info("아이디 찾기 호출");
		
		return "user/findMember/findIdForm";
	}
	
	@PostMapping("/findId")
	public String findId(MemberVO mvo , Model model) {
     MemberVO findId = memberservice.findId(mvo);
		
		if(findId == null) { 
			model.addAttribute("check", 1);
		} else { 
			model.addAttribute("check", 0);
			model.addAttribute("u_id", findId.getU_id());
		}
		
		return "user/findMember/findIdResult";
	}
	
	 @GetMapping("/findPw")
		public String findPwForm() {
			log.info("비밀번호 찾기 호출");
			
			return "user/findMember/findPwForm";
		}
	 
	 @PostMapping("/findPw")
		public String findPw(MemberVO mvo , Model model) {
	     MemberVO findPw = memberservice.findPw(mvo);
			
			if(findPw == null) { 
				model.addAttribute("check", 1);
			} else { 
				model.addAttribute("check", 0);
				model.addAttribute("u_email", findPw.getU_email());
			}
			
			return "user/findMember/findPwUpdate";
		}
	 
	 @ResponseBody
	 @PostMapping("/findPwChk")
	 public int findPwChk(MemberVO mvo) {
			int findPwResult = memberservice.findPwChk(mvo);
			return findPwResult;
			
		}
 
	 
	 @PostMapping("/findPwUpdate")
		public String findPwUpdate(MemberVO mvo) {
			
			log.info("회원비밀번호재설정");
			memberservice.findPwUpdate(mvo);
			
			
			return "redirect:/login";
		}
	 
	 
	 @PostMapping("/findPwUpdateForm")
	 public String findPwUpdateForm(HttpSession session , Model model) {
		 MemberVO memberLogin = (MemberVO) session.getAttribute("memberLogin");
		 log.info("비밀번호찾기 재설정 호출");
		 
		 if(memberLogin == null) {
			 return "redirect:/login";
		 }else {
			 return "/findPwUpdate";
		 }
	 }
	 
    /*@GetMapping("/sellList")
    public String sellListForm(HttpSession session, @ModelAttribute ProductVO pvo, Model model,@ModelAttribute MemberVO mvo) {
    	MemberVO member = (MemberVO)session.getAttribute("memberLogin");
	    log.info("판매내역 호출 성공");
	    
	    // 모델 객체에 데이터 전달
	    model.addAttribute("member", member);
	    
	    log.info("member :"+member);
		
		List<ProductVO> productSellList =  productService.selectProductSellList(mvo);
		
		log.info("productSellList :"+productSellList);
		log.info("pvo :"+pvo);
		
		
		model.addAttribute("productSellList", productSellList);
		log.info("model.productSellList :"+model.getAttribute("productSellList"));
		
		int total = productService.productListCnt(pvo);
		log.info("total :"+total);
		
		model.addAttribute("pageMaker", new PageDTO(pvo, total));
		log.info("model.pageMaker :"+model.getAttribute("pageMaker"));
		log.info("pageNum :" + pvo.getPageNum());
		
		int count = total - (pvo.getPageNum()-1) * pvo.getAmount();
		log.info("count :"+count);
		
		model.addAttribute("count", count);
		log.info("model.count :"+model.getAttribute("count"));
    	
    	return "user/myPage/myPageSellList";
    } */
	 
	 @GetMapping("/sellList")
	    public String sellListForm(HttpSession session,  Model model) {
	    	MemberVO mvo = (MemberVO)session.getAttribute("memberLogin");
		    log.info("마이페이지 판매내역 호출 성공");
		    
		    // 모델 객체에 데이터 전달
		   
			mvo.setAmount(5);
			List<ProductVO> productSellList =  productService.selectProductSellList(mvo);
			
			if(productSellList.size() > 0){
			ProductVO pvo = productSellList.get(0);
			pvo.setAmount(5);
			
			model.addAttribute("productSellList", productSellList);
			
			int total = productService.productMyPageListCnt(pvo);
			log.info("total :"+total);
			
			model.addAttribute("pageMaker", new PageDTO(pvo, total));
			}
	    	
	    	return "user/myPage/myPageSellList";
	    } 
    
    @GetMapping("/buyList")
    public String buyListForm(HttpSession session, Model model) {
    	MemberVO mvo = (MemberVO)session.getAttribute("memberLogin");
	    log.info("마이페이지 구매내역 호출 성공");
	    
	    // 모델 객체에 데이터 전달
	   
		mvo.setAmount(5);
		List<ProductVO> productBuyList =  productService.selectProductBuyList(mvo);
		
		if(productBuyList.size() > 0){
		ProductVO pvo = productBuyList.get(0);
		pvo.setAmount(5);
		
		model.addAttribute("productBuyList", productBuyList);
		
		int total = productService.productListCnt(pvo);
		log.info("total :"+total);
		
		model.addAttribute("pageMaker", new PageDTO(pvo, total));
		
		}
    	
    	return "user/myPage/myPageBuyList";
    } 
    
    @GetMapping("/likeList")
    public String likeListForm(HttpSession session, Model model) {
    	MemberVO mvo = (MemberVO)session.getAttribute("memberLogin");
	    log.info("마이페이지 좋아요(찜) 호출 성공");
	    
	    // 모델 객체에 데이터 전달
	   
		mvo.setAmount(5);
		List<ProductVO> productLikeList =  productService.selectProductLikeList(mvo);
		
		if(productLikeList.size() > 0){
		ProductVO pvo = productLikeList.get(0);
		pvo.setAmount(5);
		
		model.addAttribute("productLikeList", productLikeList);
		
		int total = productService.productListCnt(pvo);
		log.info("total :"+total);
		
		model.addAttribute("pageMaker", new PageDTO(pvo, total));
		
		}
    	
    	return "user/myPage/myPageLike";
    } 
    
    @PostMapping("/productStatus")
	public String productStatus(ProductVO pvo) {
		
		log.info("판매완료");
		
		productService.productStatus(pvo);
		
		
		return "redirect:/member/sellList";
	}
    
    @GetMapping(value="/myPageServiceList")
	public String serviceList(HttpSession session, @ModelAttribute MemberVO user, @ModelAttribute ServiceCenterVO vo, AdmServiceCenterVO svo, Model model) {
    	log.info("serviceList() 실행...");
    	
    	user = (MemberVO)session.getAttribute("memberLogin");
    	vo.setU_no(user.getU_no());
		
		List<ServiceCenterVO> serviceMyPageList = serviceCenter.selectServiceMyPageList(vo);
		model.addAttribute("serviceMyPageList", serviceMyPageList);
		
		List<AdmServiceCenterVO> admServiceList = admserviceCenter.admReplyList();
		model.addAttribute("admServiceList", admServiceList);
		log.info("답글 확인 : " + admServiceList);

		int total = serviceCenter.selectServiceCnt(vo);
		vo.setAmount(10);
		model.addAttribute("pageMaker", new PageDTO(vo, total));
		
		return "user/myPage/myPageServiceList";
	}
    
    @GetMapping("/mypage")
	public String myPage(HttpSession session, Model model) {
    	MemberVO mvo = (MemberVO)session.getAttribute("memberLogin");
	    log.info("마이페이지 좋아요(찜) 호출 성공");
	    
	    // 모델 객체에 데이터 전달
	   
		mvo.setAmount(3);
		List<ProductVO> productLikeList =  productService.selectProductLikeList(mvo);
		
		if(productLikeList.size() > 0){
		ProductVO pvo = productLikeList.get(0);
		pvo.setAmount(3);
		
		model.addAttribute("productLikeList", productLikeList);
		}
		mvo.setAmount(3);
		List<ProductVO> productBuyList =  productService.selectProductBuyList(mvo);
		
		if(productBuyList.size() > 0){
		ProductVO pvo2 = productBuyList.get(0);
		pvo2.setAmount(3);
		
		model.addAttribute("productBuyList", productBuyList);
		}
		mvo.setAmount(3);
		List<ProductVO> productSellList =  productService.selectProductSellList(mvo);
		
		if(productSellList.size() > 0){
		ProductVO pvo3 = productSellList.get(0);
		pvo3.setAmount(3);
		
		model.addAttribute("productSellList", productSellList);
		}
		return "user/myPage/myPageIndex";
	}
    
    @GetMapping("/addressCheck")
    public String addressCheck(HttpSession session, Model model) {
    	
    	MemberVO mvo = (MemberVO)session.getAttribute("memberLogin");
    	
    	log.info("세션에서 꺼내온 정보 : " + mvo);
    	
    	List<MemberAddressVO> list = memberAddressService.memberAddressInfoAll(mvo);
    	
    	log.info("조회 후 결과 : " + list);
    	
    	model.addAttribute("addressList", list);
    	
    	return "user/myPage/myPageAddressInfo";
    }
}