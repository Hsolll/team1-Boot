package com.omb.user.address.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberAddressVO {
	
	private int add_no;
	private int u_no;
	private String zip;
	private String address;
	private String sub_address;
	private String add_status;
	
	// 조회 시 필요한 필드
	private String full_address;

}
