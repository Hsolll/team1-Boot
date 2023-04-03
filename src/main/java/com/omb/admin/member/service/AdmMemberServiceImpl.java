package com.omb.admin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omb.admin.member.dao.AdmMemberDao;
import com.omb.admin.member.vo.AdmMemberVO;

import lombok.Setter;

@Service
public class AdmMemberServiceImpl implements AdmMemberService {

	@Setter(onMethod_= @Autowired)
	private AdmMemberDao admMemberDao;
	
	
	// 멤버 리스트 구현
	@Override
	public List<AdmMemberVO> memberList(AdmMemberVO mvo) {
		List<AdmMemberVO> list = null;
		list = admMemberDao.memberList(mvo);
		return list;
	}

	// 탈퇴멤버 리스트 구현
	@Override
	public List<AdmMemberVO> nmemberList(AdmMemberVO mvo) {
		List<AdmMemberVO> list = null;
		list = admMemberDao.nmemberList(mvo);
		return list;
	}
	
	
	// 전체 레코드 수 구현
	@Override
	public int memberListCnt(AdmMemberVO mvo) {
		return admMemberDao.memberListCnt(mvo);
	}

	@Override
	public int nmemberListCnt(AdmMemberVO mvo) {
		return admMemberDao.nmemberListCnt(mvo);
	}

	
	
	// 상세페이지 구현
	@Override
	public AdmMemberVO memberDetail(AdmMemberVO mvo) {
		
		AdmMemberVO detail = null;
		
		detail = admMemberDao.memberDetail(mvo);
		
		return detail;
	}

	@Override
	public int memberGrade(AdmMemberVO mvo) throws Exception{
		int result = 0;
		System.out.println("mvo : " + mvo);
		
		result = admMemberDao.memberGrade(mvo);
		
		System.out.println("result : " + result);
		return result;
	}

	// 멤버 삭제
	@Override
	public int memberDelete(AdmMemberVO mvo) throws Exception{
		int result = 0;
		
		result = admMemberDao.memberDelete(mvo.getU_no());
		
		
		return result;

}

	@Override
	public Integer admMemberCount(Integer mvo) {
		
		int count =0;
		System.out.println("카운트:"+mvo);
		count = admMemberDao.admMemberCount(mvo);
		return count;
	}

	@Override
	public AdmMemberVO memberDetailAdd(AdmMemberVO mvo) {
		AdmMemberVO detail = null;
		
		detail = admMemberDao.memberDetailAdd(mvo);
		
		return detail;
	}

	@Override
	public AdmMemberVO memberBank(AdmMemberVO mvo) {
		AdmMemberVO detail = null;
		
		detail = admMemberDao.memberBank(mvo);
		
		return detail;
	}

	@Override
	public AdmMemberVO memberDetailAddress(AdmMemberVO mvo) {
AdmMemberVO detail = null;
		
		detail = admMemberDao.memberDetailAddress(mvo);
		
		return detail;
	}

}
