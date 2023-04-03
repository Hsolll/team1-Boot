package com.omb.admin.login.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.omb.admin.login.service.AdminLoginService;
import com.omb.admin.statistics.service.StatisticsService;
import com.omb.admin.vo.AdminVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@SessionAttributes("adminLogin") 
@RequestMapping(value="/admin/*")
@Slf4j
public class AdminLoginController {
	@Setter(onMethod_= @Autowired)
	private AdminLoginService adminLoginService;
	
	@Setter(onMethod_=@Autowired)
	private StatisticsService statisticsService;
	
	@ModelAttribute
	public AdminVO admin() {
		return new AdminVO();
	}
	
	@RequestMapping("/main")
	public String adminMain() {
		log.info("관리자 메인 화면 호출...");
		
		return "admin/main/adminMain";
	}
	
	@GetMapping("/login")
	public String loginForm() {
		log.info("관리자 로그인 화면 호출....");
		return "admin/adminLogin";
	}
	
	@PostMapping("/login")
	public String loginProcess(@ModelAttribute AdminVO login, Model model, RedirectAttributes ras) {
		String url="";
		AdminVO admin = adminLoginService.selectLoginProcess(login);
		
		if(admin != null) {
			model.addAttribute("adminLogin", admin);
			url = "/admin/main";
		} else {
			ras.addFlashAttribute("errorMsg", "로그인 실패");
			url = "/admin/login";
		}
		return "redirect:"+url;
	}
	
	@RequestMapping("/logout")
	public String logout(SessionStatus sessionStatus) {
		log.info("관리자 로그아웃 처리");
		sessionStatus.setComplete();
		return "redirect:/admin/login";
	}
	
	@ResponseBody
	@GetMapping(value="/main/getUsers")
	public String getUserStatistics() {
		List<Map<String, Object>> list = statisticsService.selectUser();
		JSONArray jsonList = new JSONArray();
		for(Map<String, Object> m:list) {
			JSONObject json = new JSONObject();
			for(Map.Entry<String, Object> entry:m.entrySet()) {
				String key = entry.getKey();
				Object value = entry.getValue();
				json.put(key, value);
			}
			jsonList.put(json);
		}
		return jsonList.toString();
	}
	
	@ResponseBody
	@GetMapping(value="/main/getOrders")
	public String getOrderStatistics() {
		List<Map<String, Object>> list = statisticsService.selectOrder();
		JSONArray jsonList = new JSONArray();
		for(Map<String, Object> m:list) {
			JSONObject json = new JSONObject();
			for(Map.Entry<String, Object> entry:m.entrySet()) {
				String key = entry.getKey();
				Object value = entry.getValue();
				json.put(key, value);
			}
			jsonList.put(json);
		}
		return jsonList.toString();
	}
}
