package com.omb.admin.community.service;

import java.util.List;

import com.omb.user.community.vo.UserCommunityVO;

public interface AdmCommunityService {
	
	public List<UserCommunityVO> communityList(UserCommunityVO community);
	
	public int communityListCnt(UserCommunityVO community);
	
	public UserCommunityVO communityDetail(UserCommunityVO community);
	
	public int deleteCommunity(UserCommunityVO community);
}
