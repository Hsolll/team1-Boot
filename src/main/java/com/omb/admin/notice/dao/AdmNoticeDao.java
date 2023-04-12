package com.omb.admin.notice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.omb.admin.notice.vo.AdmNoticeVO;

@Mapper
public interface AdmNoticeDao {
	
	public int noticeInsert(AdmNoticeVO nvo);
	public AdmNoticeVO noticeDetail(AdmNoticeVO nvo);
	public int noticeUpdate(AdmNoticeVO nvo);
	public int noticeDelete(int an_no);
	public List<AdmNoticeVO> noticeList(AdmNoticeVO nvo); /* 검색 포함 리스트 */
	public int noticeListCnt(AdmNoticeVO nvo); 
	public int noticeCntUpdate(AdmNoticeVO nvo); // 조회수
	public List<AdmNoticeVO> eventList(AdmNoticeVO nvo);
	public int eventListCnt(AdmNoticeVO nvo);
	public List<AdmNoticeVO> selectMainNoticeList();	// 메인페이지 실행 시 공지사항 목록 불러오기
}
