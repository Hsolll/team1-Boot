package com.omb.user.safeProduct.service;

import java.util.List;

import com.omb.user.member.vo.MemberVO;
import com.omb.user.product.vo.ProductVO;
import com.omb.user.safeProduct.vo.SafeProductVO;

public interface SafeProductService {
	
	public List<SafeProductVO> selectSafeProductList();
	
	public SafeProductVO selectSafeProductDetail(SafeProductVO spvo);

	public int selectSafeProductPrice(SafeProductVO spvo);	// DB 저장된 상품 금액 조회
	
	public int updateSafeProductStatus(SafeProductVO spvo);	// 결제 완료시 상품 판매상태 변경 (판매중 -> 판매완료)
	
	public int insertSafeProduct(SafeProductVO spvo);	// 안심상품 등록 메서드
	
	public int updateProductStatus(SafeProductVO spvo);	// 안심상품 등록 시 중고상품 판매상태 변경 (판매중 -> 거래진행중)
	
	public List<ProductVO> selectProductList(MemberVO mvo);	// 상품목록 조회 메서드

	public List<SafeProductVO> selectSafeProductListSell(MemberVO mvo);	// 회원 판매등록 리스트 조회
	
	public int updateSafeProduct(SafeProductVO spvo);	// 수정 처리 메서드
	
	public int deleteSafeProduct(SafeProductVO spvo);	// 삭제 처리 메서드
	
	public int updateProductStatusReturn(SafeProductVO spvo);	// 안심상품 삭제 시 중고상품 판매상태 변경 (거래진행중 -> 판매중)

}
