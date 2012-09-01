package com.kaishengit.mapper;

import com.kaishengit.pojo.Consume;

public interface ConsumeMapper {

	public Consume findById (String id);
	
	public void save (Consume consume);
	
	public void update (Consume consume);
	
	public void del (String id);
}
