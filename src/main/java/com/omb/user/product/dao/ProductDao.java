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

	public List<ProductVO> myWrite(ProductVO pvo);

	public int WriteListCnt(ProductVO pvo);

	public ProductVO updateForm(ProductVO pvo);

	public int update(ProductVO pvo);

	public int delete(ProductVO pvo);

	public ProductVO sel(ProductVO pvo);


		

}
