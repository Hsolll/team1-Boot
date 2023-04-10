package com.omb.user.serviceCenter.service;

import java.util.List;

import com.omb.user.serviceCenter.vo.ServiceCenterVO;

public interface ServiceCenterService {
	public List<ServiceCenterVO> selectServiceList(ServiceCenterVO vo);

	public int selectServiceCnt(ServiceCenterVO svo);

	public int insertService(ServiceCenterVO vo) throws Exception;

	public ServiceCenterVO selectServiceDetail(ServiceCenterVO vo);

	public int selectPwdChk(ServiceCenterVO vo);

	public ServiceCenterVO updateForm(ServiceCenterVO vo);

	public int updateService(ServiceCenterVO vo) throws Exception;

	public int updateServiceDel(ServiceCenterVO vo) throws Exception;

	public int deleteService(ServiceCenterVO scno) throws Exception;

	public int selectNoReplyCnt() throws Exception;
  
  
		
	/* 민석 작업 */
	public List<ServiceCenterVO> selectServiceMyPageList(ServiceCenterVO vo); // 마이페이지 문의내역 조회

	public int selectMypageServiceCnt(ServiceCenterVO vo); // 마이페이지 문의내역 조회 카운트

}
