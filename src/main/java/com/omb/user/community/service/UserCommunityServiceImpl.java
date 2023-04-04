package com.omb.user.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omb.user.community.dao.UserCommunityDAO;
import com.omb.user.community.vo.UserCommunityVO;

import lombok.Setter;

@Service
public class UserCommunityServiceImpl implements UserCommunityService {
	
	@Setter(onMethod_ = @Autowired)
	private UserCommunityDAO userCommunityDAO;

	@Override
	public List<UserCommunityVO> communityList(UserCommunityVO community) {
		List<UserCommunityVO> communityList = null;
		
		communityList = userCommunityDAO.communityList(community);
		
		return communityList;
	}

	@Override
	public int communityListCnt(UserCommunityVO community) {
		
		return userCommunityDAO.communityListCnt(community);
	}

	@Override
	public UserCommunityVO communityDetail(UserCommunityVO community) {
		
		UserCommunityVO detail = null;
		
		int updateCnt = userCommunityDAO.updateCommunityCnt(community);	// 조회수 증가
		System.out.println("조회수 증가 결과 : " + updateCnt);
		
		detail = userCommunityDAO.communityDetail(community);
		
		if(detail != null) {
			
			detail.setC_content(detail.getC_content().toString().replaceAll("\n", "<br />"));
		}
		
		return detail;
	}

	@Override
	public int updateCommunityCnt(UserCommunityVO community) {
		
		int result = 0;
		
		result = userCommunityDAO.updateCommunity(community);
		
		return result;
	}

	@Override
	public int insertCommunity(UserCommunityVO community) {

		int result = 0;
		
		result = userCommunityDAO.insertCommunity(community);
		
		return result;
	}

	@Override
	public int updateCommunity(UserCommunityVO community) {

		int result = 0;
		
		result = userCommunityDAO.updateCommunity(community);
		
		return result;
	}

	@Override
	public int deleteCommunity(UserCommunityVO community) {

		int result = 0;
		
		result = userCommunityDAO.deleteCommunity(community);
		
		return result;
	}


	
	
}
