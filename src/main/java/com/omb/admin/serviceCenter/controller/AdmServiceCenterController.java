package com.omb.admin.serviceCenter.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.omb.admin.serviceCenter.service.AdmServiceCenterService;
import com.omb.admin.serviceCenter.vo.AdmServiceCenterVO;
import com.omb.common.vo.PageDTO;
import com.omb.user.serviceCenter.service.ServiceCenterService;
import com.omb.user.serviceCenter.vo.ServiceCenterVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor
@Controller
@RequestMapping("/admin/*")
@Slf4j
public class AdmServiceCenterController {

	@Setter(onMethod_=@Autowired)
	private AdmServiceCenterService admserviceCenter;
	
	@Setter(onMethod_= @Autowired)
	private ServiceCenterService serviceCenterService;
	
	@GetMapping("/serviceCenterList")
	public String admReplyList(@ModelAttribute AdmServiceCenterVO vo,ServiceCenterVO uservo, Model model) {
		log.info("serviceCenterList 메서드 호출");
		
		List<ServiceCenterVO> serviceList = serviceCenterService.selectServiceList(uservo);
		model.addAttribute("serviceList", serviceList);
		
		List<AdmServiceCenterVO> admServiceList = admserviceCenter.admReplyList();
		model.addAttribute("admServiceList", admServiceList);
		log.info("답글 확인 : " + admServiceList);
		
		int total = serviceCenterService.selectServiceCnt(uservo);
		vo.setAmount(10);
		model.addAttribute("pageMaker", new PageDTO(vo, total));
		
		return "admin/serviceCenter/admServiceCenterList";
	}
	
	@PostMapping(value="/serviceCneterInsert")
	public String admServiceInsert(AdmServiceCenterVO svo) throws Exception{
		log.info("serviceCenterInsert 실행");
		String url="";
		int result = 0;
		result = admserviceCenter.admServiceInsert(svo);
		
		log.info("result="+result);
		
		if(result == 1) {
			url ="/admin/serviceCenterList";
		}else {
			url ="/admin/serviceCenterWriteForm";
		}
		return "redirect:"+url;
	}
	
	@GetMapping(value="/serviceCenterDetail")
	public String admServiceDetail(@ModelAttribute AdmServiceCenterVO vo, ServiceCenterVO uservo,Model model) {
		log.info("serviceCenterDetail 실행");
		ServiceCenterVO detail = serviceCenterService.selectServiceDetail(uservo);
		model.addAttribute("serviceDetail", detail);
		
		return "admin/serviceCenter/admServiceCenterDetail";
	}
	
	@GetMapping(value="/replyDetail")
	public String replyServiceDetail(@ModelAttribute AdmServiceCenterVO avo, Model model) {
		log.info("replyDetail 실행");
		 
		
		AdmServiceCenterVO admServiceList = admserviceCenter.replyServiceDetail(avo);
		model.addAttribute("replyDetail", admServiceList);
		return "admin/serviceCenter/replyServiceCenterDetail";
	}
	
	@GetMapping(value="/replyWriteForm")
	public String admReplyWriteForm(@ModelAttribute ServiceCenterVO uservo,Model model) {
		log.info("replyWriteForm 실행");
		ServiceCenterVO detail = serviceCenterService.selectServiceDetail(uservo);
		model.addAttribute("serviceDetail", detail);
		
		return "admin/serviceCenter/replyServiceCenterWriteForm";
	}

	
	
	@PostMapping(value="/replyServiceCenterDelete")
	public String admServiceCenterDelete(@ModelAttribute AdmServiceCenterVO admsvo) throws Exception{
		log.info("serviceCenterDelete 호출 성공");
		log.info("삭제할 답글번호:" + admsvo.getAs_no());
		
		int result = 0;
		String url ="";
		
		result = admserviceCenter.admServiceCenterDelete(admsvo);
		
		if(result == 1) {
			url="/admin/serviceCenterList";
		}else{
			url="/admin/serviceCenterList?=as_no"+admsvo.getAs_no();
		}
		return "redirect:"+url;
	}
	
	@PostMapping(value="/serviceCenterDelete")
	public String deleteService(@ModelAttribute ServiceCenterVO svo) throws Exception{
		log.info("serviceDelete 호출 성공");
		log.info("삭제할 원글번호:" + svo.getSc_no());
		
		int result = 0;
		String url = "";
		
		result = serviceCenterService.deleteService(svo);
		
		if(result == 1) {
			url="/admin/serviceCenterList";
		}else {
			url="/admin/serviceDetail?=sc_no"+svo.getSc_no();
		}
		return "redirect:"+url;
	}
	
	@GetMapping(value="/replyUpdateForm")
	public String admReplyUpdateForm(@ModelAttribute AdmServiceCenterVO svo, Model model) {
		log.info("serviceCenterUpdateForm 호출 성공");
		
		AdmServiceCenterVO updateForm = admserviceCenter.replyServiceDetail(svo);
		
		model.addAttribute("updateForm", updateForm);
		
		return "/admin/serviceCenter/replyUpdateForm";
	}
	
	@PostMapping(value="/admReplyUpdate")
	public String admReplyUpdate(@ModelAttribute AdmServiceCenterVO svo) throws Exception{
		log.info("admReplyUpdate 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = admserviceCenter.admReplyUpdate(svo);
		
		if(result == 1) {
			url="/admin/replyDetail?as_no="+svo.getAs_no();
		}else {
			url="/admin/replyUpdateForm?as_no="+svo.getAs_no();
		}
		return "redirect:"+url;
	}
	
}
