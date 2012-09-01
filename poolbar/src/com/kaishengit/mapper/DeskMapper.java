package com.kaishengit.mapper;

import com.kaishengit.pojo.Desk;

public interface DeskMapper {

	public Desk findById (String id);
	
	public void save (Desk desk);
	
	public void update (Desk desk);
	
	public void del (String id);
}
