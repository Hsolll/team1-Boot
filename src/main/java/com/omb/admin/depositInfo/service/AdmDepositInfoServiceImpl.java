package com.omb.admin.depositInfo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omb.admin.depositInfo.dao.AdmDepositInfoDAO;
import com.omb.admin.depositInfo.vo.AdmDepositInfoVO;
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

	@Override
	public int updateDepositDate(AdmDepositInfoVO dvo) {
		int result = admDepositInfoDAO.updateDepositDate(dvo);
		return result;
	}

	@Override
	public List<AdmDepositInfoVO> selectDepositList(AdmDepositInfoVO vo) {
		List<AdmDepositInfoVO> list = admDepositInfoDAO.selectDepositList(vo);
		return list;
	}

	@Override
	public List<AdmDepositInfoVO> selectDepositedList(AdmDepositInfoVO vo) {
		List<AdmDepositInfoVO> list = admDepositInfoDAO.selectDepositedList(vo);
		return list;
	}

	@Override
	public int selectDepositCnt(AdmDepositInfoVO vo) {
		
		return admDepositInfoDAO.selectDepositCnt(vo);
	}

	@Override
	public int selectDepositedCnt(AdmDepositInfoVO vo) {
		 
		return admDepositInfoDAO.selectDepositedCnt(vo);
	}

	@Override
	public int updateDepositDelDate(AdmDepositInfoVO dvo) {
		 
		return admDepositInfoDAO.updateDepositDelDate(dvo);
	}

}
