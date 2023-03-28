package com.omb.user.productReply.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omb.user.productReply.dao.ProductReplyDao;
import com.omb.user.productReply.vo.ProductReplyVO;

import lombok.Setter;

@Service("ProductReplyService")
public class ProductReplyServiceImpl implements ProductReplyService {
	
	@Setter(onMethod_ = @Autowired )
	private ProductReplyDao productReplyDao;

	@Override
	public int replyInsert(ProductReplyVO prvo) {
		
		int result = productReplyDao.replyInsert(prvo);
		return result;
	}

	@Override
	public List<ProductReplyVO> replySelect(ProductReplyVO prvo) {
		
		List<ProductReplyVO> list = productReplyDao.replySelect(prvo);
		return list;
	}

	
	
}
