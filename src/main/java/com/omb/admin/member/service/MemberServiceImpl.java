package com.omb.admin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omb.admin.member.dao.MemberDao;
import com.omb.admin.member.vo.MemberVO;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_= @Autowired)
	private MemberDao memberDao;
	
	@Override
	public List<MemberVO> memberList(MemberVO mvo) {
		List<MemberVO> list = null;
		list = memberDao.memberList(mvo);
		return list;
	}

	@Override
	public List<MemberVO> nmemberList(MemberVO mvo) {
		List<MemberVO> list = null;
		list = memberDao.nmemberList(mvo);
		return list;
	}
	
	
	// 전체 레코드 수 구현
	@Override
	public int memberListCnt(MemberVO mvo) {
		return memberDao.memberListCnt(mvo);
	}

	@Override
	public int nmemberListCnt(MemberVO mvo) {
		return memberDao.nmemberListCnt(mvo);
	}

	@Override
	public MemberVO memberDetail(MemberVO mvo) {
		
		MemberVO detail = null;
		
		detail = memberDao.memberDetail(mvo);
		
		return detail;
	}

}
