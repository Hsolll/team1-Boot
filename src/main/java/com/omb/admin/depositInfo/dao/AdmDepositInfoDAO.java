package com.omb.admin.depositInfo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.omb.admin.depositInfo.vo.AdmDepositInfoVO;
import com.omb.user.orderInfo.vo.OrderInfoVO;

@Mapper
public interface AdmDepositInfoDAO {
	public int insertDepositInfo(OrderInfoVO ovo); // 입금정보 추가 메서드

	public List<AdmDepositInfoVO> selectDepositList(AdmDepositInfoVO vo); // 입금대기 리스트 조회

	public List<AdmDepositInfoVO> selectDepositedList(AdmDepositInfoVO vo); // 입금완료 리스트 조회

	public int selectDepositCnt(AdmDepositInfoVO vo); // 입금대기 테이블 수

	public int selectDepositedCnt(AdmDepositInfoVO vo); // 입금완료 테이블 수

	public int updateDepositDate(AdmDepositInfoVO dvo); // 입금날짜 업데이트

	public int updateDepositDelDate(AdmDepositInfoVO dvo); // 입금날짜 업데이트(취소)
}
