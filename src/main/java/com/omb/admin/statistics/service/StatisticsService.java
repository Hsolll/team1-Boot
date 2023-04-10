package com.omb.admin.statistics.service;

import java.util.List;
import java.util.Map;

import com.omb.admin.statistics.vo.StatisticsVO;

public interface StatisticsService {
	
	// 카테고리 조회
	public List<Map<String, Object>> selectCategory();

	// 전체 카테고리 조회
	public List<Map<String, Object>> selectAllCateStatic();

	// 날짜 조회
	public StatisticsVO selectDate(StatisticsVO vo);

	// 상품 조회
	public List<Map<String, Integer>> selectProduct();

	// 결제 내역 조회
	public List<Map<String, Integer>> selectAmount();

	// 지역 내역 조회
	public List<Map<String, Object>> selectLocal();

	// 사용자 조회
	public List<Map<String, Object>> selectUser();

	// 입금 조회
	public List<Map<String, Object>> selectOrder();
}
