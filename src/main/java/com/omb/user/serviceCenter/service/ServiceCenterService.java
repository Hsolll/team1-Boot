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
}
