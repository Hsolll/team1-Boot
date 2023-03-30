package com.omb.user.product.service;

import java.util.List;

import com.omb.user.product.vo.ProductVO;

public interface ProductService {

	public List<ProductVO> selectProductList(ProductVO pvo);

	public ProductVO selectProductDetail(int p_no);

	public int insertProduct(ProductVO pvo) throws Exception;
	
	public int insertProductLike(ProductVO pvo);

	public List<ProductVO> category(ProductVO pvo);

	public int deleteProductLike(ProductVO pvo);

	public int productListCnt(ProductVO pvo);

	public int productCateListCnt(ProductVO pvo);

	public List<ProductVO> selectLocal(ProductVO pvo);

	public int productLcoalListCnt(ProductVO pvo);

}
