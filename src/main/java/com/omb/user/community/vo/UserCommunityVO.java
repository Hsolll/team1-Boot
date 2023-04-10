package com.omb.user.community.vo;

import org.springframework.web.multipart.MultipartFile;

import com.omb.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class UserCommunityVO extends CommonVO {
	
	private int		c_no;			// 커뮤니티 글 번호
	private int		u_no;			// 회원번호
	private String	c_title = "";	// 글 제목
	private String	c_content = "";	// 글 내용
	private int		c_cnt;			// 글 조회수
    private String	c_created_at;	// 글 등록일
    private String	c_updated_at;	// 글 수정일
    private String	c_deleted_at;	// 글 삭제일
    private String	c_category;		// 커뮤니티 카테고리
    
    // 파일 업로드를 위한 필드
    private MultipartFile file;
    private String c_thumb = ""; 	// 서버에 저장할 썸네일 이미지 파일명 
    private String c_file = "";		// 서버에 저장할 파일명
    
    // 목록 조회 시 필요한 필드 추가
    private String u_id;	// 회원 아이디
    private String u_nick;	// 회원 닉네임

}
