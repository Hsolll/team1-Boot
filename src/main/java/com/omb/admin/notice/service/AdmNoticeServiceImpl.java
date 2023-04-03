package com.omb.admin.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omb.admin.notice.dao.AdmNoticeDao;
import com.omb.admin.notice.vo.AdmNoticeVO;
import com.omb.user.product.common.file.FileUploadUtil;

import lombok.Setter;

@Service
public class AdmNoticeServiceImpl implements AdmNoticeService {

	@Setter(onMethod_= @Autowired)
	private AdmNoticeDao admNoticeDao;

	
	// 글입력 구현
	@Override
	public int noticeInsert(AdmNoticeVO nvo) throws Exception {
		
		int result = 0;
		
		if(nvo.getFile().getSize() > 0) {
			String fileName = FileUploadUtil.fileUpload(nvo.getFile(), "notice");
			nvo.setAn_file(fileName);
			
			String thumbName = FileUploadUtil.makeThumbnail(fileName);
			nvo.setAn_thumbnail(thumbName);
		}
		result = admNoticeDao.noticeInsert(nvo);
		return result;
	}

	// 글상세 구현
	@Override
	public AdmNoticeVO noticeDetail(AdmNoticeVO nvo) {
		AdmNoticeVO detail = null;
		
		admNoticeDao.noticeCntUpdate(nvo); // 조회수 증가 메서드
		detail = admNoticeDao.noticeDetail(nvo);
		if(detail != null) {
			detail.setAn_content(detail.getAn_content().toString().replaceAll("\n", "<br />"));
		}
		return detail;
	}

	@Override
	public AdmNoticeVO noticeupdateForm(AdmNoticeVO nvo) {
		AdmNoticeVO updateData = null;
		updateData = admNoticeDao.noticeDetail(nvo);
		return updateData;
	}

	// 글수정 구현
	@Override
	public int noticeUpdate(AdmNoticeVO nvo) throws Exception {
		int result = 0;
		
		if(!nvo.getFile().isEmpty()) {
			if(!nvo.getAn_file().isEmpty()) {
				FileUploadUtil.fileDelete(nvo.getAn_file());
				FileUploadUtil.fileDelete(nvo.getAn_thumbnail());
			}
			
			String fileName = FileUploadUtil.fileUpload(nvo.getFile(), "notice");
			nvo.setAn_file(fileName);
			
			String thumbName = FileUploadUtil.makeThumbnail(fileName);
			nvo.setAn_thumbnail(thumbName);
		}
		result = admNoticeDao.noticeUpdate(nvo);
		return result;
	}

	@Override
	public int noticeDelete(AdmNoticeVO nvo) throws Exception {
		int result = 0;
		
		if(!nvo.getAn_file().isEmpty()) {
			FileUploadUtil.fileDelete(nvo.getAn_file());
			FileUploadUtil.fileDelete(nvo.getAn_thumbnail());
		}
		
		result = admNoticeDao.noticeDelete(nvo.getAn_no());
		return result;
	}

	// 글목록 구현
	@Override
	public List<AdmNoticeVO> noticeList(AdmNoticeVO nvo) {
		List<AdmNoticeVO> list = null;
		list = admNoticeDao.noticeList(nvo);
		return list;
	}

	// 전체 레코드 수 구현
	@Override
	public int noticeListCnt(AdmNoticeVO nvo) {
		return admNoticeDao.noticeListCnt(nvo);
	}

	@Override
	public List<AdmNoticeVO> eventList(AdmNoticeVO nvo) {
		List<AdmNoticeVO> list = null;
		list = admNoticeDao.eventList(nvo);
		return list;
	}


}
