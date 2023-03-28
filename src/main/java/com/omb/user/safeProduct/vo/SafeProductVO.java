package com.omb.user.safeProduct.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SafeProductVO {

	private int sp_no;
	private int u_no;
	private int p_no;
	private String sp_title;
	private String sp_name;
	private int sp_price;
	private String sp_content;
	private String sp_pwd;
	private String sp_status;
	private String sp_created_at;
	private String sp_updated_at;
	private String sp_deleted_at;
	
	// 조회 시 필요한 컬럼 필드 생성 (추후 공통 클래스에 필드 정의 후 사용)
	private String u_id;		// 회원 아이디
	private String u_name;		// 회원 이름
	private String p_name;		// 상품 이름
	
}
