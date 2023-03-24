package com.omb.admin.serviceCenter.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class AdmServiceCenterVO {

	private int as_no 				=0;		//답변번호
	private int sc_no 				=0;		//문의글번호
	private int a_no 				=0;		//관리자번호
	private String as_title 		="";	//제목
	private String as_content 		="";	//내용
	private String as_created_at 	="";	//작성일
	private String as_updated_at 	="";	//작성업뎃일
	private String as_deleted_at 	="";	//작성삭제일
	
}
