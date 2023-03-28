package com.omb.user.member.vo;


import lombok.Data;

@Data
public class MemberVO {

	private int u_no;   // 회원번호
	private int add_no; // 주소번호
	private String u_id;  // 회원아이디
	private String u_nick;  // 회원닉네임
	private String u_name;  // 회원이름
	private String u_pwd;   // 회원비밀번호
	private String u_email;  //회원이메일
	private String u_phone;  //회원전화번호
	private String u_grade;  //회원등급
	private String u_status;  //회원상태
	private String u_created_at; //회원가입일
	private String u_update_at;  //회원수정일
	
	
	
	private String zip; // 우편번호
	private String address; // 주소
	private String sub_address; // 상세주소
	
	private long n_number;	
	private String n_age;
	private String n_birthday;
	private String n_email;
	private String n_gender;
	private String n_id;
	private String n_name;
	private String n_nickName;
}
