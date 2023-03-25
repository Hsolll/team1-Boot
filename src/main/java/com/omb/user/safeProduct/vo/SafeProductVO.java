package com.omb.user.safeProduct.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SafeProductVO {

	private int sp_no;
	private String u_no;
	private int p_no;
	private String sp_title;
	private String sp_price;
	private String sp_content;
	private String sp_pwd;
	private String sp_status;
	private String sp_created_at;
	private String sp_updated_at;
	private String sp_deleted_at;
	
}
