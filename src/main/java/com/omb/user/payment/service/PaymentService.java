package com.omb.user.payment.service;

import java.io.IOException;

import com.omb.user.payment.vo.PaymentVO;

public interface PaymentService {

	public String getToken() throws IOException;
	
	public int paymentInfo(String imp_uid, String access_token) throws IOException;
	
	public int paymentCancle(String access_token, String imp_uid, String reason) throws IOException;
	
	public void paymentCancle(String access_token, String imp_uid) throws IOException;
	
	public PaymentVO selectPaymentNo(PaymentVO pvo);	// 주문내역 저장 시 결제번호 추가를 위한 조회 메서드
	
	public int insertPaymentInfo(PaymentVO pvo);	// 결제정보 저장 메서드
	
}
