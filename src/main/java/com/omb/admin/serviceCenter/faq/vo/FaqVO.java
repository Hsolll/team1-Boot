package com.omb.admin.serviceCenter.faq.vo;

import com.omb.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class FaqVO extends CommonVO{
	private int f_no;
	private int a_no;
	private String f_title;
	private String f_content;
	private String f_created_at;
	private String f_updated_at;
	private String f_deleted_at;
	private int f_readcnt;
}
