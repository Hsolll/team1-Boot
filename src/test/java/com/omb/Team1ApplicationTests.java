package com.omb;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.omb.user.payment.dao.PaymentDAO;
import com.omb.user.payment.vo.PaymentVO;
import com.omb.user.safeProduct.dao.SafeProductDAO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
class Team1ApplicationTests {

	@Test
	void contextLoads() {
	}
	
	@Setter(onMethod_ = @Autowired)
	private SafeProductDAO safeProductDAO;
	
	@Setter(onMethod_ = @Autowired)
	private PaymentDAO paymentDAO;
	
	/* 
	@Test
	public void testSelectSafeProductList() {
		log.info("testSelectSafeProductList 메서드 실행");
		
		List<SafeProductVO> list = safeProductDAO.selectSafeProductList();
		log.info("list 출력 : " + list);
		
		for(SafeProductVO spvo : list) {
			log.info("리스트 조회 : " + spvo);
		}
	}
	*/
	
	/* 
	@Test
	public void testSelectSafeProductPrice() {
		log.info("testSelectSafeProductPrice 메서드 실행");
		
		SafeProductVO safevo = new SafeProductVO();
		safevo.setSp_no(1);
		
		int price = 0;
		
		price = safeProductDAO.selectSafeProductPrice(safevo);
		
		log.info("price : " + price);
	} */

	
	@Test
	public void testInsertPaymentInfo() {
		
		PaymentVO pvo = new PaymentVO();
		
		pvo.setU_no(1);
		pvo.setSp_no(1);
		pvo.setPay_id("imp_123123123123");
		pvo.setPrice(100);
		
		log.info("pvo : " + pvo);
		
		int result = 0;
		result = paymentDAO.insertPaymentInfo(pvo);
		
		log.info("result : " + result);
	}
}
