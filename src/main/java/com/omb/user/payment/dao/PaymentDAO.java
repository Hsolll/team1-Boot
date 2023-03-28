package com.omb.user.payment.dao;

import org.apache.ibatis.annotations.Mapper;

import com.omb.user.payment.vo.PaymentVO;

@Mapper
public interface PaymentDAO {

	public PaymentVO selectPaymentNo(PaymentVO pvo);	// 주문내역 저장 시 결제번호 추가를 위한 조회 메서드
	
	public int insertPaymentInfo(PaymentVO pvo);	// 결제정보 저장 메서드
	
}
