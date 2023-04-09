package com.omb.user.community.service;

import java.util.List;

import com.omb.user.community.vo.UserCommunityVO;

public interface UserCommunityService {
	
	public List<UserCommunityVO> communityList(UserCommunityVO community);	// 매개변수로 카테고리 전달받아 각각 조회
	
	public int communityListCnt(UserCommunityVO community);	// 총 레코드 수
	
	public UserCommunityVO communityDetail(UserCommunityVO community);	// 상세조회
	
	public int updateCommunityCnt(UserCommunityVO community);	// 조회수 증가
	
	public int insertCommunity(UserCommunityVO community) throws Exception;
	
	public int updateCommunity(UserCommunityVO community) throws Exception;
	
	public int deleteCommunity(UserCommunityVO community) throws Exception;

}
