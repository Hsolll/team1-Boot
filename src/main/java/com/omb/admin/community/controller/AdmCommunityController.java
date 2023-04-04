package com.omb.admin.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.omb.common.vo.PageDTO;
import com.omb.user.community.service.UserCommunityService;
import com.omb.user.community.vo.UserCommunityVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value="/admin/*")
@Slf4j
public class AdmCommunityController {
	
	@Setter(onMethod_= @Autowired)
	private UserCommunityService userCommunityService;
	
	@GetMapping("/admCommunityList")
	public String admCommunityList(UserCommunityVO community, Model model) {
		
		String path = "";
		log.info("communityList 메서드 호출");
		log.info("전달받은 값 : " + community.getC_category());
		log.info("1. 현재 페이지 : " + community.getPageNum());
		log.info("1. 보여줄 데이터 수 : " + community.getAmount());
		
		if(community.getC_category().equals("C")) {
			path = "admin/admCommunity/admCommunityList";
		}
		else if(community.getC_category().equals("A")) {
			path = "admin/admCommunity/admCommunityListReview";
		}
		else if(community.getC_category().equals("B")) {
			path = "admin/admCommunity/admCommunityListRecipe";
		}
		
		log.info("이동할 경로 : " + path);
		
		List<UserCommunityVO> communityList = userCommunityService.communityList(community);
		
		model.addAttribute("communityList", communityList);
		
		// 전체 레코드 수 구현 
		int total = userCommunityService.communityListCnt(community);
		log.info("전체 레코드 수 : " + total);
		//페이징 처리
		model.addAttribute("pageMaker", new PageDTO(community, total));
		
		return path;
	}
	
	
	@GetMapping("/admCommunityDetail")
	public String admCommunityDetail(UserCommunityVO community, Model model) {
		
		log.info("communityDetail 메서드 호출");
		log.info("전달받은 글번호 : " + community.getC_no());
		
		UserCommunityVO detail = userCommunityService.communityDetail(community);
		log.info("게시판 상세 : " + detail);
		
		model.addAttribute("detail", detail);
		
		return "admin/admCommunity/admCommunityDetail";
	}
	
	
	// 데이터 삭제 처리
		@PostMapping("/admDeleteCommunity")
		public String admDeleteCommunity(UserCommunityVO community) {
			log.info("삭제 전달받은 글번호 : " + community.getC_no());
			
			int result = 0;
			String path = "";
			
			result = userCommunityService.deleteCommunity(community);
			
			if(result == 1) {
				log.info("삭제완료");
				path = "/admin/admCommunityList?c_category=" + community.getC_category();
			} else {
				path = "/admin/admCommunityDetail?c_no=" + community.getC_no();
			}
			
			return "redirect:" + path;
		}
}
