package com.omb.user.address.service;

import com.omb.user.address.vo.MemberAddressVO;
import com.omb.user.member.vo.MemberVO;

public interface MemberAddressService {
	
	public MemberAddressVO memberAddressInfo(MemberVO mvo);
	
	public int insertMemberAddress(MemberAddressVO addvo);	// 배송지 추가 메서드

}
