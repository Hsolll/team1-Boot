package com.omb.user.delivery.vo;

import lombok.Data;

@Data
public class DeliveryVO {
	
	// api 요청 시 전달할 파라미터 
	private String t_code;	// 택배사 코드
	private String t_invoice;	// 운송장번호
	private String t_key;
	
	// 테이블 데이터 입력을 위한 필드
	private int o_no;	// 주문번호
	

}
