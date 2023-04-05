package com.omb.user.login.dao;

import org.apache.ibatis.annotations.Mapper;

import com.omb.user.member.vo.MemberVO;



@Mapper
public interface MemberLoginDAO {
	public MemberVO memberLogin(MemberVO mvo);
	public MemberVO socialLogin(MemberVO mvo);
	
	public String socialChk(MemberVO mvo);
}

