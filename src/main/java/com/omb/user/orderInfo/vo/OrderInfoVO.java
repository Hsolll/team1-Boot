package com.omb.user.orderInfo.vo;

import lombok.Data;

@Data
public class OrderInfoVO {
	
	// 주문 내역 저장을 위한 필드
	private int o_no;
	private String o_id;	// 주문번호 (결제 시 생성됨)
	private int pay_no;		// 결제번호
	private int u_no;		// 결제한 회원 번호
	private int sp_no;		// 상품 번호
	private String receiver;		// 수령인 이름
	private String receiver_tel;	// 수령인 연락처
	private String o_address;		// 배송 주소
	private String o_date;			//주문 날짜
	private String o_status;		// 주문 상태 (결제완료, 배송중, 배송완료, 거래완료)
	
	
	// 주문내역 조회를 위한 필드
	private String buyer;	// 구매자 아이디
	private String seller;	// 판매자 아이디
	private String sp_name;	// 상품 이름
	private int sp_price;	// 상품 가격
	private String pay_id;	// 아임포트 결제 고유번호

}
