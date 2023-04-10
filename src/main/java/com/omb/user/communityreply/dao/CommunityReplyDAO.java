package com.omb.user.communityreply.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.omb.user.communityreply.vo.CommunityReplyVO;

@Mapper
public interface CommunityReplyDAO {
	
	public List<CommunityReplyVO> communityReplyList(Integer c_no);	// 댓글 리스트 조회
	
	public int communityReplyInsert(CommunityReplyVO crvo);	// 댓글 입력
	
	public int communityReplyUpdate(CommunityReplyVO crvo);	// 댓글 수정
	
	public int communityReplyDelete(Integer cr_no);	// 댓글 삭제

}
