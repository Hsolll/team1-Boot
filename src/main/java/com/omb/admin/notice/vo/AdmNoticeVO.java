package com.omb.admin.notice.vo;

import org.springframework.web.multipart.MultipartFile;

import com.omb.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class AdmNoticeVO extends CommonVO{

	private int an_no =0; //글번호
	private int a_no =0;	// 작성자(관리자)
	private String an_title ="";
	private String an_content ="";
	private String an_category ="";
	private String an_created_at;
	private String an_thumbnail ="";
	private String an_file ="";
	private int an_cnt =0; // 조회수
	
	private MultipartFile file;
	private String a_name ="";
}
