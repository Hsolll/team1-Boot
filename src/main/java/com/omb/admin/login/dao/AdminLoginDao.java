package com.omb.admin.login.dao;

import org.apache.ibatis.annotations.Mapper;

import com.omb.admin.vo.AdminVO;

@Mapper
public interface AdminLoginDao {
	public AdminVO selectLoginProcess(AdminVO login); // 관리자 로그인
}
