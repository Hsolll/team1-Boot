package com.omb.user.member.dao;

import org.apache.ibatis.annotations.Mapper;


import com.omb.user.member.vo.MemberVO;



@Mapper
public interface MemberDAO {
	public void signUp(MemberVO mvo);
	
	public MemberVO myPage(MemberVO mvo);

	
	public void memberUpdate(MemberVO mvo);
	public void memberDelete(MemberVO mvo);
	
	public int idChk(MemberVO mvo);
	public int nickChk(MemberVO mvo);
	public int emailChk(MemberVO mvo);
	public int phoneChk(MemberVO mvo);
	
	public void memberPwdUpdate(MemberVO mvo);
	
	public int pwdChk(MemberVO mvo);
	public void confirmPwd(MemberVO mvo);
	
	public void addressInsert(MemberVO mvo);
	public void addressUpdate(MemberVO mvo);
	
	public MemberVO findId(MemberVO mvo);
	public MemberVO findPw(MemberVO mvo);
	public int findPwChk(MemberVO mvo);
	public void findPwUpdate(MemberVO mvo);
	public MemberVO getMemberInfo(MemberVO mvo);
}