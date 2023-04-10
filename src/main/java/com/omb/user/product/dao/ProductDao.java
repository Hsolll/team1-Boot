package com.omb.user.product.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.omb.user.member.vo.MemberVO;
import com.omb.user.product.vo.ProductVO;

@Mapper
public interface ProductDao {

	/* 민석 작업 */

	public List<ProductVO> selectProductBuyList(ProductVO pvo); // 마이페이지 구매내역 조회

	public List<ProductVO> selectProductSellList(ProductVO pvo); // 마이페이지 판매내역 조회

	public List<ProductVO> selectProductMyPageLikeList(ProductVO pvo); // 마이페이지 좋아요 조회

	public List<ProductVO> selectProductLikeList(MemberVO mvo); // 좋아요 조회

	public List<ProductVO> selectProductMyPageList(ProductVO pvo); // 마이페이지 인덱스 조회

	public int productMyPageListCnt(ProductVO pvo); // 마이페이지 판매내역 카운트

	public int productMyPageBuyListCnt(ProductVO pvo); // 마이페이지 구매내역 카운트

	public int productMyPageLikeListCnt(ProductVO pvo); // 마이페이지 좋아요 카운트

	public int productMyPageSellSoldOut(ProductVO pvo); // 마이페이지 거래완료 카운트

	public int productMyPageSellSale(ProductVO pvo); // 마이페이지 판매중 카운트

	public void productStatus(ProductVO pvo); // 마이페이지 거래상태 변경

	/* 윤기 작업 */
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

	public List<ProductVO> myWrite(ProductVO pvo);

	public int WriteListCnt(ProductVO pvo);

	public ProductVO updateForm(int u_no, int p_no);

	public int update(ProductVO pvo);

	public int delete(ProductVO pvo);

	public ProductVO sel(ProductVO pvo);


	/* 민지 작업 */

	public List<ProductVO> selectQueuedList(ProductVO pvo); // 승인 대기 상품 목록 조회 (관리자)

	public int updateAdmRecognize(ProductVO pvo); // 상품 승인 (관리자)

	public int updateAdmReject(ProductVO pvo); // 상품 승인 거절 (관리자)

	public List<ProductVO> selectRejectedList(ProductVO pvo); 	// 승인 거절 상품 목록 조회 (관리자)

	public List<ProductVO> selectProductLike(MemberVO u_no);

	public int selectQueuedCnt(ProductVO vo); // 대기중인 상품수 조회

	public int selectRejectedCnt(ProductVO vo); // 거절된 상품 조회

}
