package com.kaishengit.mapper;

import java.util.List;

import com.kaishengit.pojo.Desk;

public interface DeskMapper {

    public List<Desk> findAll(String barid);
    
	public Desk findById (int id);
	
	public void save (Desk desk);
	
	public void update (Desk desk);
	
	public void del (int id);
}
