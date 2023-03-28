package com.omb.admin.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omb.user.product.dao.ProductDao;
import com.omb.user.product.vo.ProductVO;

import lombok.Setter;

@Service
public class AdmProductServiceImpl implements AdmProductService {

	@Setter(onMethod_=@Autowired)
	private ProductDao productDao;
	
	@Override
	public List<ProductVO> selectQueuedList(ProductVO pvo) {
		List<ProductVO> list  = null; 
		list = productDao.selectQueuedList(pvo);
		return list;
	}

	@Override
	public int updateAdmRecognize(ProductVO pvo) {
		int result = 0;
		result = productDao.updateAdmRecognize(pvo);
		return result;
	}

	@Override
	public int updateAdmReject(ProductVO pvo) {
		int result = 0;
		result = productDao.updateAdmReject(pvo);
		return result;
	}

	@Override
	public List<ProductVO> selectRejectedList(ProductVO pvo) {
		List<ProductVO> list = null; 
		list = productDao.selectRejectedList(pvo);
		return list;
	}

	@Override
	public int productListCnt(ProductVO pvo) {
		
		return productDao.productListCnt(pvo);
	}

	@Override
	public List<ProductVO> selectProductList(ProductVO pvo) {
		List<ProductVO> list = null;
		list = productDao.selectProductList(pvo);
		return list;
	}
	
	
	
}
