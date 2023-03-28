package com.omb.user.orderInfo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.omb.user.member.vo.MemberVO;
import com.omb.user.orderInfo.vo.OrderInfoVO;
import com.omb.user.payment.vo.PaymentVO;

@Mapper
public interface OrderInfoDAO {

	public int insertOrderInfo(OrderInfoVO ovo);	// 주문내역 추가
	
	public List<OrderInfoVO> buyOrderInfoList(MemberVO mvo);	// 구매자 구매목록 조회 메서드
	
	public List<OrderInfoVO> sellOrderInfoList(MemberVO mvo);	// 판매자 판매목록 조회 메서드
	
	public PaymentVO selectPaymentId(OrderInfoVO ovo);	// 주문번호로 결제id 가져오기
	
	public int updateOrderStatus(OrderInfoVO ovo);	// 결제취소 후 주문상태 변경 메서드
	
}
