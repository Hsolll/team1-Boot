package com.omb.admin.member.vo;

import com.omb.common.vo.CommonVO;
import com.omb.admin.member.vo.AdmMemberVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class AdmMemberVO extends CommonVO{

	private int u_no =0;
	private String u_id ="";
	private String u_nick ="";
	private String u_name ="";
	private String u_pwd ="";
	private String u_eamil ="";
	private String u_phone ="";
	private String u_grade ="";
	private String u_status ="";
	private String u_created_at ="";
	private String u_updated_at ="";
	
	private int u_cnt =0;
}
