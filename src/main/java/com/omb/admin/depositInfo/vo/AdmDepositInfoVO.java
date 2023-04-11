package com.omb.admin.depositInfo.vo;

import com.omb.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class AdmDepositInfoVO extends CommonVO{
	
	private int dep_no;		// 입금정보 테이블 고유번호
	private int o_no;		// 주문 테이블 고유번호
	private int dep_price;	// 입금할 금액 ( = 상품금액)
	private String dep_date;	// 처리날짜 
	private String o_id;
	private int sp_no;
	private int sp_price;
	private String bank;
	private String account;
	private String u_name;
}
