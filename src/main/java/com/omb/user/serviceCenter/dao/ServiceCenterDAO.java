package com.omb.user.serviceCenter.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.omb.user.serviceCenter.vo.ServiceCenterVO;

@Mapper
public interface ServiceCenterDAO {

/* 민석 작업 */
	public List<ServiceCenterVO> selectServiceMyPageList(ServiceCenterVO vo); // 마이페이지 문의내역 조회

	public int selectMypageServiceCnt(ServiceCenterVO vo); // 마이페이지 문의내역 조회 카운트
  
  
  
  
  
	public List<ServiceCenterVO> selectServiceList(ServiceCenterVO vo); // 문의 리스트 조회

	public int selectServiceCnt(ServiceCenterVO vo); // 문의수

	public int selectPwdChk(ServiceCenterVO vo); // 문의글 비밀번호 확인

	public int insertService(ServiceCenterVO vo); // 문의글 등록

	public ServiceCenterVO selectServiceDetail(ServiceCenterVO vo); // 문의글 상세 조회

	public int updateService(ServiceCenterVO vo); // 문의글 업데이트

	public int updateServiceDel(ServiceCenterVO vo); // 문의글 삭제

	public int updateReadCnt(ServiceCenterVO vo); // 문의글 조회수

	public int selectNoReplyCnt(); // 관리자의 답변이 달리지 않은 문의글의 수

	public int deleteService(int scno);


}
