package com.kaishengit.mapper;

import java.util.List;

import com.kaishengit.pojo.Produce;

public interface ProduceMapper {

	public Produce findById (String id);
	
	public List<Produce> findByBarid (String barid);
	
	public void save (Produce produce);
	
	public void update (Produce produce);
	
	public void del (String id);
}
