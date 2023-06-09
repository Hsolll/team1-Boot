package com.omb.user.orderInfo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omb.user.orderInfo.dao.OrderInfoDAO;
import com.omb.user.orderInfo.vo.OrderInfoVO;
import com.omb.user.payment.vo.PaymentVO;

import lombok.Setter;

@Service
public class OrderInfoServiceImpl implements OrderInfoService {
	
	@Setter(onMethod_ = @Autowired)
	private OrderInfoDAO orderInfoDAO;

	@Override
	public int insertOrderInfo(OrderInfoVO ovo) {
		int result = 0;
		
		result = orderInfoDAO.insertOrderInfo(ovo);
		
		return result;
	}

	@Override
	public List<OrderInfoVO> buyOrderInfoList(OrderInfoVO ovo) {
		List<OrderInfoVO> buyList = null;
		buyList = orderInfoDAO.buyOrderInfoList(ovo);
		return buyList;
	}

	@Override
	public List<OrderInfoVO> sellOrderInfoList(OrderInfoVO ovo) {
		List<OrderInfoVO> sellList = null;
		sellList = orderInfoDAO.sellOrderInfoList(ovo);
		return sellList;
	}

	@Override
	public PaymentVO selectPaymentId(OrderInfoVO ovo) {
		PaymentVO pvo = orderInfoDAO.selectPaymentId(ovo);
		
		return pvo;
	}

	@Override
	public int updateOrderStatusCancel(OrderInfoVO ovo) {
		int result = orderInfoDAO.updateOrderStatusCancel(ovo); 
		return result;
	}

	@Override
	public int updateOrderStatusConfirm(OrderInfoVO ovo) {
		int result = orderInfoDAO.updateOrderStatusConfirm(ovo);
		return result;
	}

	@Override
	public OrderInfoVO selectOrderInfoPrice(OrderInfoVO ovo) {
		OrderInfoVO selectPrice = orderInfoDAO.selectOrderInfoPrice(ovo);
		return selectPrice;
	}

	@Override
	public int updateOrderStatusSend(OrderInfoVO ovo) {
		int result = 0;
		result = orderInfoDAO.updateOrderStatusSend(ovo);
		return result;
	}

	@Override
	public int updateCompleteSafe(OrderInfoVO ovo) {
		int result = 0;
		result = orderInfoDAO.updateCompleteSafe(ovo);
		return result;
	}

	@Override
	public int updateCompleteProduct(OrderInfoVO ovo) {
		int result = 0;
		result = orderInfoDAO.updateCompleteProduct(ovo);
		return result;
	}

	@Override
	public int buyOrderInfoCnt(OrderInfoVO ovo) {
		
		return orderInfoDAO.buyOrderInfoCnt(ovo);
	}

	@Override
	public int sellOrderInfoCnt(OrderInfoVO ovo) {
		
		return orderInfoDAO.sellOrderInfoCnt(ovo);
	}

	@Override
	public OrderInfoVO selectOrderInfoDetail(OrderInfoVO ovo) {
		
		OrderInfoVO detail = orderInfoDAO.selectOrderInfoDetail(ovo);
		
		return detail;
	}
	
	
	
	

}
