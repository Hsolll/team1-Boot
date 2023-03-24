package com.omb.user.memberLogin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omb.user.login.dao.MemberLoginDAO;
import com.omb.user.member.vo.MemberVO;

import lombok.Setter;

@Service
public class MemberLoginServiceImpl implements MemberLoginService {
	@Setter(onMethod_ = @Autowired)
	private MemberLoginDAO memberLogindao;

	@Override
	public MemberVO memberLogin(MemberVO mvo) {
		return memberLogindao.memberLogin(mvo);
	}

	

	

	
}
