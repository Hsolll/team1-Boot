package com.omb.user.serviceCenter.vo;

import com.omb.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class ServiceCenterVO extends CommonVO{
	private int sc_no;
	private int u_no;
	private String u_name;
	private String sc_title;
	private String sc_content;
	private String sc_pwd;
	private int sc_readcnt;
	private String sc_created_at;
	private String sc_updated_at;
	private String sc_deleted_at;
	
	private int as_no;
}
