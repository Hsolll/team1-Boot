package com.omb.admin.depositInfo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.omb.user.orderInfo.vo.OrderInfoVO;

@Mapper
public interface AdmDepositInfoDAO {
	
	public int insertDepositInfo(OrderInfoVO ovo);	// 입금정보 추가 메서드

}
