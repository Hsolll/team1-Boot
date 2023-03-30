package com.omb.admin.member.service;

import java.util.List;

import com.omb.admin.member.vo.AdmMemberVO;

public interface AdmMemberService {

	public List<AdmMemberVO> memberList(AdmMemberVO mvo);
	
	public List<AdmMemberVO> nmemberList(AdmMemberVO mvo);
	
	public int memberListCnt(AdmMemberVO mvo); /*member 테이블의 전체 레코드 수*/ 
	
	public int nmemberListCnt(AdmMemberVO mvo); /*member 테이블의 전체 레코드 수*/ 
	
	public AdmMemberVO memberDetail(AdmMemberVO mvo);
	
	public int memberGrade(AdmMemberVO mvo) throws Exception;
	
	public int memberDelete(AdmMemberVO mvo) throws Exception; /* member 삭제 */
	
}
