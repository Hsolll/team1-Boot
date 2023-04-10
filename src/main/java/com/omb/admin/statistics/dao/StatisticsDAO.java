package com.omb.admin.statistics.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.omb.admin.statistics.vo.StatisticsVO;

@Mapper
public interface StatisticsDAO {
	
	// 전체 카테고리 통계 조회
	public List<Map<String, Object>> selectAllCategory();

	// 현재 날짜 조회
	public StatisticsVO selectDate(StatisticsVO vo);

	// 카테고리별 통계 조회 
	public List<Map<String, Object>> selectCategory();

	// 상품별 통계 조회
	public List<Map<String, Integer>> selectProduct();

	// 안심거래 결제내역 통계 조회
	public List<Map<String, Integer>> selectAmount();

	// 지역별 통계 조회
	public List<Map<String, Object>> selectLocal();

	// 사용자 통계 조회
	public List<Map<String, Object>> selectUser();

	// 주문 통계 조회
	public List<Map<String, Object>> selectOrder();
}
