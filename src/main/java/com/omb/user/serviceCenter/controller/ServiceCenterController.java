package com.omb.user.serviceCenter.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.omb.common.vo.PageDTO;
import com.omb.user.member.vo.MemberVO;
import com.omb.user.serviceCenter.service.ServiceCenterService;
import com.omb.user.serviceCenter.vo.ServiceCenterVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value="/serviceCenter/*")
@Slf4j
public class ServiceCenterController {
	
	@Setter(onMethod_=@Autowired)
	private ServiceCenterService serviceCenter;
	
	@ModelAttribute
	public MemberVO user(HttpSession session){
		MemberVO user = null;
		user = (MemberVO)session.getAttribute("memberLogin");
		return user;
	}
	
	@GetMapping(value="/serviceList")
	public String serviceList(HttpSession session, @ModelAttribute MemberVO user, @ModelAttribute ServiceCenterVO vo, Model model) {
		log.info("serviceList() 실행...");
		
		List<ServiceCenterVO> serviceList = serviceCenter.selectServiceList(vo);
		model.addAttribute("serviceList", serviceList);
		
		int total = serviceCenter.selectServiceCnt(vo);
		vo.setAmount(10);
		model.addAttribute("pageMaker", new PageDTO(vo, total));
		
		return "user/serviceCenter/serviceList";
	}
	
	@RequestMapping(value="/writeForm")
	public String serviceWriteForm(@ModelAttribute MemberVO user) {
		return "user/serviceCenter/serviceWriteForm";
	}
	
	
	@PostMapping(value="/serviceWrite")
	public String serviceWrite(HttpSession session, @ModelAttribute MemberVO user, ServiceCenterVO vo, Model model) throws Exception {
		String url = "";
		log.info("serviceWrite() 실행...");
		
		int result = 0;
		result = serviceCenter.insertService(vo);
		if(result == 1) {
			url = "/serviceCenter/serviceList";
		} else {
			url = "/serviceCenter/writeForm";
		}
		return "redirect:"+url;
	}
	
	@GetMapping(value="/serviceDetail")
	public String serviceDetail(@ModelAttribute ServiceCenterVO vo, Model model) {
		log.info("serviceDetail() 실행...");
		ServiceCenterVO detail = serviceCenter.selectServiceDetail(vo);
		model.addAttribute("serviceDetail", detail);
		
		return "user/serviceCenter/serviceDetail";
	}
	
	@GetMapping("/servicePwdConfirm")
	public String servicePwdConfirm(@ModelAttribute ServiceCenterVO vo, Model model) {
		
		model.addAttribute("data", vo);
		return "user/serviceCenter/pwdConfirm";
	}
	
	@ResponseBody
	@RequestMapping(value="/servicepwdChk", method=RequestMethod.POST, produces="text/plain; charset=UTF-8")
	public String servicePwdChk(@ModelAttribute ServiceCenterVO vo, Model model) {
		String value = "";
		int result = serviceCenter.selectPwdChk(vo);
		if(result == 1) {
			value="성공";
		} else {
			value="실패";
		}
		return value;
	}
	
	@GetMapping(value="/serviceDelete")
	public String serviceDelete(@ModelAttribute ServiceCenterVO vo) throws Exception {
		String url = "";
		int result = serviceCenter.updateServiceDel(vo);
		log.info("serviceDelete() 실행결과 : "+result);
		if (result == 1) {
			url = "/serviceCenter/serviceList";
		} else {
			url = "/serviceCenter/serviceDetail";
		}
		return "redirect:"+url;
	}
	
	@RequestMapping(value="serviceUpdateForm")
	public String serviceUpdateForm(@ModelAttribute ServiceCenterVO vo, Model model) {
		ServiceCenterVO data = serviceCenter.updateForm(vo);
		model.addAttribute("updateData", data);
		
		return "user/serviceCenter/updateForm";
	}
	
	@PostMapping(value="serviceUpdate")
	public String serviceDupdate(@ModelAttribute ServiceCenterVO vo) throws Exception{
		String url = "";
		int result = serviceCenter.updateService(vo);
		if(result == 1) {
			url = "/serviceCenter/serviceDetail?sc_no="+vo.getSc_no();
		} else {
			url = "/serviceCenter/updateForm";
		}
		return "redirect:"+url;
	}
	
	
}
