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
}
