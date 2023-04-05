package com.omb.user.address.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.omb.user.address.vo.MemberAddressVO;
import com.omb.user.member.vo.MemberVO;

@Mapper
public interface MemberAddressDAO {

	public MemberAddressVO memberAddressInfo(MemberVO mvo);	// 배송지 전체 주소 조회 메서드
	
	public List<MemberAddressVO> memberAddressInfoAll(MemberVO mvo);	// 배송지 리스트 조회 메서드
	
	public int insertMemberAddress(MemberAddressVO addvo);	// 배송지 추가 메서드
	
	public MemberAddressVO memberAddressInfoNo(MemberAddressVO addvo);
	
	public int deleteMemberAddress(MemberAddressVO addvo);
}
