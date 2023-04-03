package com.omb.admin.serviceCenter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omb.admin.serviceCenter.dao.AdmServiceCenterDao;
import com.omb.admin.serviceCenter.vo.AdmServiceCenterVO;

import lombok.Setter;

@Service
public class AdmServiceCenterServiceImpl implements AdmServiceCenterService {

	@Setter(onMethod_=@Autowired)
	private AdmServiceCenterDao admserviceDao;

	@Override
	public List<AdmServiceCenterVO> admReplyList() {
		List<AdmServiceCenterVO> list = null;
		list = admserviceDao.admReplyList();
		return list;
	}

	@Override
	public int admServiceCnt(AdmServiceCenterVO svo) {
		return admserviceDao.admServiceCnt(svo);
	}

	@Override
	public int admServiceInsert(AdmServiceCenterVO svo) throws Exception {
		int result = 0;
		result = admserviceDao.admServiceInsert(svo);
		return result;
	}

	@Override
	public AdmServiceCenterVO replyServiceDetail(AdmServiceCenterVO svo) {
		AdmServiceCenterVO detail = null;
		detail = admserviceDao.replyServiceDetail(svo);
		return detail;
	}

	@Override
	public int admServiceCenterDelete(AdmServiceCenterVO svo) throws Exception {
		int result = 0;
		result = admserviceDao.admServiceCenterDelete(svo.getAs_no());
		return result;
	}

	@Override
	public AdmServiceCenterVO admReplyUpdateForm(AdmServiceCenterVO svo) {
		
		AdmServiceCenterVO updateForm = null;
		updateForm = admserviceDao.replyServiceDetail(svo);
		return updateForm;
	}

	@Override
	public int admReplyUpdate(AdmServiceCenterVO svo) throws Exception {
		int result = 0;
		
		result = admserviceDao.admReplyUpdate(svo);
		return result;
	}

	@Override
	public int admselectPwdChk(AdmServiceCenterVO svo) {
		int result = 0;
		result = admserviceDao.admselectPwdChk(svo);
		return result;
	}

	
	

}
