package com.omb.admin.depositInfo.dao;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.omb.admin.depositInfo.vo.AdmDepositInfoVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
public class AdmDepositDAOTests {
	
	@Setter(onMethod_=@Autowired)
	private AdmDepositInfoDAO admDepositDAO;
	
	@Test
	public void testUpdateDeposit() {
		AdmDepositInfoVO vo = new AdmDepositInfoVO();
		vo.setDep_no(1);
		log.info("결과 : "+admDepositDAO.updateDepositDelDate(vo));
	}
}
