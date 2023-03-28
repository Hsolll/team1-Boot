package com.omb.admin.member.dao;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.omb.admin.member.vo.AdmMemberVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
public class AdmMemberDaoTests {
	
	@Setter(onMethod_ = @Autowired)
	private AdmMemberDao admMemberDao;
	
	@Test
	public void testMemberGrade() {
		AdmMemberVO mvo = new AdmMemberVO();
		mvo.setU_no(1);
		mvo.setU_grade("1");
		
		log.info("mvo : " + mvo);
		
		int result = 0;
		
		result = admMemberDao.memberGrade(mvo);
		
		log.info("result : " + result);
		
	}

}
