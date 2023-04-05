package com.omb.user.memberLogin.service;

import com.omb.user.member.vo.MemberVO;

public interface MemberLoginService {
	public MemberVO memberLogin(MemberVO mvo);
	
	public MemberVO socialLogin(MemberVO mvo);
	
	public String socialChk(MemberVO mvo);
}
