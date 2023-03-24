package com.omb.user.safeProduct.dao;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.omb.user.safeProduct.vo.SafeProductVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
public class SafeProductDAOTests {

	@Setter(onMethod_ = @Autowired)
	private SafeProductDAO safeProductDAO;
	
	/* */
	@Test
	public void testSelectSafeProductList() {
		log.info("testSelectSafeProductList 메서드 실행");
		
		List<SafeProductVO> list = safeProductDAO.selectSafeProductList();
		log.info("list 출력 : " + list);
		
		for(SafeProductVO spvo : list) {
			log.info("리스트 조회 : " + spvo);
		}
	}
	
	
	/* 
	@Test
	public void testSelectSafeProductDetail() {
		log.info("testSelectSafeProductDetail 메서드 실행");
		
		SafeProductVO detail = null;
		
		SafeProductVO spvo = new SafeProductVO();
		spvo.setSp_no(1);
		
		detail = safeProductDAO.selectSafeProductDetail(spvo);
		
		log.info("상품 상세 : " + detail);
		
	} */ 
	
	/*
	@Test
	public void testSelectSafeProductPrice() {
		log.info("testSelectSafeProductPrice 메서드 실행");
		
		SafeProductVO safevo = new SafeProductVO();
		safevo.setSp_no(1);
		
		int price = 0;
		
		price = safeProductDAO.selectSafeProductPrice(safevo);
		
		log.info("price : " + price);
	}*/
	
	
}
