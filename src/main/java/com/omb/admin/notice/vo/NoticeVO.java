package com.omb.admin.notice.vo;

import com.omb.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class NoticeVO extends CommonVO{

	private int an_no =0;
	private int a_no =0;
	private String an_title ="";
	private String an_content ="";
	private String an_category ="";
	private String an_created;
	private String an_thumbnall ="";
	private String an_file ="";
	private int an_cnt =0;
}
