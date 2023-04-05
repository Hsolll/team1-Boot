package com.omb.user.delivery.dao;

import org.apache.ibatis.annotations.Mapper;

import com.omb.user.delivery.vo.DeliveryVO;

@Mapper
public interface DeliveryDAO {
	
	public int insertDeliveryInfo(DeliveryVO delevery);
	
	public DeliveryVO selectDeliveryInfo(DeliveryVO delivery);	// 주문번호로 배송정보 조회하기

}
