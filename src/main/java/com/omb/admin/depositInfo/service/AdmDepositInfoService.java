package com.omb.admin.depositInfo.service;

import java.util.List;

import com.omb.admin.depositInfo.vo.AdmDepositInfoVO;
import com.omb.user.orderInfo.vo.OrderInfoVO;

public interface AdmDepositInfoService {
	public List<AdmDepositInfoVO> selectDepositList(AdmDepositInfoVO vo);
	public List<AdmDepositInfoVO> selectDepositedList(AdmDepositInfoVO vo);
	public int selectDepositCnt(AdmDepositInfoVO vo);
	public int selectDepositedCnt(AdmDepositInfoVO vo);
	public int insertDepositInfo(OrderInfoVO ovo);	// 입금정보 추가 메서드
	public int updateDepositDate(AdmDepositInfoVO dvo);
	public int updateDepositDelDate(AdmDepositInfoVO dvo);
}
