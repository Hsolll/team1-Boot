package com.omb.user.serviceCenter.faq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omb.admin.serviceCenter.faq.dao.FaqDao;
import com.omb.admin.serviceCenter.faq.vo.FaqVO;

import lombok.Setter;

@Service
public class FaqServiceImpl implements FaqService {
	
	@Setter(onMethod_=@Autowired)
	private FaqDao faqDao;

	@Override
	public List<FaqVO> selectUserFaq(FaqVO faq) {
		List<FaqVO> faqList = null;
		faqList = faqDao.selectUserFaq(faq);
		return faqList;
	}

	@Override
	public int selectFaqCnt(FaqVO faq) {
		int countNum = 0;
		countNum = faqDao.selectFaqCnt(faq);
		return countNum;
	}

	@Override
	public FaqVO selectDetail(FaqVO faq) {
		FaqVO detail = null;
		faqDao.updateReadCnt(faq);
		detail = faqDao.selectDetail(faq);
		if(detail != null) {
			detail.setF_content(detail.getF_content().toString().replaceAll("\n", "<br>"));
		}
		return detail;
	}
	
	
}
