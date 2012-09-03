package com.kaishengit.mapper;

import java.util.List;

import com.kaishengit.pojo.Consume;

public interface ConsumeMapper {

	public Consume findById (String id);
	
	public List<Consume> findByOrderId(String id);
	
	public Consume findByProduceId(Consume consume);
	
	public void save (Consume consume);
	
	public void update (Consume consume);
	
	public void del (String id);
}
