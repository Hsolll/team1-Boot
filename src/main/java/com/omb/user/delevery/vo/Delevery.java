package com.omb.user.delevery.vo;

import lombok.Data;

@Data
public class Delevery {
	
	// api 요청 시 전달할 파라미터 
	
	public String t_code;	// 택배사 코드
	
	public String t_invoice;	// 운송장번호
	

}
