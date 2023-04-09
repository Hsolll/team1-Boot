package com.omb.admin.serviceCenter.faq.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.omb.admin.serviceCenter.faq.vo.FaqVO;

@Mapper
public interface FaqDao {

	public List<FaqVO> selectFaq(FaqVO faq); // FAQ 리스트 조회

	public int selectFaqCnt(FaqVO faq); // FAQ의 수

	public int insertFaq(FaqVO faq) throws Exception; // FAQ 등록

	public FaqVO selectDetail(FaqVO faq); // FAQ 상세

	public int updateFaq(FaqVO faq) throws Exception; // FAQ 업데이트

	public int updateFaqDel(FaqVO faq) throws Exception; // FAQ 삭제

	public List<FaqVO> selectUserFaq(FaqVO faq); // FAQ 사용자 리스트 조회

	public int updateReadCnt(FaqVO faq); // FAQ 조회수
}
