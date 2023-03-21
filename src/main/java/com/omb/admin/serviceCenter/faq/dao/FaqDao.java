package com.omb.admin.serviceCenter.faq.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.omb.admin.serviceCenter.faq.vo.FaqVO;

@Mapper
public interface FaqDao {
	public List<FaqVO> selectFaq(FaqVO faq);
	public int selectFaqCnt(FaqVO faq);
	public int insertFaq(FaqVO faq) throws Exception;
	public FaqVO selectDetail(FaqVO faq);
	public int updateFaq(FaqVO faq) throws Exception;
	public int updateFaqDel(FaqVO faq) throws Exception;
	public List<FaqVO> selectUserFaq(FaqVO faq);
}
