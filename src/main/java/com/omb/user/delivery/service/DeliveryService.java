package com.omb.user.delivery.service;

import java.io.IOException;

import com.omb.user.delivery.vo.DeliveryVO;
import com.omb.user.orderInfo.vo.OrderInfoVO;

public interface DeliveryService {
	
	public String companyList() throws IOException;
	
	public String deliveryTracking(DeliveryVO delivery) throws IOException;
	
	public int insertDeliveryInfo(DeliveryVO delevery);
	
	public int updateDeliveryInfo(DeliveryVO delevery);
	
	public DeliveryVO selectDeliveryInfo(DeliveryVO delivery);	// 주문번호로 배송정보 조회하기
	
	public DeliveryVO selectDeliveryInfo(OrderInfoVO ovo);	// 주문번호로 배송정보 조회하기

}
