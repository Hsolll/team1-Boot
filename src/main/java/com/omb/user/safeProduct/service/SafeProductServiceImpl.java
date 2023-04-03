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

	@Override
	public List<SafeProductVO> selectSafeProductList(SafeProductVO spvo) {
		List<SafeProductVO> list = null;
		list = safeProductDAO.selectSafeProductList(spvo);
		
		return list;
	}

	@Override
	public SafeProductVO selectSafeProductDetail(SafeProductVO spvo) {
		
		SafeProductVO detail = null;
		
		
		detail = safeProductDAO.selectSafeProductDetail(spvo);
		
		if(detail!=null) {
			
			detail.setSp_content(detail.getSp_content().toString().replaceAll("\n", "<br />"));
		}
		
		return detail;
	}

	
	/* 데이터베이스에 저장된 상품 가격 조회
	 * 결제금액 위변조 검증 시 필요 */
	@Override
	public int selectSafeProductPrice(SafeProductVO spvo) {

		int price = 0;
		
		price = safeProductDAO.selectSafeProductPrice(spvo);
		
		return price;
	}

	@Override
	public int updateSafeProductStatus(SafeProductVO spvo) {
		
		int result = 0;
		
		result = safeProductDAO.updateSafeProductStatus(spvo);	// 변경 성공 시 1 리턴
		
		return result;
	}

	@Override
	public List<ProductVO> selectProductList(MemberVO mvo) {

		List<ProductVO> pvoList = safeProductDAO.selectProductList(mvo);
		
		return pvoList;
	}

	@Override
	public int insertSafeProduct(SafeProductVO spvo) {
		int result = 0;
		
		result = safeProductDAO.insertSafeProduct(spvo);
		
		return result;
	}
	
	
	@Override
	public int updateProductStatus(SafeProductVO spvo) {
		int result = 0;
		
		result = safeProductDAO.updateProductStatus(spvo);
		
		return result;
	}

	@Override
	public List<SafeProductVO> selectSafeProductListSell(MemberVO mvo) {
		
		List<SafeProductVO> sellList = safeProductDAO.selectSafeProductListSell(mvo);
	
		return sellList;
	}

	@Override
	public int updateSafeProduct(SafeProductVO spvo) {
		int result = 0;
		result = safeProductDAO.updateSafeProduct(spvo);
		return result;
	}

	@Override
	public int deleteSafeProduct(SafeProductVO spvo) {
		int result = 0;
		result = safeProductDAO.deleteSafeProduct(spvo);
		return result;
	}

	@Override
	public int updateProductStatusReturn(SafeProductVO spvo) {
		int result = 0;
		result = safeProductDAO.updateProductStatusReturn(spvo);
		return result;
	}

	
	// 전체 레코드 수
	@Override
	public int safeProductListCnt(SafeProductVO spvo) {
		
		return safeProductDAO.safeProductListCnt(spvo);
	}

	
	
	
	
	

}
