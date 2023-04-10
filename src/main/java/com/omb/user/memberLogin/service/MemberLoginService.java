package com.omb.user.memberLogin.service;

import com.omb.user.member.vo.MemberVO;

public interface MemberLoginService {
	public MemberVO memberLogin(MemberVO mvo); // 일반 로그인

	public MemberVO socialLogin(MemberVO mvo); // 소셜 로그인

	public String socialChk(MemberVO mvo); // 이메일 , 타입 중복 검사
}