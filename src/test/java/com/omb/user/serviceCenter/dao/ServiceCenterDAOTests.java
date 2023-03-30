package com.omb.user.serviceCenter.dao;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.omb.user.serviceCenter.vo.ServiceCenterVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
public class ServiceCenterDAOTests {
	@Setter(onMethod_=@Autowired)
	private ServiceCenterDAO serviceCenterDao;
	
//	@Test
//	public void testSelectServiceList() {
//		log.info(serviceCenterDao.getClass().getName());
//		
//		List<ServiceCenterVO> list = serviceCenterDao.selectServiceList();
//		for(ServiceCenterVO svo : list) {
//			log.info("문의 조회 : "+svo);
//		}
//	}
	
//	@Test
//	public void testInsertService() {
//		log.info(serviceCenterDao.getClass().getName());
//		ServiceCenterVO vo = new ServiceCenterVO();
//		vo.setU_no(1);
//		vo.setSc_title("[홍길동]고객님의 문의입니다");
//		vo.setSc_content("거래가 완료됐는데 안심거래 돈이 안들어와요.");
//		vo.setSc_pwd("1234");
//		int result = serviceCenterDao.insertService(vo);
//		log.info("결과 : "+result);
//	}
	
//	@Test
//	public void testSelectDetail() {
//		log.info(serviceCenterDao.getClass().getName());
//		ServiceCenterVO vo = new ServiceCenterVO();
////		vo.setU_no(1);
//		vo.setSc_no(1);
//		log.info("결과 : "+serviceCenterDao.selectServiceDetail(vo));
//	}
	
//	@Test
//	public void testUpdateReadCnt() {
//		log.info(serviceCenterDao.getClass().getName());
//		ServiceCenterVO vo = new ServiceCenterVO();
////		vo.setU_no(1);
//		vo.setSc_no(5);
//		log.info("결과 : "+serviceCenterDao.updateReadCnt(vo));
//	}
	
	@Test
	public void testUpdateDelete() {
		log.info(serviceCenterDao.getClass().getName());
		ServiceCenterVO vo = new ServiceCenterVO();
		vo.setSc_no(5);
		log.info("결과 : "+serviceCenterDao.updateServiceDel(vo));
	}
}
