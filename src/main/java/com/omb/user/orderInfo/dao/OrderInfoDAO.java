package com.omb.user.orderInfo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.omb.user.member.vo.MemberVO;
import com.omb.user.orderInfo.vo.OrderInfoVO;
import com.omb.user.payment.vo.PaymentVO;

@Mapper
public interface OrderInfoDAO {

	public int insertOrderInfo(OrderInfoVO ovo);	// 주문내역 추가
	
	public List<OrderInfoVO> buyOrderInfoList(OrderInfoVO ovo);	// 구매자 구매목록 조회 메서드
	
	public int buyOrderInfoCnt(OrderInfoVO ovo); // 구매목록 전체 레코드 수
	
	public List<OrderInfoVO> sellOrderInfoList(MemberVO mvo);	// 판매자 판매목록 조회 메서드
	
	public int sellOrderInfoCnt(OrderInfoVO ovo); // 판매목록 전체 레코드 수
	
	public PaymentVO selectPaymentId(OrderInfoVO ovo);	// 주문번호로 결제id 가져오기
	
	public OrderInfoVO selectOrderInfoPrice(OrderInfoVO ovo);	// 주문번호로 결제금액 가져오기
	
	public int updateOrderStatusCancel(OrderInfoVO ovo);	// 결제취소 후 주문상태 변경 메서드
	
	public int updateOrderStatusConfirm(OrderInfoVO ovo);	// 구매확정 후 주문상태 변경 메서드
	
	public int updateOrderStatusSend(OrderInfoVO ovo);		// 발송완료 후 주문상태 변경 메서드 (배송중)
	
	
	// 거래완료 후 판매상태 변경
	public int updateCompleteSafe(OrderInfoVO ovo);		// 구매확정 후 안심상품 판매상태 변경
	
	public int updateCompleteProduct(OrderInfoVO ovo);		// 구매확정 후 안심상품 판매상태 변경
	
}
