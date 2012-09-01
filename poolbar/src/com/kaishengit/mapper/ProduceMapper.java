package com.kaishengit.mapper;

import com.kaishengit.pojo.Produce;

public interface ProduceMapper {

	public Produce findById (String id);
	
	public void save (Produce produce);
	
	public void update (Produce produce);
	
	public void del (String id);
}
