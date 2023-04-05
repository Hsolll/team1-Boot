package com.omb.user.address.service;

import java.util.List;

import com.omb.user.address.vo.MemberAddressVO;
import com.omb.user.member.vo.MemberVO;

public interface MemberAddressService {
	
	public MemberAddressVO memberAddressInfo(MemberVO mvo);
	
	public List<MemberAddressVO> memberAddressInfoAll(MemberVO mvo);	// 배송지 리스트 조회 메서드
	
	public int insertMemberAddress(MemberAddressVO addvo);	// 배송지 추가 메서드
	
	public MemberAddressVO memberAddressInfoNo(MemberAddressVO addvo);
	
	public int deleteMemberAddress(MemberAddressVO addvo);

}
