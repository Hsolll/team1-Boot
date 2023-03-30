package com.omb.admin.product.service;

import java.util.List;

import com.omb.user.product.vo.ProductVO;

public interface AdmProductService {
		public List<ProductVO> selectProductList(ProductVO pvo);
		// 승인 대기 상품 목록 조회 (관리자)
		public List<ProductVO> selectQueuedList(ProductVO pvo);
		// 상품 승인 (관리자)
		public int updateAdmRecognize(ProductVO pvo);
		// 상품 승인 거절 (관리자)
		public int updateAdmReject(ProductVO pvo);
		// 승인 거절 상품 목록 조회 (관리자)
		public List<ProductVO> selectRejectedList(ProductVO pvo);
		
		public int productListCnt(ProductVO pvo);
}
