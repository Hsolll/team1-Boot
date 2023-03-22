package com.omb.admin.member.service;

import java.util.List;

import com.omb.admin.member.vo.MemberVO;

public interface MemberService {

	public List<MemberVO> memberList(MemberVO mvo);
	
	public List<MemberVO> nmemberList(MemberVO mvo);
	
	public int memberListCnt(MemberVO mvo); /*member 테이블의 전체 레코드 수*/ 
	
	public int nmemberListCnt(MemberVO mvo); /*member 테이블의 전체 레코드 수*/ 
	
	public MemberVO memberDetail(MemberVO mvo);
}
