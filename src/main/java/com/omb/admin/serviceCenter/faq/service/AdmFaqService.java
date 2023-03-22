package com.omb.admin.serviceCenter.faq.service;

import java.util.List;

import com.omb.admin.serviceCenter.faq.vo.FaqVO;

public interface AdmFaqService {
	public List<FaqVO> selectFaq(FaqVO faq);
	public int selectFaqCnt(FaqVO faq);
	public int insertFaq(FaqVO faq) throws Exception;
	public FaqVO updateForm(FaqVO faq);
	public int updateFaq(FaqVO faq) throws Exception;
	public int updateFaqDel(FaqVO faq) throws Exception;
}
