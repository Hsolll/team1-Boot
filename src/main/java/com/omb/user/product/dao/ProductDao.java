package com.omb.user.product.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.omb.user.member.vo.MemberVO;
import com.omb.user.product.vo.ProductVO;

@Mapper
public interface ProductDao {

	public List<ProductVO> selectProductList(ProductVO pvo);
	public List<ProductVO> selectProductBuyList(ProductVO pvo);
    public List<ProductVO> selectProductSellList(ProductVO pvo);
    public List<ProductVO> selectProductMyPageLikeList(ProductVO pvo);
    public List<ProductVO> selectProductLikeList(MemberVO mvo);
    public List<ProductVO> selectProductMyPageList(ProductVO pvo);
    
    public int productMyPageListCnt(ProductVO pvo);
    public int productMyPageBuyListCnt(ProductVO pvo);
    public int productMyPageLikeListCnt(ProductVO pvo);
    
    

	public void productStatus(ProductVO pvo);
	
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


	// 승인 대기 상품 목록 조회 (관리자)
	public List<ProductVO> selectQueuedList(ProductVO pvo);

	// 상품 승인 (관리자)
	public int updateAdmRecognize(ProductVO pvo);

	// 상품 승인 거절 (관리자)
	public int updateAdmReject(ProductVO pvo);


	// 승인 거절 상품 목록 조회 (관리자)
	public List<ProductVO> selectRejectedList(ProductVO pvo);

	public ProductVO selectProductLikeList(ProductVO pvo);
//	public List<ProductVO> selectProductLike(int p_no, int u_no);
	public List<ProductVO> selectProductLike(MemberVO u_no);


	public int selectQueuedCnt(ProductVO vo);
	public int selectRejectedCnt(ProductVO vo);
}
