package com.omb.admin.serviceCenter.vo;


import com.omb.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class AdmServiceCenterVO extends CommonVO{
	private int as_no;
	private int sc_no;
	private int a_no;
	private String a_name;
	private String as_title;
	private String as_content;
	private String as_pwd;
	private String as_created_at;
	private String as_updated_at;
	private String as_deleted_at;
	private int rCount;
	
	private String sc_pwd;
}
