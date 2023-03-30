package com.omb.admin.statistics.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omb.admin.statistics.dao.StatisticsDAO;
import com.omb.admin.statistics.vo.StatisticsVO;

import lombok.Setter;

@Service
public class StatisticsServiceImpl implements StatisticsService {
	
	@Setter(onMethod_=@Autowired)
	private StatisticsDAO statisticsDAO;
	
//	@Override
//	public List<Map<String, Object>> selectCateStatic(StatisticsVO vo) {
//		vo = statisticsDAO.selectDate(vo);
//		return statisticsDAO.selectCateStatic(vo);
//	}

	@Override
	public List<Map<String, Object>> selectAllCateStatic() {
		return statisticsDAO.selectAllCategory();
	}

	@Override
	public StatisticsVO selectDate(StatisticsVO vo) {
	
		return statisticsDAO.selectDate(vo);
	}

	@Override
	public List<Map<String, Object>> selectCategory() {
	
		return statisticsDAO.selectCategory();
	}
	

}
