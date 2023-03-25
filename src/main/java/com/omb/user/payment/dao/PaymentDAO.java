package com.omb.user.payment.dao;

import org.apache.ibatis.annotations.Mapper;

import com.omb.user.payment.vo.PaymentVO;

@Mapper
public interface PaymentDAO {

	public int insertPaymentInfo(PaymentVO pvo);	// 결제정보 저장 메서드
	
}
