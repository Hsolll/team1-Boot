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
import com.omb.user.community.service.UserCommunityService;
import com.omb.user.community.vo.UserCommunityVO;
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

	@Setter(onMethod_ = @Autowired)
	private MemberService memberService;

	@Setter(onMethod_ = @Autowired)
	private ProductService productService;

	@Setter(onMethod_ = @Autowired)
	private ServiceCenterService serviceCenter;

	@Setter(onMethod_ = @Autowired)
	private AdmServiceCenterService admserviceCenter;
	
	@Setter(onMethod_ =@Autowired)
	private UserCommunityService userCommunityService; 

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
		return "user/login/signUpAgree";
	}

	@PostMapping("/signUpForm")
	public String signUpForm() {

		return "user/login/signUpForm";
	}

	@GetMapping("/naverSignUp")
	public String naverSignUpForm() {
		return "user/login/naverSignUp";
	}

	@GetMapping("/kakaoSignUp")
	public String kakaoSignUpForm() {
		return "user/login/kakaoSignUp";
	}

	@PostMapping("/signUp")
	public String signUp(MemberVO mvo) {

		int nickResult = memberService.nickChk(mvo);
		int result = memberService.idChk(mvo);
		int emailResult = memberService.emailChk(mvo);
		int phoneResult = memberService.phoneChk(mvo);

		if (result == 1 && nickResult == 1 && emailResult == 1 && phoneResult == 1) {
			return "redirect:/member/signUpForm";
		} else {
			memberService.signUp(mvo);
			memberService.addressInsert(mvo);
			return "redirect:/login";
		}
	}

	@PostMapping("/naverSignUp")
	public String naverSignUp(MemberVO mvo) {

		int nickResult = memberService.nickChk(mvo);
		int result = memberService.idChk(mvo);
		int phoneResult = memberService.phoneChk(mvo);

		if (result == 1 && nickResult == 1 && phoneResult == 1) {
			return "redirect:/member/naverSignUp";
		} else {
			memberService.naverSignUp(mvo);
			memberService.addressInsert(mvo);
		}

		return "redirect:/login";
	}

	@PostMapping("/kakaoSignUp")
	public String kakaoSignUp(MemberVO mvo) {

		int nickResult = memberService.nickChk(mvo);
		int result = memberService.idChk(mvo);
		int phoneResult = memberService.phoneChk(mvo);

		if (result == 1 && nickResult == 1 && phoneResult == 1) {
			return "redirect:/member/kakaoSignUp";
		} else {
			memberService.kakaoSignUp(mvo);
			memberService.addressInsert(mvo);
		}

		return "redirect:/login";
	}

	@PostMapping("/updateForm")
	public String updateForm(@ModelAttribute MemberVO mvo, Model model) {

		MemberVO result = memberService.getMemberInfo(mvo);
		model.addAttribute("update", result);

		return "user/member/memberUpdateForm";
	}

	@GetMapping("/socialUpdateForm")
	public String socialUpdateForm(@ModelAttribute MemberVO mvo, Model model) {

		MemberVO result = memberService.getMemberInfo(mvo);
		model.addAttribute("update", result);

		return "user/member/socialUpdateForm";
	}

	@PostMapping("/memberUpdate")
	public String memberUpdate(MemberVO mvo) {

		memberService.memberUpdate(mvo);
		memberService.addressUpdate(mvo);

		return "redirect:/member/mypage";
	}

	@PostMapping("/deleteForm")
	public String deleteForm(MemberVO mvo) {
		return "user/member/memberDeleteForm";
	}

	@PostMapping("/memberDelete")
	public String memberDelete(MemberVO mvo) {

		memberService.memberDelete(mvo);

		return "redirect:/logout";
	}

	@ResponseBody
	@PostMapping("/idChk")
	public int idChk(MemberVO mvo) {
		int result = memberService.idChk(mvo);
		return result;
	}

	@ResponseBody
	@PostMapping("/nickChk")
	public int nickChk(MemberVO mvo) {
		int nickResult = memberService.nickChk(mvo);
		return nickResult;
	}

	@ResponseBody
	@PostMapping("/emailChk")
	public int emailChk(MemberVO mvo) {
		int emailResult = memberService.emailChk(mvo);
		return emailResult;
	}

	@ResponseBody
	@PostMapping("/phoneChk")
	public int phoneChk(MemberVO mvo) {
		int phoneResult = memberService.phoneChk(mvo);
		return phoneResult;
	}

	@PostMapping("/pwdUpdateForm")
	public String pwdUpdateForm(MemberVO mvo) {
		return "user/member/memberPwdUpdate";
	}

	@PostMapping("/memberPwdUpdate")
	public String memberPwdUpdate(MemberVO mvo) {

		memberService.memberPwdUpdate(mvo);

		return "redirect:/logout";
	}

	@GetMapping("/pwdChkForm")
	public String pwdChkForm(MemberVO mvo) {

		return "user/member/memberConfirmPw";
	}

	@GetMapping("/pwdChkForm2")
	public String pwdChkForm2(MemberVO mvo) {

		return "user/member/memberConfirmPw2";
	}

	@GetMapping("/pwdChkForm3")
	public String pwdChkForm3(MemberVO mvo) {

		return "user/member/memberConfirmPw3";
	}

	@ResponseBody
	@PostMapping("/pwdChk")
	public int pwdChk(MemberVO mvo) {
		int pwdChkResult = memberService.pwdChk(mvo);
		log.info("결과" + pwdChkResult);
		return pwdChkResult;
	}

	/* 이메일 인증 */
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception {

		/* 인증번호(난수) 생성 */
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		log.info("인증번호 " + checkNum);
		/* 이메일 보내기 */
		String setFrom = email;
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + checkNum + "입니다." + "<br>"
				+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}
		String num = Integer.toString(checkNum);

		return num;
	}

	/* 비밀번호 찾기이메일 인증 */
	@RequestMapping(value = "/findPwMailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String findPwMailCheckGET(String email) throws Exception {

		/* 인증번호(난수) 생성 */
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		log.info("인증번호 " + checkNum);
		/* 이메일 보내기 */
		String setFrom = email;
		String toMail = email;
		String title = "비밀번호 찾기 인증 이메일 입니다.";
		String content =

				"인증 번호는 " + checkNum + "입니다." + "<br>" + "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}
		String num = Integer.toString(checkNum);

		return num;
	}

	/* 회원수정 이메일변경 인증 */
	@RequestMapping(value = "/updateMailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String updateMailCheckGET(String email) throws Exception {

		/* 인증번호(난수) 생성 */
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		log.info("인증번호 " + checkNum);
		/* 이메일 보내기 */
		String setFrom = email;
		String toMail = email;
		String title = "이메일 재설정 인증 이메일 입니다.";
		String content =

				"인증 번호는 " + checkNum + "입니다." + "<br>" + "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}
		String num = Integer.toString(checkNum);

		return num;
	}

	@GetMapping("/findId")
	public String findIdForm() {

		return "user/findMember/findIdForm";
	}

	@PostMapping("/findId")
	public String findId(MemberVO mvo, Model model) {
		MemberVO findId = memberService.findId(mvo);

		if (findId == null) {
			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
			model.addAttribute("u_id", findId.getU_id());
		}

		return "user/findMember/findIdResult";
	}

	@GetMapping("/findPw")
	public String findPwForm() {

		return "user/findMember/findPwForm";
	}

	@PostMapping("/findPw")
	public String findPw(MemberVO mvo, Model model) {
		MemberVO findPw = memberService.findPw(mvo);

		if (findPw == null) {
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
		int findPwResult = memberService.findPwChk(mvo);
		return findPwResult;

	}

	@PostMapping("/findPwUpdate")
	public String findPwUpdate(MemberVO mvo) {

		memberService.findPwUpdate(mvo);

		return "redirect:/login";
	}

	@PostMapping("/findPwUpdateForm")
	public String findPwUpdateForm(HttpSession session, Model model) {
		MemberVO memberLogin = (MemberVO) session.getAttribute("memberLogin");

		if (memberLogin == null) {
			return "redirect:/login";
		} else {
			return "/findPwUpdate";
		}
	}

	@GetMapping("/sellList")
	public String sellListForm(HttpSession session, Model model, ProductVO pvo) {
		MemberVO mvo = (MemberVO) session.getAttribute("memberLogin");

		// 모델 객체에 데이터 전달
		pvo.setU_no(mvo.getU_no());
		pvo.setAmount(10);
		List<ProductVO> productSellList = productService.selectProductSellList(pvo);

		model.addAttribute("productSellList", productSellList);

		int total = productService.productMyPageListCnt(pvo);

		model.addAttribute("pageMaker", new PageDTO(pvo, total));
		if (pvo.getSearch() != "") {
			model.addAttribute("search", pvo.getSearch());
		}
		if (pvo.getKeyword() != "") {
			model.addAttribute("keyword", pvo.getKeyword());
		}

		return "user/myPage/myPageSellList";
	}

	@GetMapping("/buyList")
	public String buyListForm(HttpSession session, Model model, ProductVO pvo) {
		MemberVO mvo = (MemberVO) session.getAttribute("memberLogin");

		// 모델 객체에 데이터 전달
		pvo.setU_id(mvo.getU_id());
		pvo.setU_no(mvo.getU_no());
		pvo.setAmount(10);
		List<ProductVO> productBuyList = productService.selectProductBuyList(pvo);

		model.addAttribute("productBuyList", productBuyList);

		int total = productService.productMyPageBuyListCnt(pvo);

		model.addAttribute("pageMaker", new PageDTO(pvo, total));

		return "user/myPage/myPageBuyList";
	}

	@GetMapping("/likeList")
	public String likeListForm(HttpSession session, Model model, ProductVO pvo) {
		MemberVO mvo = (MemberVO) session.getAttribute("memberLogin");
		log.info("마이페이지 좋아요(찜)내역 호출 성공");

		// 모델 객체에 데이터 전달
		pvo.setU_no(mvo.getU_no());
		pvo.setAmount(10);
		List<ProductVO> productMyPageLikeList = productService.selectProductMyPageLikeList(pvo);

		model.addAttribute("productMyPageLikeList", productMyPageLikeList);

		int total = productService.productMyPageLikeListCnt(pvo);

		model.addAttribute("pageMaker", new PageDTO(pvo, total));

		return "user/myPage/myPageLike";
	}

	@PostMapping("/productStatus")
	public String productStatus(ProductVO pvo) {


		productService.productStatus(pvo);

		return "redirect:/member/sellList";
	}

	@GetMapping(value = "/myPageServiceList")
	public String serviceList(HttpSession session, @ModelAttribute MemberVO user, @ModelAttribute ServiceCenterVO vo,
			AdmServiceCenterVO svo, Model model) {

		user = (MemberVO) session.getAttribute("memberLogin");
		vo.setU_no(user.getU_no());

		List<ServiceCenterVO> serviceMyPageList = serviceCenter.selectServiceMyPageList(vo);
		model.addAttribute("serviceMyPageList", serviceMyPageList);

		List<AdmServiceCenterVO> admServiceList = admserviceCenter.admReplyList();
		model.addAttribute("admServiceList", admServiceList);

		int total = serviceCenter.selectMypageServiceCnt(vo);
		vo.setAmount(10);
		model.addAttribute("pageMaker", new PageDTO(vo, total));

		return "user/myPage/myPageServiceList";
	}

	@GetMapping("/mypage")
	public String myPage(HttpSession session, Model model, ProductVO pvo) {
		MemberVO mvo = (MemberVO) session.getAttribute("memberLogin");

		pvo.setU_no(mvo.getU_no());
		int productMyPageSellSoldOut = productService.productMyPageSellSoldOut(pvo);
		model.addAttribute("productMyPageSellSoldOut", productMyPageSellSoldOut);

		pvo.setU_id(mvo.getU_id());
		pvo.setU_no(mvo.getU_no());
		int productMyPageBuyListCnt = productService.productMyPageBuyListCnt(pvo);
		model.addAttribute("productMyPageBuyListCnt", productMyPageBuyListCnt);

		pvo.setU_no(mvo.getU_no());
		int productMyPageSellSale = productService.productMyPageSellSale(pvo);
		model.addAttribute("productMyPageSellSale", productMyPageSellSale);

		// 모델 객체에 데이터 전달
		pvo.setU_id(mvo.getU_id());
		pvo.setU_no(mvo.getU_no());
		pvo.setAmount(3);
		List<ProductVO> productBuyList = productService.selectProductBuyList(pvo);

		model.addAttribute("productBuyList", productBuyList);

		// 모델 객체에 데이터 전달
		pvo.setU_no(mvo.getU_no());
		pvo.setAmount(3);
		List<ProductVO> productSellList = productService.selectProductSellList(pvo);

		model.addAttribute("productSellList", productSellList);

		return "user/myPage/myPageIndex";
	}

	@GetMapping("/addressCheck")
	public String addressCheck(HttpSession session, Model model) {

		MemberVO mvo = (MemberVO) session.getAttribute("memberLogin");

		List<MemberAddressVO> list = memberAddressService.memberAddressInfoAll(mvo);

		model.addAttribute("addressList", list);

		return "user/myPage/myPageAddressInfo";
	}
	
	@GetMapping("/myPageCommunityList")
	public String communityList(HttpSession session ,UserCommunityVO community, Model model) {
		MemberVO mvo = (MemberVO) session.getAttribute("memberLogin");
		community.setU_no(mvo.getU_no());
		
		String path = "";
		log.info("communityList 메서드 호출");
		log.info("전달받은 값 : " + community.getC_category());
		log.info("1. 현재 페이지 : " + community.getPageNum());
		log.info("1. 보여줄 데이터 수 : " + community.getAmount());
		
		if(community.getC_category().equals("C")) {
			path = "user/myPage/myPageCommunityList";
		}
		else if(community.getC_category().equals("A")) {
			path = "user/myPage/myPageCommunityListReview";
		}
		else if(community.getC_category().equals("B")) {
			path = "user/myPage/myPageCommunityListRecipe";
		}
		
		log.info("이동할 경로 : " + path);
		
		List<UserCommunityVO> myPageCommunityList = userCommunityService.myPageCommunityList(community);
		
		model.addAttribute("myPageCommunityList", myPageCommunityList);
		
		// 전체 레코드 수 구현 
		int total = userCommunityService.myPageCommunityListCnt(community);
		log.info("전체 레코드 수 : " + total);
		//페이징 처리
		model.addAttribute("pageMaker", new PageDTO(community, total));
		
		return path;
	}
}