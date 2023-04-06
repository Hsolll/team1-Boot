package com.omb.user.account.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omb.user.account.dao.AccountDAO;
import com.omb.user.account.vo.AccountVO;
import com.omb.user.member.vo.MemberVO;

import lombok.Setter;

@Service
public class AccountServiceImpl implements AccountService {
	
	@Setter(onMethod_ = @Autowired)
	private AccountDAO accountDAO;

	@Override
	public AccountVO selectAccount(MemberVO member) {
		
		AccountVO account = accountDAO.selectAccount(member);
		
		return account;
	}

	@Override
	public int insertAccount(AccountVO account) {
		
		int result = accountDAO.insertAccount(account);
		
		return result;
	}

	@Override
	public int updateAccount(AccountVO account) {

		int result = accountDAO.updateAccount(account);
		
		return result;
	}

	@Override
	public int deleteAccount(MemberVO member) {

		int result = accountDAO.deleteAccount(member);
		
		return result;
	}

	
	
}
