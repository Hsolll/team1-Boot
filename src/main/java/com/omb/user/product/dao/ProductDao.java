package com.omb.user.product.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.omb.user.product.vo.ProductVO;

@Mapper
public interface ProductDao {

	public List<ProductVO> selectProductList(ProductVO pvo);

	public ProductVO selectProductDetail(int p_no);

	public int insertProduct(ProductVO pvo);

	public int insertProductLike(ProductVO pvo);

	public int deleteProductLike(ProductVO pvo);

	public List<ProductVO> category(ProductVO pvo);

	public int productListCnt(ProductVO pvo);

	public int productCateListCnt(ProductVO pvo);

	public List<ProductVO> selectLocal(ProductVO pvo);

	public int productLocalListCnt(ProductVO pvo);

	// 승인 대기 상품 목록 조회 (관리자)
	public List<ProductVO> selectQueuedList(ProductVO pvo);

	// 상품 승인 (관리자)
	public int updateAdmRecognize(ProductVO pvo);

	// 상품 승인 거절 (관리자)
	public int updateAdmReject(ProductVO pvo);

	// 승인 거절 상품 목록 조회 (관리자)
	public List<ProductVO> selectRejectedList(ProductVO pvo);

}
