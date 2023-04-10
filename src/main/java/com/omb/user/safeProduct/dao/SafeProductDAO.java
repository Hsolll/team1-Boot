package com.omb.user.safeProduct.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.omb.user.member.vo.MemberVO;
import com.omb.user.product.vo.ProductVO;
import com.omb.user.safeProduct.vo.SafeProductVO;

@Mapper
public interface SafeProductDAO {
	
	/********************************** 안심상품 조회 관련 **********************************/
	
	public List<SafeProductVO> selectSafeProductList(SafeProductVO spvo);	// 안심상품 리스트 조회
	
	public int safeProductListCnt(SafeProductVO spvo);	// 전체 레코드 수
	
	public SafeProductVO selectSafeProductDetail(SafeProductVO spvo);	// 안심상품 상세 조회

	
	/********************************** 안심상품 등록 관련 **********************************/

	public List<ProductVO> selectProductList(MemberVO mvo);	// 안심상품 등록 시 중고 상품목록 조회 메서드
	
	public int selectProductPrice(SafeProductVO spvo);	// 안심상품 등록 시 가격 자동입력을 위한 중고상품 금액 조회

	public int insertSafeProduct(SafeProductVO spvo);	// 안심상품 등록 메서드
	
	public int updateProductStatus(SafeProductVO spvo);	// 안심상품 등록 시 중고상품 판매상태 변경 (판매중 -> 거래진행중)
	

	/********************************** 안심상품 결제 관련 **********************************/
	
	public int selectSafeProductPrice(SafeProductVO spvo);	// DB 저장된 상품 금액 조회 (결제 검증 시 필요)
	
	public int updateSafeProductStatus(SafeProductVO spvo);	// 결제 완료시 상품 판매상태 변경 (판매중 -> 판매완료)
	
	public int updateSafeProductStatusReturn(SafeProductVO spvo);	// 결제 취소 시 상품 판매상태 변경 (판매완료 -> 판매중)
	
	
	/********************************** 안심상품 수정, 삭제 관련 **********************************/
	
	public List<SafeProductVO> selectSafeProductListSell(MemberVO mvo);	// 안심상품 판매등록 리스트 조회
	
	public int updateSafeProduct(SafeProductVO spvo);	// 수정 처리 메서드
	
	public int deleteSafeProduct(SafeProductVO spvo);	// 삭제 처리 메서드
	
	public int updateProductStatusReturn(SafeProductVO spvo);	// 안심상품 삭제 시 중고상품 판매상태 변경 (거래진행중 -> 판매중)
	

	/* 관리자 페이지 사용 메서드 */
	public List<SafeProductVO> selectSproductList(SafeProductVO spvo);	

	public int selectsafeProductCnt(SafeProductVO spvo);
	 

}
