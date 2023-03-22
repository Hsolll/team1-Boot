package com.omb.admin.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omb.admin.login.dao.AdminLoginDao;
import com.omb.admin.vo.AdminVO;

import lombok.Setter;

@Service
public class AdminLoginServiceImpl implements AdminLoginService {

	@Setter(onMethod_= @Autowired)
	private AdminLoginDao adminLoginDao;
	
	@Override
	public AdminVO selectLoginProcess(AdminVO login) {
		AdminVO admin = adminLoginDao.selectLoginProcess(login);
		return admin;
	}
	
}
