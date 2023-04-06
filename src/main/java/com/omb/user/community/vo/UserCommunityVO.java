package com.omb.user.community.vo;

import org.springframework.web.multipart.MultipartFile;

import com.omb.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class UserCommunityVO extends CommonVO {
	
	private int c_no;
	private int u_no;
	private String c_title = "";
	private String c_content = "";
	private int c_cnt;
    private MultipartFile file;
    private String c_thumb = "";  
    private String c_file = "";
    private String c_created_at;
    private String c_updated_at;
    private String c_deleted_at;
    private String c_category;
    
    // 목록 조회 시 필요한 필드 추가
    private String u_id;
    private String u_nick;

}
