package com.omb.user.login.dao;

import org.apache.ibatis.annotations.Mapper;

import com.omb.user.member.vo.MemberVO;

@Mapper
public interface MemberLoginDAO {
	public MemberVO memberLogin(MemberVO mvo); // 일반 로그인

	public MemberVO socialLogin(MemberVO mvo); // 소셜 로그인

	public String socialChk(MemberVO mvo); // 이메일 중복 , 타입 검사
}
