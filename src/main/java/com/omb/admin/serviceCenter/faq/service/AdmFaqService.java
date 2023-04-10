package com.omb.admin.serviceCenter.faq.service;

import java.util.List;

import com.omb.admin.serviceCenter.faq.vo.FaqVO;

public interface AdmFaqService {
	// FAQ 리스트 조회
	public List<FaqVO> selectFaq(FaqVO faq);

	// FAQ 수
	public int selectFaqCnt(FaqVO faq);

	// FAQ 등록
	public int insertFaq(FaqVO faq) throws Exception;

	// FAQ 정보 조회
	public FaqVO updateForm(FaqVO faq);

	// FAQ 업데이트
	public int updateFaq(FaqVO faq) throws Exception;

	// FAQ 삭제
	public int updateFaqDel(FaqVO faq) throws Exception;
}
