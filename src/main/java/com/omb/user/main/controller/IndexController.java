package com.omb.user.main.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.omb.admin.notice.service.AdmNoticeService;
import com.omb.admin.notice.vo.AdmNoticeVO;

import lombok.Setter;

@Controller
public class IndexController {
	
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@Setter(onMethod_ = @Autowired)
	private AdmNoticeService admNoticeService;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("메인 페이지 실행");
		
		// 메인페이지 실행 시 공지사항 불러오기
		List<AdmNoticeVO> noticeList = admNoticeService.selectMainNoticeList();
		logger.info("공지사항 조회 결과 : " + noticeList);
		
		model.addAttribute("noticeList", noticeList);
		
		return "index";	// /WEB-INF/views/index.jsp
	}
  
}
