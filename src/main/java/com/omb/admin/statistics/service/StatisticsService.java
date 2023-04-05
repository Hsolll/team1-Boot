package com.omb.admin.statistics.service;

import java.util.List;
import java.util.Map;

import com.omb.admin.statistics.vo.StatisticsVO;

public interface StatisticsService {
//	public List<Map<String, Object>> selectCateStatic(StatisticsVO vo);
	public List<Map<String, Object>> selectCategory();
	public List<Map<String, Object>> selectAllCateStatic();
	public StatisticsVO selectDate(StatisticsVO vo);
	public List<Map<String, Integer>> selectProduct();
	public List<Map<String, Integer>> selectAmount();
	public List<Map<String, Object>> selectLocal();
	public List<Map<String, Object>> selectUser();
	public List<Map<String, Object>> selectOrder();
}
