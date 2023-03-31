package com.omb.admin.serviceCenter.service;

import java.util.List;

import com.omb.admin.serviceCenter.vo.AdmServiceCenterVO;


public interface AdmServiceCenterService {

	public List<AdmServiceCenterVO> admReplyList();
	public int admServiceCnt(AdmServiceCenterVO svo);
	public int admServiceInsert(AdmServiceCenterVO svo) throws Exception;
	public AdmServiceCenterVO replyServiceDetail(AdmServiceCenterVO svo);
	public int admServiceCenterDelete(AdmServiceCenterVO svo) throws Exception;
	public AdmServiceCenterVO admReplyUpdateForm(AdmServiceCenterVO svo);
	public int admReplyUpdate(AdmServiceCenterVO svo) throws Exception;
	public int admselectPwdChk(AdmServiceCenterVO svo);
	
}
