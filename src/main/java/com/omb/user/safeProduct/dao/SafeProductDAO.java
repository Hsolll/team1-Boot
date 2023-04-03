package com.omb.user.safeProduct.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.omb.user.safeProduct.vo.SafeProductVO;

@Mapper
public interface SafeProductDAO {
	
	public List<SafeProductVO> selectSafeProductList();
	
	public SafeProductVO selectSafeProductDetail(SafeProductVO spvo);
	
	public SafeProductVO login(SafeProductVO spvo);
	
	public int selectSafeProductPrice(SafeProductVO spvo);	// DB 저장된 상품 금액 조회
	
	public int updateSafeProductStatus(SafeProductVO spvo);	// 결제 완료시 상품 판매상태 변경 (판매중 -> 판매완료)
	
	public int selectsafeProductCnt(SafeProductVO spvo);
}
