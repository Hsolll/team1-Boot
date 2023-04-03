package com.omb.admin.admserviceCenter.dao;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.omb.admin.serviceCenter.dao.AdmServiceCenterDao;
import com.omb.admin.serviceCenter.vo.AdmServiceCenterVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
public class AdmServiceCenterDaoTests {
	
	@Setter(onMethod_= @Autowired)
	private AdmServiceCenterDao admServiceCenterDao;
	
	/* 
	@Test
	public void testServiceCenterInsert() {
		AdmServiceCenterVO svo = new AdmServiceCenterVO();
		
		svo.setSc_no(1);
		svo.setAs_no(2);
		svo.setAs_content("내용입니다");
		
		log.info("svo : " + svo);
		
		int result = 0;
		
		result = admServiceCenterDao.admServiceInsert(svo);
		
		log.info("result : "+ result);
	} */
	/*
	@Test
	public void testServiceCenterList() {
		AdmServiceCenterVO admservice = new AdmServiceCenterVO();
		
		log.info("-----testServiceCenterList 메서드 호출-----");
		List<AdmServiceCenterVO> svo = null;
		
		
		for(AdmServiceCenterVO adsc : svo) {
			log.info("adsc리스트 조회 : " + adsc);			
		}*/
		
	@Test
	public void testServiceCenterInsert() {
		log.info("--------------------");
		log.info("boardInsert() 메서드 실행");
		AdmServiceCenterVO board = new AdmServiceCenterVO();
		board.setA_name("관리자");
		board.setAs_title("제목");
		board.setAs_content("나니까");
		
		log.info("인서트 vo =" + board);
		
		int count = admServiceCenterDao.admServiceInsert(board);
		log.info("입력된 행의 수:" + count);
	}
	
}
