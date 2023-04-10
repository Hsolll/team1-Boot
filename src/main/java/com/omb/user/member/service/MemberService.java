package com.omb.user.member.service;

import com.omb.user.member.vo.MemberVO;

public interface MemberService {

	public void signUp(MemberVO mvo); // 일반 회원가입

	public void naverSignUp(MemberVO mvo); // 네이버 회원가입

	public void kakaoSignUp(MemberVO mvo); // 카카오 회원가입

	public MemberVO myPage(MemberVO mvo); // 마이페이지

	public void memberUpdate(MemberVO mvo); // 회원정보 수정

	public void memberDelete(MemberVO mvo); // 회원 탈퇴

	public int idChk(MemberVO mvo); // 아이디 중복 체크

	public int nickChk(MemberVO mvo); // 닉네임 중복 체크

	public int emailChk(MemberVO mvo); // 이메일 중복 체크

	public int phoneChk(MemberVO mvo); // 휴대폰 중복 체크

	public void memberPwdUpdate(MemberVO mvo); // 비밀번호 재설정

	public int pwdChk(MemberVO mvo); // 회원수정,탈퇴,비밀번호 수정 비밀번호 체크

	public void confirmPwd(MemberVO mvo); // 회원수정,탈퇴,비밀번호 수정 비밀번호 체크

	public void addressInsert(MemberVO mvo); // 회원가입 주소

	public void addressUpdate(MemberVO mvo); // 회원정보수정 주소

	public MemberVO findId(MemberVO mvo); // 아이디 찾기

	public MemberVO findPw(MemberVO mvo); // 비밀번호 찾기

	public int findPwChk(MemberVO mvo); // 비밀번호 찾기 중복 체크

	public void findPwUpdate(MemberVO mvo); // 비밀번호 찾기 비밀번호 재설정

	public MemberVO getMemberInfo(MemberVO mvo); // 회원 수정 페이지 조회
}
