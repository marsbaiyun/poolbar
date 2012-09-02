package com.kaishengit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.mapper.AccountMapper;
import com.kaishengit.pojo.Account;

@Service
@Transactional
public class AccountService {

	@Autowired
	private AccountMapper accountMapper;
	
	@Transactional(readOnly=true)
	public Account login (Account account) {
		return accountMapper.login(account);
	}

	@Transactional(readOnly=true)
	public Account findById(String id) {
		return accountMapper.findById(id);
	}

	public void update(Account account) {
		accountMapper.update(account);
	}
}
