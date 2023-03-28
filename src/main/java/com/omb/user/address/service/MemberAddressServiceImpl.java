package com.omb.user.address.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omb.user.address.dao.MemberAddressDAO;
import com.omb.user.address.vo.MemberAddressVO;
import com.omb.user.member.vo.MemberVO;

import lombok.Setter;

@Service
public class MemberAddressServiceImpl implements MemberAddressService {

	@Setter(onMethod_ = @Autowired)
	private MemberAddressDAO memberAddressDAO;
	
	@Override
	public MemberAddressVO memberAddressInfo(MemberVO mvo) {

		MemberAddressVO memberAddressVO = null;
		
		memberAddressVO =  memberAddressDAO.memberAddressInfo(mvo);
		
		return memberAddressVO;
	}

	@Override
	public int insertMemberAddress(MemberAddressVO addvo) {
		int result = 0;
		result = memberAddressDAO.insertMemberAddress(addvo);
		return result;
	}

}
