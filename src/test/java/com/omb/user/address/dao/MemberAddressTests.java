package com.omb.user.address.dao;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.omb.user.address.vo.MemberAddressVO;
import com.omb.user.member.vo.MemberVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
public class MemberAddressTests {
	
	@Setter(onMethod_ = @Autowired)
	private MemberAddressDAO memberAddressDAO;

	@Test
	public void selectMemberAddressInfo() {
		
		MemberVO mvo = new MemberVO();
		mvo.setU_no(1);
		
		MemberAddressVO memberAddressVO =  memberAddressDAO.memberAddressInfo(mvo);
		
		log.info("memberAddressVO : " + memberAddressVO);		
	}
	
}
