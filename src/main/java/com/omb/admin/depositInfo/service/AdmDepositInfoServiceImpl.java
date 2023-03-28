package com.omb.admin.depositInfo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omb.admin.depositInfo.dao.AdmDepositInfoDAO;
import com.omb.user.orderInfo.vo.OrderInfoVO;

import lombok.Setter;

@Service
public class AdmDepositInfoServiceImpl implements AdmDepositInfoService {
	
	@Setter(onMethod_ = @Autowired)
	private AdmDepositInfoDAO admDepositInfoDAO;

	@Override
	public int insertDepositInfo(OrderInfoVO ovo) {
		int result = admDepositInfoDAO.insertDepositInfo(ovo);
		return result;
	}
	
	

}
