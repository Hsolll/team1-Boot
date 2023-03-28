package com.omb.user.productReply.vo;

import lombok.Data;

@Data
public class ProductReplyVO {
	private int pr_no 				=0;
	private int p_no  				=0;
	private int u_no 				=0;
	private String u_nick 			="";
	private String pr_content 		="";
	private String pr_created_at 	="";
	private String pr_updated_at 	="";
}
