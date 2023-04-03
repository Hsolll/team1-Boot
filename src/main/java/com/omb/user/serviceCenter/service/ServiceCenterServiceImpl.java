package com.omb.user.serviceCenter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omb.user.serviceCenter.dao.ServiceCenterDAO;
import com.omb.user.serviceCenter.vo.ServiceCenterVO;

import lombok.Setter;

@Service
public class ServiceCenterServiceImpl implements ServiceCenterService {
	
	@Setter(onMethod_=@Autowired)
	private ServiceCenterDAO serviceDao;
	
	@Override
	public List<ServiceCenterVO> selectServiceList(ServiceCenterVO vo) {
		List<ServiceCenterVO> serviceList = null;
		serviceList = serviceDao.selectServiceList(vo);
		return serviceList;
	}

	@Override
	public int insertService(ServiceCenterVO vo) throws Exception{
		int result = 0;
		result = serviceDao.insertService(vo);
		return result;
	}

	@Override
	public int selectServiceCnt(ServiceCenterVO svo) {
		return serviceDao.selectServiceCnt(svo);
	}

	@Override
	public ServiceCenterVO selectServiceDetail(ServiceCenterVO vo) {
		ServiceCenterVO detail = null;
		serviceDao.updateReadCnt(vo);
		detail = serviceDao.selectServiceDetail(vo);
		if(detail!=null) {
			detail.setSc_content(detail.getSc_content().toString().replaceAll("\n", "<br>"));
		}
		return detail;
	}

	@Override
	public int selectPwdChk(ServiceCenterVO vo) {
		int result = serviceDao.selectPwdChk(vo);
		return result;
	}

	@Override
	public ServiceCenterVO updateForm(ServiceCenterVO vo) {
		ServiceCenterVO data = null;
		data = serviceDao.selectServiceDetail(vo);
		return data;
	}

	@Override
	public int updateService(ServiceCenterVO vo) throws Exception {
		int result = 0;
		result = serviceDao.updateService(vo);
		return result;
	}

	@Override
	public int updateServiceDel(ServiceCenterVO vo) throws Exception {
		int result = 0;
		result = serviceDao.updateServiceDel(vo);
		return result;
	}


	@Override
	public int deleteService(ServiceCenterVO scno) throws Exception {
		int result =0;
		result = serviceDao.deleteService(scno.getSc_no());
		return result;
		}

	@Override
	public List<ServiceCenterVO> selectServiceMyPageList(ServiceCenterVO vo) {
		List<ServiceCenterVO> serviceMyPageList = null;
		serviceMyPageList = serviceDao.selectServiceMyPageList(vo);
		return serviceMyPageList;
	}

	

}
