package com.kaishengit.mapper;

import com.kaishengit.pojo.Account;

public interface AccountMapper {

	public Account login (Account account);
	
	public Account findById (String id);
	
	public void save (Account account);
	
	public void update (Account account);
	
	public void del (String id);
}
