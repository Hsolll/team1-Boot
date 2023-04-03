package com.omb.admin.statistics.dao;

import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
public class StatisticsDAOTests {
	@Setter(onMethod_=@Autowired)
	private StatisticsDAO statisticsDAO;
	
	
//	@Test
//	public void testCategori() {
//		StatisticsVO vo = new StatisticsVO();
//		vo = statisticsDAO.selectDate(vo);
//		
//		List<Map<String, Object>> list = statisticsDAO.selectCateStatic(vo);
//		for(Map<String, Object> m : list) {
//			log.info("Key : "+m.keySet());
//			log.info("value : "+m.values());
//			
//			for(Map.Entry<String, Object> entry : m.entrySet()) {
//				String key = entry.getKey();
//				Object value = entry.getValue();
//				
//				
//				log.info(key+" : "+value);
//			}
//		}
//	}
	
	@Test
	public void testAllCategori() {
		
		List<Map<String, Object>> list = statisticsDAO.selectAllCategory();
		for(Map<String, Object> m : list) {
			log.info("Key : "+m.keySet());
			log.info("value : "+m.values());
			
			for(Map.Entry<String, Object> entry : m.entrySet()) {
				String key = entry.getKey();
				Object value = entry.getValue();
				
				
				log.info(key+" : "+value);
			}
		}
	}
	
//	@Test
//	public void testCategori() {
//		
//		List<Map<String, Object>> list = statisticsDAO.selectCategory();
//		for(Map<String, Object> m : list) {
//			log.info("Key : "+m.keySet());
//			log.info("value : "+m.values());
//			
//			for(Map.Entry<String, Object> entry : m.entrySet()) {
//				String key = entry.getKey();
//				Object value = entry.getValue();
//				
//				
//				log.info(key+" : "+value);
//			}
//		}
//	}
	
	
//	@Test
//	public void testDate() {
//		StatisticsVO vo = new StatisticsVO();
//		vo = statisticsDAO.selectDate(vo);
//		log.info("시작일 : "+vo.getStartDate());
//		log.info("마지막일 : "+vo.getEndDate());
//	}
}
