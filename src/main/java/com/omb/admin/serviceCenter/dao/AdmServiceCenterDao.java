package com.omb.admin.serviceCenter.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.omb.admin.serviceCenter.vo.AdmServiceCenterVO;

@Mapper
public interface AdmServiceCenterDao {
	
	public List<AdmServiceCenterVO> admReplyList();
	public int admServiceCnt(AdmServiceCenterVO svo);
	public int admServiceInsert(AdmServiceCenterVO svo);
	public AdmServiceCenterVO replyServiceDetail(AdmServiceCenterVO svo);
	public int admServiceCenterDelete(int svo);
	public int admReplyUpdate(AdmServiceCenterVO svo);
}
