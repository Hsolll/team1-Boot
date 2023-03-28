package com.omb.user.productReply.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.omb.user.productReply.vo.ProductReplyVO;

@Mapper
public interface ProductReplyDao {

	public int replyInsert(ProductReplyVO prvo);
	public int insertProductLike(ProductReplyVO prvo);

	public List<ProductReplyVO> replySelect(ProductReplyVO prvo);

}
