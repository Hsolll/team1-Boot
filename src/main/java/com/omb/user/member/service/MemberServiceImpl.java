package com.omb.user.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omb.user.member.dao.MemberDAO;
import com.omb.user.member.vo.MemberVO;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_=@Autowired)
	private MemberDAO memberdao;
	
	

	@Override
	public void signUp(MemberVO mvo)  {
		memberdao.signUp(mvo);
		
	}

	@Override
	public MemberVO myPage(MemberVO mvo) {
		MemberVO mypage = null;
		
		mypage = memberdao.myPage(mvo);
		return mypage;
	}

	
/*
	@Override
	public MemberVO updateForm(MemberVO mvo) {
		MemberVO updateData = null;
		updateData = memberdao.myPage(mvo);
		return updateData;
	}
*/
	@Override
	public void memberUpdate(MemberVO mvo) {
		memberdao.memberUpdate(mvo);
		
	}
	
	@Override
	public void memberDelete(MemberVO mvo) {
		memberdao.memberDelete(mvo);
		
	}

	@Override
	public int idChk(MemberVO mvo) {
		int result = memberdao.idChk(mvo);
		return result;
	}

	@Override
	public int nickChk(MemberVO mvo) {
		int nickResult = memberdao.nickChk(mvo);
		return nickResult;
	}
	
	@Override
	public int emailChk(MemberVO mvo) {
		int emailResult = memberdao.emailChk(mvo);
		return emailResult;
	}
	
	@Override
	public int phoneChk(MemberVO mvo) {
		int phoneResult = memberdao.phoneChk(mvo);
		return phoneResult;
	}

	@Override
	public void memberPwdUpdate(MemberVO mvo) {
		memberdao.memberPwdUpdate(mvo);
		
	}

	@Override
	public int pwdChk(MemberVO mvo) {
		int pwdChkResult = memberdao.pwdChk(mvo);
		return pwdChkResult;
	}

	@Override
	public void confirmPwd(MemberVO mvo) {
		memberdao.confirmPwd(mvo);
		
	}

	@Override
	public void addressInsert(MemberVO mvo) {
		memberdao.addressInsert(mvo);
		
	}

	@Override
	public void addressUpdate(MemberVO mvo) {
		memberdao.addressUpdate(mvo);
		
	}

	@Override
	public MemberVO findId(MemberVO mvo) {
		return memberdao.findId(mvo);
		
	}

	@Override
	public MemberVO findPw(MemberVO mvo) {
		return memberdao.findPw(mvo);
	}
	
	@Override
	public int findPwChk(MemberVO mvo) {
		int findPwResult = memberdao.findPwChk(mvo);
		return findPwResult;
	}


	@Override
	public void findPwUpdate(MemberVO mvo) {
		memberdao.findPwUpdate(mvo);
		
	}

	@Override
	public MemberVO getMemberInfo(MemberVO mvo) {
		return memberdao.getMemberInfo(mvo);
	
	}
	

	

	
	

	

	

	

	

	

	
	
	

	
	
}