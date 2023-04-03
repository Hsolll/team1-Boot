package com.omb.user.product.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omb.user.member.vo.MemberVO;
import com.omb.user.product.common.file.FileUploadUtil;
import com.omb.user.product.dao.ProductDao;
import com.omb.user.product.vo.ProductVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("ProductService")
public class ProductServiceImpl implements ProductService {
	
	@Setter(onMethod_ = @Autowired )
	private ProductDao productDao;

	@Override
	public List<ProductVO> selectProductList(ProductVO pvo) {
		
		List<ProductVO> productList = productDao.selectProductList(pvo);
		
		 return productList;
	}

	@Override
	public ProductVO selectProductDetail(int p_no) {
		
		ProductVO list = productDao.selectProductDetail(p_no);
		return list;
	}

	@Override
	public int insertProduct(ProductVO pvo) throws Exception {
		int result = 0;
		
		if(pvo.getFile().getSize() > 0) {
			String fileName = FileUploadUtil.fileUpload(pvo.getFile(),"product");//board_1658205347977_
			pvo.setP_file(fileName);
			
			log.info("파일 이름: "+pvo.getP_file());
			
			String thumbName = FileUploadUtil.makeThumbnail(fileName);
			pvo.setP_thumb(thumbName);
			
			log.info("썸네일 이름: "+pvo.getP_thumb());
		}
		
		result = productDao.insertProduct(pvo);
		return result;
	}
	@Override
	public int insertProductLike(ProductVO pvo) {
		int result = productDao.insertProductLike(pvo);
		return result;
	}
	@Override
	public int deleteProductLike(ProductVO pvo) {
		int result = productDao.deleteProductLike(pvo);
		return result;
	}
	@Override
	public List<ProductVO> category(ProductVO pvo) {
		
		List<ProductVO> cList = productDao.category(pvo);
		return cList;
	}

	@Override
	public int productListCnt(ProductVO pvo) {
		return productDao.productListCnt(pvo); 
	}

	@Override
	public int productCateListCnt(ProductVO pvo) {
		return productDao.productCateListCnt(pvo);
	}

	@Override
	public List<ProductVO> selectLocal(ProductVO pvo) {
		List<ProductVO> list = productDao.selectLocal(pvo);
		return list;
	}

	@Override
	public int productLcoalListCnt(ProductVO pvo) {
		return productDao.productLocalListCnt(pvo);
	}

	
	

	@Override
	public void productStatus(ProductVO pvo) {
		productDao.productStatus(pvo);
		
	}

	@Override
	public List<ProductVO> selectProductBuyList(MemberVO mvo) {
		List<ProductVO> productBuyList = productDao.selectProductBuyList(mvo);
		
		 return productBuyList;
	}

	@Override
	public List<ProductVO> selectProductSellList(MemberVO mvo) {
		List<ProductVO> productSellList = productDao.selectProductSellList(mvo);
		
		 return productSellList;
	}

	@Override
	public List<ProductVO> selectProductLikeList(MemberVO mvo) {
		List<ProductVO> productLikeList = productDao.selectProductLikeList(mvo);
		
		 return productLikeList;
	}

	@Override
	public int productMyPageListCnt(ProductVO pvo) {
		return productDao.productMyPageListCnt(pvo);
	}

	@Override
	public List<ProductVO> selectProductMyPageList(MemberVO mvo) {
		List<ProductVO> productMyPageList = productDao.selectProductMyPageList(mvo);
		
		 return productMyPageList;
	}

	

	

	
	
}
