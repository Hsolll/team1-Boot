package com.omb.user.login.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.omb.user.member.vo.MemberVO;
import com.omb.user.memberLogin.service.MemberLoginService;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/*")
@Slf4j
public class LoginController {

	@Setter(onMethod_ = @Autowired)
	private MemberLoginService memberLoginService;

	/* KakaoLogin */
	@Setter(onMethod_ = @Autowired)
	private KakaoLoginBO kakaoLoginBO;

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	@GetMapping("/login")
	public String loginForm(Model model, HttpSession session) {

		/* 카카오 URL */
		String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session);
		model.addAttribute("urlKakao", kakaoAuthUrl);

		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125

		// 네이버
		model.addAttribute("url", naverAuthUrl);

		return "user/login/loginForm";
	}

	@PostMapping("/login")
	public String login(HttpSession session, MemberVO mvo, RedirectAttributes ras) {
		MemberVO memberLogin = memberLoginService.memberLogin(mvo);

		String url = "";
		if (memberLogin != null && memberLogin.getU_status().equals("USING")) {
			if (memberLogin.getU_grade().equals("3")) {
				ras.addFlashAttribute("errorMsg", "블랙회원입니다.");
				url = "/login";
			} else {
				if (memberLogin.getU_grade().equals("2")) {
					ras.addFlashAttribute("errorMsg", "경고회원입니다.");
				}
				session.setAttribute("memberLogin", memberLogin);
				url = "/";
			}
		} else {
			if (memberLogin != null) {
				ras.addFlashAttribute("errorMsg", "탈퇴된 회원입니다.");
			} else {
				ras.addFlashAttribute("errorMsg", "아이디와 비밀번호를 확인해주세요");
			}
			url = "/login";
		}
		return "redirect:" + url;
	}

	@PostMapping("/socialLogin")
	public String naverLogin(HttpSession session, MemberVO mvo, RedirectAttributes ras) {
		MemberVO memberLogin = memberLoginService.socialLogin(mvo);

		String url = "";
		if (memberLogin != null) {
			session.setAttribute("memberLogin", memberLogin);
			url = "/";
		} else {
			ras.addFlashAttribute("errorMsg", "아이디와 비밀번호를 확인해주세요");
			url = "/login";
		}
		return "redirect:" + url;
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session,
			@ModelAttribute MemberVO mvo) throws IOException, ParseException {

		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);

		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터

		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;

		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		// response의 nickname값 파싱
		String email = (String) response_obj.get("email");


		// 4.파싱 닉네임 세션으로 저장
		session.setAttribute("socialLogin", email); // 세션 생성

		model.addAttribute("u_email", email);

		return "user/naver";
	}

	@ResponseBody
	@PostMapping("/socialChk")
	public String naverChk(MemberVO mvo) {
		String naverChkResult = memberLoginService.socialChk(mvo);
		return naverChkResult;

	}

	// 카카오 로그인 성공시 callback
	@RequestMapping(value = "/kakaoCallback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callbackKakao(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws Exception {
		OAuth2AccessToken oauthToken;
		oauthToken = kakaoLoginBO.getAccessToken(session, code, state);
		// 로그인 사용자 정보를 읽어온다
		apiResult = kakaoLoginBO.getUserProfile(oauthToken);

		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj;

		jsonObj = (JSONObject) jsonParser.parse(apiResult);
		JSONObject response_obj = (JSONObject) jsonObj.get("kakao_account");
		JSONObject response_obj2 = (JSONObject) response_obj.get("profile");
		// 프로필 조회
		String email = (String) response_obj.get("email");
		String name = (String) response_obj2.get("nickname");
		// 세션에 사용자 정보 등록
		session.setAttribute("signIn", apiResult);
		session.setAttribute("socialLogin", email);
		session.setAttribute("name", name);

		return "user/kakaoCallback";
	}

}