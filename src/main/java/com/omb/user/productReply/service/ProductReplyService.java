package com.omb.user.productReply.service;

import java.util.List;

import com.omb.user.productReply.vo.ProductReplyVO;

public interface ProductReplyService {

	public int replyInsert(ProductReplyVO prvo);
	

	public List<ProductReplyVO> replySelect(ProductReplyVO prvo);

}
