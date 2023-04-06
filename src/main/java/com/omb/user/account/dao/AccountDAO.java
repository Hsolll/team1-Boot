package com.omb.user.account.dao;

import org.apache.ibatis.annotations.Mapper;

import com.omb.user.account.vo.AccountVO;
import com.omb.user.member.vo.MemberVO;

@Mapper
public interface AccountDAO {

	public AccountVO selectAccount(MemberVO member);
	
	public int insertAccount(AccountVO account);
	
	public int updateAccount(AccountVO account);
	
	public int deleteAccount(MemberVO member);
}
