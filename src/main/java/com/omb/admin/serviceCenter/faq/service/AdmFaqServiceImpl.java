package com.omb.admin.serviceCenter.faq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omb.admin.serviceCenter.faq.dao.FaqDao;
import com.omb.admin.serviceCenter.faq.vo.FaqVO;

import lombok.Setter;

@Service
public class AdmFaqServiceImpl implements AdmFaqService{
	
	@Setter(onMethod_=@Autowired)
	private FaqDao faqDao;

	@Override
	public List<FaqVO> selectFaq(FaqVO faq) {
		List<FaqVO> list = null;
		list = faqDao.selectFaq(faq);
		return list;
	}

	@Override
	public int selectFaqCnt(FaqVO faq) {
		return faqDao.selectFaqCnt(faq);
	}

	@Override
	public int insertFaq(FaqVO faq) throws Exception {
		int result = 0;
		result = faqDao.insertFaq(faq);
		return result;
	}

	@Override
	public FaqVO updateForm(FaqVO faq) {
		FaqVO faqData = null;
		faqData = faqDao.selectDetail(faq);
		return faqData;
	}

	@Override
	public int updateFaq(FaqVO faq) throws Exception {
		int result = 0;
		result = faqDao.updateFaq(faq);
		return result;
	}

	@Override
	public int updateFaqDel(FaqVO faq) throws Exception {
		int result = 0;
		result = faqDao.updateFaqDel(faq);
		return result;
	}
	
	
}
