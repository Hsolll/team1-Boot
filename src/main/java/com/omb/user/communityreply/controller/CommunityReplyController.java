package com.omb.user.communityreply.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.omb.user.communityreply.service.CommunityReplyService;
import com.omb.user.communityreply.vo.CommunityReplyVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/communityReplies")
@Slf4j
public class CommunityReplyController {
	
	@Setter(onMethod_ = @Autowired)
	private CommunityReplyService communityReplyService;

	
	@GetMapping(value = "/all/{c_no}", produces=MediaType.APPLICATION_JSON_VALUE)
	public List<CommunityReplyVO> replyList(@PathVariable("c_no") Integer c_no) {
		log.info("list 호출 성공");
			 
		List<CommunityReplyVO> entity = null;
		entity = communityReplyService.communityReplyList(c_no);
		
		return entity;
	}
	
	
	@PostMapping(value = "/replyInsert", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public String communityReplyInsert(@RequestBody CommunityReplyVO crvo) {
		
		log.info("communityReplyInsert 호출 성공");
		log.info("CommunityReplyVO : " + crvo);
		
		int result = 0;
		
		result = communityReplyService.communityReplyInsert(crvo);
		
		return (result==1) ? "SUCCESS": "FAILURE";
	}
	
	
	@PutMapping(value = "/{cr_no}", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE )
	 public String communityReplyUpdate(@PathVariable("cr_no") int cr_no, @RequestBody CommunityReplyVO crvo) {
		
		 log.info("communityReplyUpdate 호출 성공");
		 
		 crvo.setCr_no(cr_no);
		 int result = communityReplyService.communityReplyUpdate(crvo);
		 
		 return (result==1) ? "SUCCESS": "FAILURE"; 
	 }
	
	
	@DeleteMapping(value = "/{cr_no}", produces =  MediaType.TEXT_PLAIN_VALUE )
	public String communityReplyDelete(@PathVariable("cr_no") int cr_no) {
		
		log.info("communityReplyDelete 호출 성공");
		log.info("cr_no = " + cr_no );
		  
		int result = communityReplyService.communityReplyDelete(cr_no);
		
		return (result==1) ? "SUCCESS": "FAILURE";  
	}
	
}
