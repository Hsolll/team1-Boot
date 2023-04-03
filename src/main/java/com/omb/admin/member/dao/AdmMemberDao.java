package com.omb.admin.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.omb.admin.member.vo.AdmMemberVO;

@Mapper
public interface AdmMemberDao {

	public List<AdmMemberVO> memberList(AdmMemberVO mvo); /* 검색 포함 리스트 */
	
	public List<AdmMemberVO> nmemberList(AdmMemberVO mvo); /* 검색 포함 리스트 */
	
	public int memberListCnt(AdmMemberVO mvo); /*member 테이블의 전체 레코드 수*/ 
	
	public int nmemberListCnt(AdmMemberVO mvo); /*member 테이블의 전체 레코드 수*/
	
	public AdmMemberVO memberDetail(AdmMemberVO mvo);
	
	public int memberGrade(AdmMemberVO mvo);
	
	public int memberDelete(int u_no); /* member 삭제 */
	
	public Integer admMemberCount(Integer mvo); /* 회원 전체 수 */
}
