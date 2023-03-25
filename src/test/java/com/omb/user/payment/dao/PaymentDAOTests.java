package com.omb.user.payment.dao;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.omb.user.payment.vo.PaymentVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
public class PaymentDAOTests {
	
	@Setter(onMethod_ = @Autowired)
	private PaymentDAO paymentDAO;
	
	@Test
	public void testInsertPaymentInfo() {
		
		PaymentVO pvo = new PaymentVO();
		
		pvo.setU_no(1);
		pvo.setSp_no(1);
		pvo.setPay_id("imp_123123123123");
		pvo.setPrice(100);
		
		log.info(null);
	}

}
