package com.omb.user.serviceCenter.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.omb.user.serviceCenter.vo.ServiceCenterVO;

@Mapper
public interface ServiceCenterDAO {
	public List<ServiceCenterVO> selectServiceList(ServiceCenterVO vo);
	public int selectServiceCnt(ServiceCenterVO vo);
	public int selectPwdChk(ServiceCenterVO vo);
	public int insertService(ServiceCenterVO vo);
	public ServiceCenterVO selectServiceDetail(ServiceCenterVO vo);
	
	public int updateService(ServiceCenterVO vo);
	public int updateServiceDel(ServiceCenterVO vo);
	public int updateReadCnt(ServiceCenterVO vo);
	public int deleteService(int scno);
	
	
}
