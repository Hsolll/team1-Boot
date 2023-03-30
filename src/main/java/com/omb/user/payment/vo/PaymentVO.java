package com.omb.user.payment.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaymentVO {

	private int pay_no;			// 결제테이블 순번
	private int u_no;		// 결제한 회원 번호
	private int sp_no;			// 결제한 상품 번호
	private String pay_id;		// 아임포트 결제 고유번호
	private int price;			// 결제 금액
	private String pay_date;	// 결제 일시
	
	// 조회 시 필요한 컬럼 필드 생성 (추후 공통 클래스에 필드 정의 후 사용)
	private String u_id;		// 회원 아이디
	private String sp_name;		// 상품 이름
	
}
