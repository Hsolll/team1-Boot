package com.omb.admin.statistics.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.omb.admin.statistics.vo.StatisticsVO;

@Mapper
public interface StatisticsDAO {
//	public List<Map<String, Object>> selectCateStatic(StatisticsVO vo);
	public List<Map<String, Object>> selectAllCategory();
	public StatisticsVO selectDate(StatisticsVO vo);
	public List<Map<String, Object>> selectCategory();
	
	// 일반 상품
	public List<Map<String, Integer>> selectProduct();
	// 안심거래 결제내역
	public List<Map<String, Integer>> selectAmount();
	
	public List<Map<String, Object>> selectLocal();
	
	public List<Map<String, Object>> selectUser();
	public List<Map<String, Object>> selectOrder();
}
