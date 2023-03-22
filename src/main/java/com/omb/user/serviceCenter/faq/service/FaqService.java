package com.omb.user.serviceCenter.faq.service;

import java.util.List;

import com.omb.admin.serviceCenter.faq.vo.FaqVO;

public interface FaqService {
	public List<FaqVO> selectUserFaq(FaqVO faq);
	public int selectFaqCnt(FaqVO faq);
	public FaqVO selectDetail(FaqVO faq);
}
