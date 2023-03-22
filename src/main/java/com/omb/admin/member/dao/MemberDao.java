package com.omb.admin.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.omb.admin.member.vo.MemberVO;

@Mapper
public interface MemberDao {

	public List<MemberVO> memberList(MemberVO mvo); /* 검색 포함 리스트 */
	
	public List<MemberVO> nmemberList(MemberVO mvo); /* 검색 포함 리스트 */
	
	public int memberListCnt(MemberVO mvo); /*member 테이블의 전체 레코드 수*/ 
	
	public int nmemberListCnt(MemberVO mvo); /*member 테이블의 전체 레코드 수*/
	
	public MemberVO memberDetail(MemberVO mvo);
}
