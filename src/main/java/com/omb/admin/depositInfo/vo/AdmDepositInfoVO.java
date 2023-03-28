package com.omb.admin.depositInfo.vo;

import lombok.Data;

@Data
public class AdmDepositInfoVO {
	
	private int dep_no;		// 입금정보 테이블 고유번호
	private int o_no;		// 주문 테이블 고유번호
	private int dep_price;	// 입금할 금액 ( = 상품금액)
	private String dep_date;	// 처리날짜 

}
