package com.omb.user.account.service;

import com.omb.user.account.vo.AccountVO;
import com.omb.user.member.vo.MemberVO;

public interface AccountService {
	
public AccountVO selectAccount(MemberVO member);
	
	public int insertAccount(AccountVO account);
	
	public int updateAccount(AccountVO account);
	
	public int deleteAccount(MemberVO member);

}
