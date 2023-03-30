package com.omb.user.payment.service;

import java.io.IOException;

import com.omb.user.payment.vo.PaymentVO;

public interface PaymentService {

	public String getToken() throws IOException;
	
	public int paymentInfo(String imp_uid, String access_token) throws IOException;
	
	public int paymentCancle(String access_token, String imp_uid, String reason) throws IOException;
	
	public int insertPaymentInfo(PaymentVO pvo);	// 결제정보 저장 메서드
	
}
