package com.omb.user.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.omb.user.community.vo.UserCommunityVO;

@Mapper
public interface UserCommunityDAO {
	
	public List<UserCommunityVO> communityList(UserCommunityVO community);	// 매개변수로 카테고리 전달받아 각각 조회
	
	public int communityListCnt(UserCommunityVO community);	// 총 레코드 수
	
	public UserCommunityVO communityDetail(UserCommunityVO community);	// 상세조회
	
	public int updateCommunityCnt(UserCommunityVO community);	// 조회수 증가
	
	public int insertommunity(UserCommunityVO community);
	
	public int updateCommunity(UserCommunityVO community);
	
	public int deleteCommunity(UserCommunityVO community);
	

}
