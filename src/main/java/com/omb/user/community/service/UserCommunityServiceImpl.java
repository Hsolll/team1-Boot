package com.omb.user.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omb.user.community.dao.UserCommunityDAO;
import com.omb.user.community.vo.UserCommunityVO;
import com.omb.user.product.common.file.FileUploadUtil;

import lombok.Setter;

@Service
public class UserCommunityServiceImpl implements UserCommunityService {
	
	@Setter(onMethod_ = @Autowired)
	private UserCommunityDAO userCommunityDAO;

	
	/* 커뮤니티 리스트 조회 */
	@Override
	public List<UserCommunityVO> communityList(UserCommunityVO community) {
		List<UserCommunityVO> communityList = null;
		
		communityList = userCommunityDAO.communityList(community);
		
		return communityList;
	}

	/* 게시글 레코드 수 조회 */
	@Override
	public int communityListCnt(UserCommunityVO community) {
		
		return userCommunityDAO.communityListCnt(community);
	}

	/* 게시글 상세 조회 */
	@Override
	public UserCommunityVO communityDetail(UserCommunityVO community) {
		
		UserCommunityVO detail = null;
		
		int updateCnt = userCommunityDAO.updateCommunityCnt(community);	// 조회수 증가
		System.out.println("조회수 증가 결과 : " + updateCnt);
		
		detail = userCommunityDAO.communityDetail(community);
		
		if(detail != null) {
			
			detail.setC_content(detail.getC_content().toString().replaceAll("\n", "<br />"));
		}
		
		return detail;
	}

	/* 조회수 증가 */
	@Override
	public int updateCommunityCnt(UserCommunityVO community) {
		
		int result = 0;
		
		result = userCommunityDAO.updateCommunity(community);
		
		return result;
	}
	
	/* 게시글 등록 */
	@Override
	public int insertCommunity(UserCommunityVO community) throws Exception {

		int result = 0;
		
		if(community.getFile().getSize() > 0){ // 업로드할 파일이 존재하면(파일의 크기로)
			String fileName = FileUploadUtil.fileUpload(community.getFile(), "community"); //board_1658205347977_cat.jpg
			community.setC_file(fileName); // 업로드 파일명 설정
			
			String thumbName = FileUploadUtil.makeThumbnail(fileName); // thumbnail_board_1658205347977_cat.jpg
			community.setC_thumb(thumbName); // thumbnail 파일명 설정
		}
		
		result = userCommunityDAO.insertCommunity(community);
		
		return result;
	}

	/* 게시글 수정 */
	@Override
	public int updateCommunity(UserCommunityVO community) throws Exception {

		int result = 0;
		
		result = userCommunityDAO.updateCommunity(community);
		
		return result;
	}

	/* 게시글 삭제 */
	@Override
	public int deleteCommunity(UserCommunityVO community) throws Exception {

		int result = 0;
		
		result = userCommunityDAO.deleteCommunity(community);
		
		return result;
	}


	
	
}
