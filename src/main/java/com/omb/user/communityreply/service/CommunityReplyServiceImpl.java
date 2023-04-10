package com.omb.user.communityreply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omb.user.communityreply.dao.CommunityReplyDAO;
import com.omb.user.communityreply.vo.CommunityReplyVO;

import lombok.Setter;

@Service
public class CommunityReplyServiceImpl implements CommunityReplyService {

	@Setter(onMethod_ = @Autowired)
	private CommunityReplyDAO communityReplyDAO;
	
	@Override
	public List<CommunityReplyVO> communityReplyList(Integer c_no) {

		List<CommunityReplyVO> list = null;
		
		list = communityReplyDAO.communityReplyList(c_no);
		
		return list;
	}

	@Override
	public int communityReplyInsert(CommunityReplyVO crvo) {

		int result = 0;
		
		result = communityReplyDAO.communityReplyInsert(crvo);
		
		return result;
	}

	@Override
	public int communityReplyUpdate(CommunityReplyVO crvo) {

		int result = 0;
		
		result = communityReplyDAO.communityReplyUpdate(crvo);
		
		return result;
	}

	@Override
	public int communityReplyDelete(Integer cr_no) {

		int result = 0;
		
		result = communityReplyDAO.communityReplyDelete(cr_no);
		
		return result;
	}

	
	
}
