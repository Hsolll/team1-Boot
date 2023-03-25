package com.omb.user.safeProduct.service;

import java.util.List;

import com.omb.user.safeProduct.vo.SafeProductVO;

public interface SafeProductService {
	
	public List<SafeProductVO> selectSafeProductList();
	
	public SafeProductVO selectSafeProductDetail(SafeProductVO spvo);
	
	public int selectSafeProductPrice(SafeProductVO spvo);

}
