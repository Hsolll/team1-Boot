package com.omb.user.productReply.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.omb.user.productReply.service.ProductReplyService;
import com.omb.user.productReply.vo.ProductReplyVO;

import lombok.Setter;

@RequestMapping(value={"/productReply/*","/product/*"})
@Controller
public class ProductReplyController {
	
	
	@Setter(onMethod_ = @Autowired )
	private ProductReplyService productReplyService;
	
	@GetMapping(value="productReplyInsert")
	public String replyInsert( ProductReplyVO prvo) {
		
		
		
		int result = productReplyService.replyInsert(prvo);
		String url ="";
		if (result == 1) {
			url = "redirect:/product/productDetail?p_no="+prvo.getP_no();
		}else {
			url = "user/product/productError";
		}
		return url;
	}
	
	
}
