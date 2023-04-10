package com.omb.user.safeProduct.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omb.user.member.vo.MemberVO;
import com.omb.user.product.vo.ProductVO;
import com.omb.user.safeProduct.dao.SafeProductDAO;
import com.omb.user.safeProduct.vo.SafeProductVO;

import lombok.Setter;

@Service
public class SafeProductServiceImpl implements SafeProductService {
	
	@Setter(onMethod_ = @Autowired)
	private SafeProductDAO safeProductDAO;

	
	/********************************** 안심상품 조회 관련 **********************************/
	
	/* 안심상품 리스트 조회 */
	@Override
	public List<SafeProductVO> selectSafeProductList(SafeProductVO spvo) {
		List<SafeProductVO> list = null;
		list = safeProductDAO.selectSafeProductList(spvo);
		
		return list;
	}
	
	/* 전체 레코드 수 */
	@Override
	public int safeProductListCnt(SafeProductVO spvo) {
		
		return safeProductDAO.safeProductListCnt(spvo);
	}

	/* 안심상품 상세 조회 */
	@Override
	public SafeProductVO selectSafeProductDetail(SafeProductVO spvo) {
		
		SafeProductVO detail = null;
		
		
		detail = safeProductDAO.selectSafeProductDetail(spvo);
		
		if(detail!=null) {
			
			detail.setSp_content(detail.getSp_content().toString().replaceAll("\n", "<br />"));
		}
		
		return detail;
	}


	/********************************** 안심상품 등록 관련 **********************************/
	
	/* 안심상품 등록 시 중고 상품목록 조회 메서드 */
	@Override
	public List<ProductVO> selectProductList(MemberVO mvo) {

		List<ProductVO> pvoList = safeProductDAO.selectProductList(mvo);
		
		return pvoList;
	}

	/* 안심상품 등록 시 가격 자동입력을 위한 중고상품 금액 조회 */
	@Override
	public int selectProductPrice(SafeProductVO spvo) {

		int price = safeProductDAO.selectProductPrice(spvo);
		
		return price;
	}

	/* 안심상품 등록 메서드 */
	@Override
	public int insertSafeProduct(SafeProductVO spvo) {
		int result = 0;
		
		result = safeProductDAO.insertSafeProduct(spvo);
		
		return result;
	}

	/* 안심상품 등록 시 중고상품 판매상태 변경 (판매중 -> 거래진행중) */
	@Override
	public int updateProductStatus(SafeProductVO spvo) {
		int result = 0;
		
		result = safeProductDAO.updateProductStatus(spvo);
		
		return result;
	}
	
	
	/********************************** 안심상품 결제 관련 **********************************/
	
	/* DB 저장된 상품 금액 조회 (결제 검증 시 필요) */
	@Override
	public int selectSafeProductPrice(SafeProductVO spvo) {

		int price = 0;
		
		price = safeProductDAO.selectSafeProductPrice(spvo);
		
		return price;
	}

	/* 결제 완료시 상품 판매상태 변경 (판매중 -> 판매완료) */
	@Override
	public int updateSafeProductStatus(SafeProductVO spvo) {
		
		int result = 0;
		
		result = safeProductDAO.updateSafeProductStatus(spvo);	// 변경 성공 시 1 리턴
		
		return result;
	}
	
	/* 결제 취소 시 상품 판매상태 변경 (판매완료 -> 판매중) */
	@Override
	public int updateSafeProductStatusReturn(SafeProductVO spvo) {

		int result = 0;
		
		result = safeProductDAO.updateSafeProductStatusReturn(spvo);
		
		return result;
	}

	
	/********************************** 안심상품 수정, 삭제 관련 **********************************/
	
	/* 안심상품 판매등록 리스트 조회 */
	@Override
	public List<SafeProductVO> selectSafeProductListSell(MemberVO mvo) {
		
		List<SafeProductVO> sellList = safeProductDAO.selectSafeProductListSell(mvo);
	
		return sellList;
	}

	/* 수정 처리 메서드 */
	@Override
	public int updateSafeProduct(SafeProductVO spvo) {
		int result = 0;
		result = safeProductDAO.updateSafeProduct(spvo);
		return result;
	}

	/* 삭제 처리 메서드 */
	@Override
	public int deleteSafeProduct(SafeProductVO spvo) {
		int result = 0;
		result = safeProductDAO.deleteSafeProduct(spvo);
		return result;
	}

	/* 안심상품 삭제 시 중고상품 판매상태 변경 (거래진행중 -> 판매중) */
	@Override
	public int updateProductStatusReturn(SafeProductVO spvo) {
		int result = 0;
		result = safeProductDAO.updateProductStatusReturn(spvo);
		return result;
	}

	
}
