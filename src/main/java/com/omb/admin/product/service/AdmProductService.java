package com.omb.admin.product.service;

import java.util.List;

import com.omb.user.product.vo.ProductVO;
import com.omb.user.safeProduct.vo.SafeProductVO;

public interface AdmProductService {

	public List<ProductVO> selectProductList(ProductVO pvo); // 전체 상품 리스트 조회

	public List<ProductVO> selectQueuedList(ProductVO pvo); // 승인 대기 상품 목록 조회

	public ProductVO productDetail(int p_no); // 상품 상세 조회

	public int updateAdmRecognize(ProductVO pvo); // 상품 승인

	public int updateAdmReject(ProductVO pvo); // 상품 승인 거절

	public List<ProductVO> selectRejectedList(ProductVO pvo); // 승인 거절 상품 목록 조회

	public int productListCnt(ProductVO pvo); // 전체 상품수

	public int queuedCnt(ProductVO pvo); // 승인 대기 상품수

	public int rejectedCnt(ProductVO pvo); // 거절 상품수

	public List<SafeProductVO> selectSafeProductList(SafeProductVO spvo); // 안심거래 상품 리스트 조회

	public int selectsafeProductCnt(SafeProductVO spvo); // 안심거래 상품수
}
